package com.danieloliva.FootageBackend.security.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JwtUsuarioResponse {

    private Long id;
    private String email;
    private String nombre;
    private String apellidos;
    private String avatar;
    private String rol;
    private String token;
    private String username;
    private String localizacion;
    private boolean premium;

}