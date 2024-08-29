package com.nox.auth_service.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "DTO, представляющий запрос на изменение пароля пользователя")
public class PasswordChangeRequestDto {

    @Schema(description = "Новый пароль пользователя", example = "newPassword123!")
    private String password;
}