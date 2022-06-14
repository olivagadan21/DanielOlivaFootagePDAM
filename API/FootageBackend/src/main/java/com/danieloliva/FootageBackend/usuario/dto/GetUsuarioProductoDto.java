package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.dto.producto.GetProductoUsuarioDto;
import lombok.*;

import java.util.List;

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

    private List<GetProductoUsuarioDto> articulos;

}
