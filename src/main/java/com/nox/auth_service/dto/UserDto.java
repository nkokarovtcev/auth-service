package com.nox.auth_service.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "DTO, представляющий пользователя в системе")
public class UserDto {

    @Schema(description = "Уникальный идентификатор пользователя", example = "123e4567-e89b-12d3-a456-426614174000")
    private String id;

    @Schema(description = "Имя пользователя (логин)", example = "johndoe")
    private String username;

    @Schema(description = "Имя пользователя", example = "John")
    private String firstName;

    @Schema(description = "Фамилия пользователя", example = "Doe")
    private String lastName;

    @Schema(description = "Электронная почта пользователя", example = "john.doe@example.com")
    private String email;

    @Schema(description = "Флаг, подтверждена ли электронная почта пользователя", example = "true")
    private Boolean emailVerified;

    @Schema(description = "Флаг, активен ли пользователь", example = "true")
    private Boolean enabled;

    @Schema(description = "Список ролей, назначенных пользователю в системе", example = "[\"ROLE_USER\", \"ROLE_ADMIN\"]")
    private List<String> realmRoles;
}
