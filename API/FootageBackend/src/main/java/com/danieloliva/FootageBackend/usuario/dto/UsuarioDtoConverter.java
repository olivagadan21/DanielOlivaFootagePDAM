package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.dto.producto.ProductoUsuarioDtoConverter;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.service.base.ProductoService;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UsuarioDtoConverter {

    private final ProductoService productoService;
    private final ProductoUsuarioDtoConverter productoDtoConverter;

    public GetUsuarioDto usuarioToGetUsuarioDto(Usuario usuario) {

        productoService.findByUsuario(usuario.getId()).stream().map(producto -> usuario.getArticulos().add(producto)).toList();

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
        productoService.findByUsuario(usuario.getId()).stream().map(producto -> usuario.getArticulos().add(producto)).toList();
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
                .meGustas(usuario.getMeGustas().stream().map(meGusta -> {
                    return productoDtoConverter.getProductoUsuarioDto(meGusta.getProducto());
                }).toList())
                .build();
    }

}
