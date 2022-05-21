package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.dto.producto.GetProductoUsuarioDto;
import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetUsuarioDto {

    private Long id;

    private String nombre;

    private String apellidos;

    private String username;

    private String email;

    private String avatar;

    private String localizacion;

    private boolean premium;

    private RolUsuario rol;

    private List<GetProductoUsuarioDto> articulos = new ArrayList<>();

}
