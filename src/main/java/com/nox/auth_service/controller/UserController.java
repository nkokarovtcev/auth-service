package com.nox.auth_service.controller;

import com.nox.auth_service.dto.PasswordChangeRequestDto;
import com.nox.auth_service.dto.SuccessfulResponseDto;
import com.nox.auth_service.dto.UserDto;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

public interface UserController {
    String HAS_ROLE_ADMIN = "hasRole('ROLE_ADMIN')";
    String MESSAGE_USER_UPDATED = "Пользователь успешно удален";
    String MESSAGE_PASSWORD_CHANGED = "Пароль успешно изменен";

    @Operation(summary = "Получить всех пользователей",
            description = "Получает список всех пользователей. Требуется роль администратора.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Успешное получение списка пользователей", content = @Content(mediaType = "application/json", schema = @Schema(implementation = UserDto.class))),
            @ApiResponse(responseCode = "403", description = "Доступ запрещен"),
            @ApiResponse(responseCode = "500", description = "Внутренняя ошибка сервера")
    })
    @PreAuthorize(HAS_ROLE_ADMIN)
    @GetMapping
    List<UserDto> getUsers();

    @Operation(summary = "Получить пользователя по ID",
            description = "Получает пользователя по его ID. Требуется роль администратора.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Успешное получение пользователя", content = @Content(mediaType = "application/json", schema = @Schema(implementation = UserDto.class))),
            @ApiResponse(responseCode = "403", description = "Доступ запрещен"),
            @ApiResponse(responseCode = "404", description = "Пользователь не найден"),
            @ApiResponse(responseCode = "500", description = "Внутренняя ошибка сервера")
    })
    @PreAuthorize(HAS_ROLE_ADMIN)
    @GetMapping("/{userId}")
    UserDto getUser(
            @Parameter(description = "ID пользователя, которого нужно получить", required = true)
            @PathVariable String userId);

    @Operation(summary = "Создать нового пользователя",
            description = "Создает нового пользователя с предоставленными данными. Требуется роль администратора.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Пользователь успешно создан", content = @Content(mediaType = "application/json", schema = @Schema(implementation = UserDto.class))),
            @ApiResponse(responseCode = "400", description = "Неверные данные запроса"),
            @ApiResponse(responseCode = "403", description = "Доступ запрещен"),
            @ApiResponse(responseCode = "500", description = "Внутренняя ошибка сервера")
    })
    @PreAuthorize(HAS_ROLE_ADMIN)
    @PostMapping
    UserDto createUser(
            @Parameter(description = "Данные нового пользователя", required = true)
            @RequestBody UserDto userDto);

    @Operation(summary = "Обновить пользователя по ID",
            description = "Обновляет данные пользователя по его ID. Требуется роль администратора.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Пользователь успешно обновлен", content = @Content(mediaType = "application/json", schema = @Schema(implementation = UserDto.class))),
            @ApiResponse(responseCode = "400", description = "Неверные данные запроса"),
            @ApiResponse(responseCode = "403", description = "Доступ запрещен"),
            @ApiResponse(responseCode = "404", description = "Пользователь не найден"),
            @ApiResponse(responseCode = "500", description = "Внутренняя ошибка сервера")
    })
    @PreAuthorize(HAS_ROLE_ADMIN)
    @PutMapping("/{userId}")
    UserDto updateUser(
            @Parameter(description = "ID пользователя, которого нужно обновить", required = true)
            @PathVariable String userId,
            @Parameter(description = "Обновленные данные пользователя", required = true)
            @RequestBody UserDto userUpdateRequestDto);

    @Operation(summary = "Удалить пользователя по ID",
            description = "Удаляет пользователя по его ID. Требуется роль администратора.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Пользователь успешно удален", content = @Content(mediaType = "application/json", schema = @Schema(implementation = SuccessfulResponseDto.class))),
            @ApiResponse(responseCode = "403", description = "Доступ запрещен"),
            @ApiResponse(responseCode = "404", description = "Пользователь не найден"),
            @ApiResponse(responseCode = "500", description = "Внутренняя ошибка сервера")
    })
    @PreAuthorize(HAS_ROLE_ADMIN)
    @DeleteMapping("/{userId}")
    ResponseEntity<SuccessfulResponseDto> deleteUser(
            @Parameter(description = "ID пользователя, которого нужно удалить", required = true)
            @PathVariable String userId);

    @Operation(summary = "Изменить пароль пользователя по ID",
            description = "Изменяет пароль пользователя по его ID. Требуется роль администратора.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Пароль успешно изменен", content = @Content(mediaType = "application/json", schema = @Schema(implementation = SuccessfulResponseDto.class))),
            @ApiResponse(responseCode = "400", description = "Неверные данные запроса"),
            @ApiResponse(responseCode = "403", description = "Доступ запрещен"),
            @ApiResponse(responseCode = "404", description = "Пользователь не найден"),
            @ApiResponse(responseCode = "500", description = "Внутренняя ошибка сервера")
    })
    @PreAuthorize(HAS_ROLE_ADMIN)
    @PostMapping("/{userId}/password")
    ResponseEntity<SuccessfulResponseDto> changePassword(
            @Parameter(description = "ID пользователя, пароль которого нужно изменить", required = true)
            @PathVariable String userId,
            @Parameter(description = "Новый пароль", required = true)
            @RequestBody PasswordChangeRequestDto passwordChangeRequestDto);

    @Operation(summary = "Изменить собственный пароль",
            description = "Изменяет пароль текущего авторизованного пользователя.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Пароль успешно изменен", content = @Content(mediaType = "application/json", schema = @Schema(implementation = SuccessfulResponseDto.class))),
            @ApiResponse(responseCode = "400", description = "Неверные данные запроса"),
            @ApiResponse(responseCode = "500", description = "Внутренняя ошибка сервера")
    })
    @PostMapping("/password")
    ResponseEntity<SuccessfulResponseDto> changeOwnPassword(
            @Parameter(description = "Новый пароль", required = true)
            @RequestBody PasswordChangeRequestDto passwordChangeRequestDto,
            Principal principal);
}
