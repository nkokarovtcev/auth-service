package com.nox.auth_service.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Schema(description = "DTO, представляющий успешный ответ от сервера")
public class SuccessfulResponseDto {

    @Schema(description = "Сообщение о результате операции", example = "Операция выполнена успешно")
    private String result;
}