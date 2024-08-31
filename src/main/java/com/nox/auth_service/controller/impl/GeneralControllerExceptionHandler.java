package com.nox.auth_service.controller.impl;

import com.nox.auth_service.dto.ErrorResponseDto;
import jakarta.ws.rs.ClientErrorException;
import jakarta.ws.rs.core.Response;
import lombok.extern.slf4j.Slf4j;
import org.keycloak.util.JsonSerialization;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authorization.AuthorizationDeniedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Map;

@RestControllerAdvice(basePackages = "com.nox.auth_service.controller")
@SuppressWarnings("unused")
@Slf4j
public class GeneralControllerExceptionHandler {

    @ExceptionHandler(ClientErrorException.class)
    public ResponseEntity<ErrorResponseDto> handleClientErrorException(ClientErrorException e) throws IOException {
        log.error("An error occurred: ", e);
        Response response = e.getResponse();
        ErrorResponseDto errorResponse = new ErrorResponseDto();
        errorResponse.setStatus(response.getStatus());
        errorResponse.setReason(response.getStatusInfo().getReasonPhrase());
        if (response.getEntity() != null && response.getEntity() instanceof ByteArrayInputStream stream) {
            errorResponse.setErrorDetails(JsonSerialization.readValue(stream, Map.class));
        }
        return ResponseEntity.status(response.getStatus()).body(errorResponse);
    }

    @ExceptionHandler(AuthorizationDeniedException.class)
    public ResponseEntity<ErrorResponseDto> handleAuthorizationDeniedException(AuthorizationDeniedException e) {
        log.error("An error occurred: ", e);
        ErrorResponseDto errorResponse = new ErrorResponseDto();
        errorResponse.setStatus(HttpStatus.FORBIDDEN.value());
        errorResponse.setReason("Access Denied");
        errorResponse.setErrorDetails(Map.of("message", e.getMessage()));
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(errorResponse);
    }


    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponseDto> handleException(Exception e) {
        log.error("An error occurred: ", e);
        ErrorResponseDto errorResponse = new ErrorResponseDto();
        errorResponse.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
        errorResponse.setReason("Internal Server Error");
        errorResponse.setErrorDetails(Map.of("message", e.getMessage()));
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR.value()).body(errorResponse);
    }
}
