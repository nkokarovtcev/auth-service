package com.nox.auth_service.controller;

import com.nox.auth_service.dto.PasswordChangeRequestDto;
import com.nox.auth_service.dto.SuccessfulResponseDto;
import com.nox.auth_service.dto.UserDto;
import com.nox.auth_service.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
@SuppressWarnings("unused")
public class UserController {
    public static final String HAS_ROLE_ADMIN = "hasRole('ROLE_ADMIN')";
    private final UserService userService;

    @PreAuthorize(HAS_ROLE_ADMIN)
    @GetMapping
    public List<UserDto> getUsers() {
        return userService.getUsers();
    }

    @PreAuthorize(HAS_ROLE_ADMIN)
    @GetMapping("/{userId}")
    public UserDto getUser(@PathVariable String userId) {
        return userService.getUser(userId);
    }

    @PreAuthorize(HAS_ROLE_ADMIN)
    @PostMapping
    public UserDto createUser(@RequestBody UserDto userDto) {
        return userService.createUser(userDto);
    }

    @PreAuthorize(HAS_ROLE_ADMIN)
    @PutMapping("/{userId}")
    public UserDto updateUser(@PathVariable String userId, @RequestBody UserDto userUpdateRequestDto) {
        return userService.updateUser(userId, userUpdateRequestDto);
    }

    @PreAuthorize(HAS_ROLE_ADMIN)
    @DeleteMapping("/{userId}")
    public ResponseEntity<SuccessfulResponseDto> deleteUser(@PathVariable String userId) {
        userService.deleteUser(userId);
        return ResponseEntity.ok(new SuccessfulResponseDto("User deleted successfully"));
    }

    @PreAuthorize(HAS_ROLE_ADMIN)
    @PostMapping("/{userId}/password")
    public ResponseEntity<SuccessfulResponseDto> changePassword(@PathVariable String userId, @RequestBody PasswordChangeRequestDto passwordChangeRequestDto) {
        userService.changePassword(userId, passwordChangeRequestDto);
        return ResponseEntity.ok(new SuccessfulResponseDto("Password changed successfully"));
    }

    @PostMapping("/password")
    public ResponseEntity<SuccessfulResponseDto> changeOwnPassword(@RequestBody PasswordChangeRequestDto passwordChangeRequestDto, Principal principal) {
        userService.changeOwnPassword(passwordChangeRequestDto, principal);
        return ResponseEntity.ok(new SuccessfulResponseDto("Password changed successfully"));
    }
}