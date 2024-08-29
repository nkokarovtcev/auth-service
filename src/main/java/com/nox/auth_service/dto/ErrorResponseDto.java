package com.nox.auth_service.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Map;

@Data
@Schema(description = "DTO, представляющий ответ с ошибкой от сервера")
public class ErrorResponseDto {

    @Schema(description = "HTTP статус код ошибки", example = "404")
    private int status;

    @Schema(description = "Краткое описание причины ошибки", example = "Ресурс не найден")
    private String reason;

    @Schema(description = "Дополнительные детали об ошибке", example = "{ \"field\": \"username\", \"message\": \"Имя пользователя не может быть пустым\" }")
    private Map<String, Object> errorDetails;
}
