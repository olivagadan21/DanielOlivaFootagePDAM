package com.danieloliva.FootageBackend.usuario.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetUsuarioProductoDto {

    private Long id;

    private String nombre;

    private String apellidos;

    private String username;

    private String email;

    private String avatar;

    private String localizacion;

    private boolean premium;

}
