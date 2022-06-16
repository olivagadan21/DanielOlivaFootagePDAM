package com.danieloliva.FootageBackend.dto.meGusta;

import com.danieloliva.FootageBackend.dto.producto.ProductoUsuarioDtoConverter;
import com.danieloliva.FootageBackend.model.MeGusta;
import com.danieloliva.FootageBackend.usuario.dto.UsuarioDtoConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class MeGustaDtoConverter {

    private final ProductoUsuarioDtoConverter productoUsuarioDtoConverter;
    private final UsuarioDtoConverter usuarioDtoConverter;

    public GetMeGustaDto getMeGustaDto (MeGusta meGusta) {

        return GetMeGustaDto.builder()
                .meGustaPk(meGusta.getId())
                .getProductoUsuarioDto(productoUsuarioDtoConverter.getProductoUsuarioDto(meGusta.getProducto()))
                .getUsuarioProductoDto(usuarioDtoConverter.usuarioToGetUsuarioProductoDto(meGusta.getUsuario()))
                .build();

    }

}
