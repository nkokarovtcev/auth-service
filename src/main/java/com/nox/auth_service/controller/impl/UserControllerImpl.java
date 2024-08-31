package com.nox.auth_service.controller.impl;

import com.nox.auth_service.controller.UserController;
import com.nox.auth_service.dto.PasswordChangeRequestDto;
import com.nox.auth_service.dto.SuccessfulResponseDto;
import com.nox.auth_service.dto.UserDto;
import com.nox.auth_service.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
@SuppressWarnings("unused")
public class UserControllerImpl implements UserController {
    private final UserService userService;

    @Override
    @PreAuthorize(HAS_ROLE_ADMIN)
    public List<UserDto> getUsers() {
        return userService.getUsers();
    }

    @Override
    @PreAuthorize(HAS_ROLE_ADMIN)
    public UserDto getUser(
            @PathVariable String userId) {
        return userService.getUser(userId);
    }

    @Override
    @PreAuthorize(HAS_ROLE_ADMIN)
    public UserDto createUser(
            @RequestBody UserDto userDto) {
        return userService.createUser(userDto);
    }

    @Override
    @PreAuthorize(HAS_ROLE_ADMIN)
    public UserDto updateUser(
            @PathVariable String userId,
            @RequestBody UserDto userUpdateRequestDto) {
        return userService.updateUser(userId, userUpdateRequestDto);
    }

    @Override
    @PreAuthorize(HAS_ROLE_ADMIN)
    public ResponseEntity<SuccessfulResponseDto> deleteUser(
            @PathVariable String userId) {
        userService.deleteUser(userId);
        return ResponseEntity.ok(new SuccessfulResponseDto(MESSAGE_USER_UPDATED));
    }

    @Override
    @PreAuthorize(HAS_ROLE_ADMIN)
    public ResponseEntity<SuccessfulResponseDto> changePassword(
            @PathVariable String userId,
            @RequestBody PasswordChangeRequestDto passwordChangeRequestDto) {
        userService.changePassword(userId, passwordChangeRequestDto);
        return ResponseEntity.ok(new SuccessfulResponseDto(MESSAGE_PASSWORD_CHANGED));
    }

    @Override
    public ResponseEntity<SuccessfulResponseDto> changeOwnPassword(
            @RequestBody PasswordChangeRequestDto passwordChangeRequestDto,
            Principal principal) {
        userService.changeOwnPassword(passwordChangeRequestDto, principal);
        return ResponseEntity.ok(new SuccessfulResponseDto(MESSAGE_PASSWORD_CHANGED));
    }
}
