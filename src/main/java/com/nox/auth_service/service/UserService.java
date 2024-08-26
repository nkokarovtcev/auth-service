package com.nox.auth_service.service;

import com.nox.auth_service.dto.PasswordChangeRequestDto;
import com.nox.auth_service.dto.UserDto;

import java.security.Principal;
import java.util.List;

public interface UserService {
    List<UserDto> getUsers();

    UserDto createUser(UserDto userDto);

    UserDto getUser(String userId);

    UserDto updateUser(String userId, UserDto userUpdateRequestDto);

    void deleteUser(String userId);

    void changePassword(String userId, PasswordChangeRequestDto passwordChangeRequestDto);

    void changeOwnPassword(PasswordChangeRequestDto passwordChangeRequestDto, Principal principal);
}
