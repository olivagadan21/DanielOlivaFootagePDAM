package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UsuarioDtoConverter {

    private final PasswordEncoder passwordEncoder;

    public Usuario createUsuarioUserDtoToUsuario (CreateUsuarioDto createUsuarioDto) {

        if (!createUsuarioDto.getPassword().equals(createUsuarioDto.getPassword2()))
            return null;
        else
            return Usuario.builder()
                    .nombre(createUsuarioDto.getNombre())
                    .apellidos(createUsuarioDto.getApellidos())
                    .username(createUsuarioDto.getUsername())
                    .email(createUsuarioDto.getEmail())
                    .password(passwordEncoder.encode(createUsuarioDto.getPassword()))
                    .premium(false)
                    .rol(RolUsuario.USER)
                    .build();
    }

    public Usuario createUsuarioAdminDtoToUsuario (CreateUsuarioDto createUsuarioDto) {

        if (!createUsuarioDto.getPassword().equals(createUsuarioDto.getPassword2()))
            return null;
        else
            return Usuario.builder()
                    .nombre(createUsuarioDto.getNombre())
                    .apellidos(createUsuarioDto.getApellidos())
                    .username(createUsuarioDto.getUsername())
                    .email(createUsuarioDto.getEmail())
                    .password(passwordEncoder.encode(createUsuarioDto.getPassword()))
                    .premium(false)
                    .rol(RolUsuario.ADMIN)
                    .build();
    }

    public GetUsuarioDto usuarioToGetUsuarioDto (Usuario usuario){
        return GetUsuarioDto.builder()
                .nombre(usuario.getNombre())
                .apellidos(usuario.getApellidos())
                .username(usuario.getUsername())
                .email(usuario.getEmail())
                .avatar(usuario.getAvatar())
                .localizacion(usuario.getLocalizacion())
                .premium(usuario.isPremium())
                .rol(usuario.getRol())
                .build();
    }

}
