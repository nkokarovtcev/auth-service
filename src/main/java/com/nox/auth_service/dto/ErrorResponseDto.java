package com.nox.auth_service.dto;

import lombok.Data;

import java.util.Map;

@Data
public class ErrorResponseDto {
    private int status;
    private String reason;
    private Map<String, Object> errorDetails;
}
