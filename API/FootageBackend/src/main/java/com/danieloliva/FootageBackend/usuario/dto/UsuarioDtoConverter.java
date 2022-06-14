package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.dto.meGusta.MeGustaDtoConverter;
import com.danieloliva.FootageBackend.dto.producto.GetProductoUsuarioDto;
import com.danieloliva.FootageBackend.dto.producto.ProductoUsuarioDtoConverter;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class UsuarioDtoConverter {

    private final ProductoUsuarioDtoConverter productoDtoConverter;

    public GetUsuarioDto usuarioToGetUsuarioDto(Usuario usuario) {

        return GetUsuarioDto.builder()
                .id(usuario.getId())
                .nombre(usuario.getNombre())
                .apellidos(usuario.getApellidos())
                .username(usuario.getUsername())
                .email(usuario.getEmail())
                .avatar(usuario.getAvatar())
                .localizacion(usuario.getLocalizacion())
                .premium(usuario.isPremium())
                .rol(usuario.getRol())
                .articulos(usuario.getArticulos().stream().map(productoDtoConverter::getProductoUsuarioDto).toList())
                .meGustas(usuario.getMeGustas().stream().map(meGusta -> {
                    return productoDtoConverter.getProductoUsuarioDto(meGusta.getProducto());
                }).toList())
                .build();
    }

    public GetUsuarioProductoDto usuarioToGetUsuarioProductoDto(Usuario usuario) {
        return GetUsuarioProductoDto.builder()
                .id(usuario.getId())
                .nombre(usuario.getNombre())
                .apellidos(usuario.getApellidos())
                .username(usuario.getUsername())
                .email(usuario.getEmail())
                .avatar(usuario.getAvatar())
                .localizacion(usuario.getLocalizacion())
                .premium(usuario.isPremium())
                .articulos(usuario.getArticulos().stream().map(productoDtoConverter::getProductoUsuarioDto).toList())
                .build();
    }

}
