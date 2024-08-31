package com.nox.auth_service.service;

import com.nox.auth_service.dto.UserDto;
import com.nox.auth_service.service.impl.UserServiceImpl;
import jakarta.ws.rs.ClientErrorException;
import jakarta.ws.rs.core.Response;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.admin.client.resource.UserResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.UserRepresentation;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock
    UserService userService;
    @Mock
    Keycloak keycloak;
    @Mock
    RealmResource realmResource;
    @Mock
    UsersResource usersResource;
    @Mock
    UserResource userResource;
    @InjectMocks
    UserServiceImpl userServiceImpl;

    @Test
    void getUsers() {
        UserRepresentation userRepresentation1 = new UserRepresentation();
        userRepresentation1.setId("1");
        UserRepresentation userRepresentation2 = new UserRepresentation();
        userRepresentation2.setId("2");
        List<UserRepresentation> userRepresentations = Arrays.asList(userRepresentation1, userRepresentation2);

        when(keycloak.realm(null)).thenReturn(realmResource);
        when(realmResource.users()).thenReturn(usersResource);
        when(usersResource.list()).thenReturn(userRepresentations);

        UserDto user1 = new UserDto();
        user1.setId("1");
        UserDto user2 = new UserDto();
        user2.setId("2");
        List<UserDto> users = Arrays.asList(user1, user2);

        List<UserDto> result = userServiceImpl.getUsers();

        assertEquals(users, result);
        verify(keycloak, times(1)).realm(null);
        verify(realmResource, times(1)).users();
        verify(usersResource, times(1)).list();
    }

    @Test
    void createUser() {
        UserDto userDto = new UserDto();
        userDto.setId("3");

        Response response = mock(Response.class);
        Response.StatusType statusInfo = Response.Status.fromStatusCode(HttpStatus.CREATED.value());
        when(response.getStatusInfo()).thenReturn(statusInfo);
        when(response.getStatus()).thenReturn(HttpStatus.CREATED.value());
        when(keycloak.realm(null)).thenReturn(realmResource);
        when(realmResource.users()).thenReturn(usersResource);
        when(usersResource.create(any(UserRepresentation.class))).thenReturn(response);

        UserDto result = userServiceImpl.createUser(userDto);

        assertEquals(userDto, result);
        verify(keycloak, times(2)).realm(null);
        verify(realmResource, times(2)).users();
    }

    @Test
    void createDuplicateUserExceptionTest() {
        UserDto userDto = new UserDto();
        userDto.setId("3");

        Response response = mock(Response.class);
        Response.StatusType statusInfo = Response.Status.fromStatusCode(HttpStatus.CONFLICT.value());
        when(response.getStatusInfo()).thenReturn(statusInfo);
        when(response.getStatus()).thenReturn(HttpStatus.CONFLICT.value());
        when(keycloak.realm(null)).thenReturn(realmResource);
        when(realmResource.users()).thenReturn(usersResource);
        when(usersResource.create(any(UserRepresentation.class))).thenReturn(response);

        ClientErrorException thrown = assertThrows(ClientErrorException.class, () -> userServiceImpl.createUser(userDto));

        assertEquals(HttpStatus.CONFLICT.value(), thrown.getResponse().getStatus());
        verify(keycloak, times(1)).realm(null);
        verify(realmResource, times(1)).users();
    }

    @Test
    void getUser() {
        UserRepresentation userRepresentation = new UserRepresentation();
        userRepresentation.setId("1");

        when(keycloak.realm(null)).thenReturn(realmResource);
        when(realmResource.users()).thenReturn(usersResource);
        when(usersResource.get("1")).thenReturn(userResource);
        when(userResource.toRepresentation()).thenReturn(userRepresentation);

        UserDto expectedUser = new UserDto();
        expectedUser.setId("1");

        UserDto result = userServiceImpl.getUser(userRepresentation.getId());

        assertEquals(expectedUser, result);
        verify(keycloak, times(1)).realm(null);
        verify(realmResource, times(1)).users();
        verify(usersResource, times(1)).get(userRepresentation.getId());
    }

    @Test
    void updateUser() {
        UserDto userDto = new UserDto();
        userDto.setId("1");

        UserRepresentation userRepresentation = new UserRepresentation();
        userRepresentation.setId("1");

        when(keycloak.realm(null)).thenReturn(realmResource);
        when(realmResource.users()).thenReturn(usersResource);
        when(usersResource.get(userDto.getId())).thenReturn(userResource);
        when(userResource.toRepresentation()).thenReturn(userRepresentation);

        UserDto result = userServiceImpl.updateUser(userDto.getId(), userDto);

        assertEquals(userDto, result);
        verify(keycloak, times(1)).realm(null);
        verify(realmResource, times(1)).users();
        verify(usersResource, times(1)).get(userDto.getId());
    }

    @Test
    void deleteUser() {
        String userId = "1";

        when(keycloak.realm(null)).thenReturn(realmResource);
        when(realmResource.users()).thenReturn(usersResource);
        when(usersResource.get(userId)).thenReturn(userResource);
        doNothing().when(userResource).remove();

        userServiceImpl.deleteUser(userId);

        verify(keycloak, times(1)).realm(null);
        verify(realmResource, times(1)).users();
        verify(usersResource, times(1)).get(userId);
        verify(userResource, times(1)).remove();
    }
}