package com.nox.auth_service.dto;

import lombok.Data;

import java.util.List;

@Data
public class UserDto {
    private String id;
    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private Boolean emailVerified;
    private Boolean enabled;
    private List<String> realmRoles;
}
