package com.nox.auth_service.service.impl;

import com.nox.auth_service.dto.PasswordChangeRequestDto;
import com.nox.auth_service.dto.UserDto;
import com.nox.auth_service.service.UserService;
import jakarta.ws.rs.ClientErrorException;
import jakarta.ws.rs.core.Response;
import lombok.RequiredArgsConstructor;
import org.keycloak.admin.client.CreatedResponseUtil;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.UserResource;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
@SuppressWarnings("unused")
public class UserServiceImpl implements UserService {
    private final Keycloak keycloak;
    @Value("${keycloak.realm}")
    private String realm;

    private static UserRepresentation getUserRepresentation(UserDto userDto) {
        UserRepresentation user = new UserRepresentation();
        user.setUsername(userDto.getUsername());
        user.setEmail(userDto.getEmail());
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setRealmRoles(userDto.getRealmRoles());
        return user;
    }

    private static CredentialRepresentation getCredentialRepresentation(PasswordChangeRequestDto passwordChangeRequestDto) {
        CredentialRepresentation credential = new CredentialRepresentation();
        credential.setType(CredentialRepresentation.PASSWORD);
        credential.setValue(passwordChangeRequestDto.getPassword());
        credential.setTemporary(false);
        return credential;
    }

    @Override
    public List<UserDto> getUsers() {
        return keycloak.realm(realm).users().list().stream()
                .map(this::getUserDto)
                .toList();
    }

    @Override
    public UserDto createUser(UserDto userDto) {
        UserRepresentation user = getUserRepresentation(userDto);

        user.setEnabled(true);
        user.setEmailVerified(true);

        Response response = keycloak.realm(realm).users().create(user);
        if (HttpStatus.CREATED.value() != response.getStatus()) {
            throw new ClientErrorException(response.getStatus() + " " + response.getStatusInfo().getReasonPhrase(), response.getStatus());
        }
        userDto.setId(CreatedResponseUtil.getCreatedId(response));
        UserResource userResource = keycloak.realm(realm).users().get(userDto.getId());
        setUserRoles(userDto, userResource);

        return userDto;
    }

    private void setUserRoles(UserDto userDto, UserResource userResource) {
        if (userDto.getRealmRoles() != null) {
            userDto.getRealmRoles().forEach(role ->
                    userResource
                            .roles()
                            .realmLevel()
                            .add(
                                    Collections.singletonList(
                                            keycloak.realm(realm).roles()
                                                    .get(role)
                                                    .toRepresentation()
                                    )
                            )
            );
        }
    }

    @Override
    public UserDto getUser(String userId) {
        UserRepresentation representation = keycloak.realm(realm).users().get(userId).toRepresentation();
        return getUserDto(representation);
    }

    @Override
    public UserDto updateUser(String userId, UserDto userUpdateRequestDto) {
        UserResource userResource = keycloak.realm(realm).users().get(userId);
        UserRepresentation user = userResource.toRepresentation();

        user.setFirstName(userUpdateRequestDto.getFirstName());
        user.setLastName(userUpdateRequestDto.getLastName());
        user.setEmail(userUpdateRequestDto.getEmail());
        user.setUsername(userUpdateRequestDto.getUsername());

        userResource.update(user);

        setUserRoles(userUpdateRequestDto, userResource);
        return userUpdateRequestDto;
    }

    @Override
    public void deleteUser(String userId) {
        keycloak.realm(realm).users().get(userId).remove();
    }

    @Override
    public void changePassword(String userId, PasswordChangeRequestDto passwordChangeRequestDto) {
        CredentialRepresentation credential = getCredentialRepresentation(passwordChangeRequestDto);
        keycloak.realm(realm).users().get(userId).resetPassword(credential);
    }

    @Override
    public void changeOwnPassword(PasswordChangeRequestDto passwordChangeRequestDto, Principal principal) {
        String currentUser = principal.getName();
        UserRepresentation user = keycloak.realm(realm).users().get(currentUser).toRepresentation();
        CredentialRepresentation credential = getCredentialRepresentation(passwordChangeRequestDto);
        keycloak.realm(realm).users().get(user.getId()).resetPassword(credential);
    }

    private UserDto getUserDto(UserRepresentation user) {
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setUsername(user.getUsername());
        userDto.setEmail(user.getEmail());
        userDto.setFirstName(user.getFirstName());
        userDto.setLastName(user.getLastName());
        return userDto;
    }
}
