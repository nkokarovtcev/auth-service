package com.nox.auth_service.controller;

import com.nox.auth_service.dto.PasswordChangeRequestDto;
import com.nox.auth_service.dto.UserDto;
import com.nox.auth_service.service.UserService;
import jakarta.ws.rs.ClientErrorException;
import jakarta.ws.rs.core.Response;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
public class UserControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserService userService;

    private List<UserDto> users;
    private UserDto user;

    @BeforeEach
    public void setup() {
        UserDto user1 = new UserDto();
        UserDto user2 = new UserDto();
        users = Arrays.asList(user1, user2);
        user = user1;
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    public void getUsersTestWithAdmin() throws Exception {
        when(userService.getUsers()).thenReturn(users);

        mockMvc.perform(get("/api/users")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "USER")
    public void getUsersTestWithUser() throws Exception {
        mockMvc.perform(get("/api/users")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden())
                .andDo(print());
    }

    @Test
    public void getUsersTestWithoutUser() throws Exception {
        mockMvc.perform(get("/api/users")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isUnauthorized())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void getUserWithAdmin() throws Exception {
        when(userService.getUser("1")).thenReturn(user);

        mockMvc.perform(get("/api/users/1")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void getUserNotFoundWithUser() throws Exception {
        when(userService.getUser("1")).thenThrow(new ClientErrorException(Response.Status.NOT_FOUND));
        mockMvc.perform(get("/api/users/1")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "USER")
    void getUserWithUser() throws Exception {
        mockMvc.perform(get("/api/users/1")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden())
                .andDo(print());
    }

    @Test
    void getUserWithoutUser() throws Exception {
        mockMvc.perform(get("/api/users/1")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isUnauthorized())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void createUserWithAdmin() throws Exception {
        UserDto newUser = new UserDto();
        newUser.setUsername("test");
        when(userService.createUser(any(UserDto.class))).thenReturn(newUser);

        mockMvc.perform(post("/api/users")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"name\":\"test\"}"))
                .andExpect(status().isOk())
                .andExpect(content().json("{\"username\":\"test\"}"))
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "USER")
    void createUserWithUser() throws Exception {
        mockMvc.perform(post("/api/users")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"name\":\"test\"}"))
                .andExpect(status().isForbidden())
                .andDo(print());
    }

    @Test
    void createUserWithoutUser() throws Exception {
        mockMvc.perform(post("/api/users")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"name\":\"test\"}"))
                .andExpect(status().isUnauthorized())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void updateUserWithAdmin() throws Exception {
        UserDto updatedUser = new UserDto();
        updatedUser.setUsername("updatedTest");
        when(userService.updateUser(eq("1"), any(UserDto.class))).thenReturn(updatedUser);

        mockMvc.perform(put("/api/users/1")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"username\":\"updatedTest\"}"))
                .andExpect(status().isOk())
                .andExpect(content().json("{\"username\":\"updatedTest\"}"))
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "USER")
    void updateUserWithUser() throws Exception {
        mockMvc.perform(put("/api/users/1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"username\":\"updatedTest\"}"))
                .andExpect(status().isForbidden())
                .andDo(print());
    }

    @Test
    void updateUserWithoutUser() throws Exception {
        mockMvc.perform(put("/api/users/1")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"username\":\"updatedTest\"}"))
                .andExpect(status().isUnauthorized())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void deleteUserWithAdmin() throws Exception {
        doNothing().when(userService).deleteUser("1");

        mockMvc.perform(delete("/api/users/1")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "USER")
    void deleteUserWithUser() throws Exception {
        mockMvc.perform(delete("/api/users/1")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden())
                .andDo(print());
    }

    @Test
    void deleteUserWithoutUser() throws Exception {
        mockMvc.perform(delete("/api/users/1")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isUnauthorized())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void changePasswordWithAdmin() throws Exception {
        PasswordChangeRequestDto passwordChangeRequestDto = new PasswordChangeRequestDto();
        passwordChangeRequestDto.setPassword("new");
        doNothing().when(userService).changePassword("1", passwordChangeRequestDto);

        mockMvc.perform(post("/api/users/1/password")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"password\":\"new\"}"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "USER")
    void changePasswordWithUser() throws Exception {
        mockMvc.perform(post("/api/users/1/password")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"password\":\"new\"}"))
                .andExpect(status().isForbidden())
                .andDo(print());
    }

    @Test
    void changePasswordWithoutUser() throws Exception {
        mockMvc.perform(post("/api/users/1/password")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"password\":\"new\"}"))
                .andExpect(status().isUnauthorized())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void changeOwnPasswordWithAdmin() throws Exception {
        PasswordChangeRequestDto passwordChangeRequestDto = new PasswordChangeRequestDto();
        passwordChangeRequestDto.setPassword("new");
        doNothing().when(userService).changeOwnPassword(any(PasswordChangeRequestDto.class), any(Principal.class));

        mockMvc.perform(post("/api/users/password")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"password\":\"new\"}"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    @WithMockUser(roles = "USER")
    void changeOwnPasswordWithUser() throws Exception {
        PasswordChangeRequestDto passwordChangeRequestDto = new PasswordChangeRequestDto();
        passwordChangeRequestDto.setPassword("new");
        doNothing().when(userService).changeOwnPassword(any(PasswordChangeRequestDto.class), any(Principal.class));

        mockMvc.perform(post("/api/users/password")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"password\":\"new\"}"))
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    void changeOwnPasswordWithoutUser() throws Exception {
        mockMvc.perform(post("/api/users/password")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"password\":\"new\"}"))
                .andExpect(status().isUnauthorized())
                .andDo(print());
    }
}