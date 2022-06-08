package com.danieloliva.FootageBackend.dto.producto;

import com.danieloliva.FootageBackend.model.Producto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ProductoUsuarioDtoConverter {

    public GetProductoUsuarioDto getProductoUsuarioDto (Producto producto) {
        return GetProductoUsuarioDto.builder()
                .id(producto.getId())
                .titulo(producto.getTitulo())
                .precio(producto.getPrecio())
                .original(producto.isOriginal())
                .foto(producto.getFoto())
                .marca(producto.getMarca())
                .talla(producto.getTalla())
                .build();
    }

}
