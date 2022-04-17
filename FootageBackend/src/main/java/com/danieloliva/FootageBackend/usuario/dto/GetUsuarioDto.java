package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetUsuarioDto {

    private String nombre;

    private String apellidos;

    private String username;

    private String email;

    private String avatar;

    private String localizacion;

    private boolean premium;

    private RolUsuario rol;

}
