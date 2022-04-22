package com.danieloliva.FootageBackend.dto.producto;

import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.service.CategoriaServiceImpl;
import com.danieloliva.FootageBackend.service.MarcaService;
import com.danieloliva.FootageBackend.service.SeccionService;
import com.danieloliva.FootageBackend.usuario.service.UsuarioService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ProductoDtoConverter {

    private final UsuarioService usuarioService;
    private final SeccionService seccionService;
    private final CategoriaServiceImpl categoriaServiceImpl;
    private final MarcaService marcaService;

    public Producto createProductoDtoToProducto (CreateProductoDto p) {

        return Producto.builder()
                .titulo(p.getTitulo())
                .descripcion(p.getDescripcion())
                .precio(p.getPrecio())
                .intercambio(p.isIntercambio())
                .original(p.isOriginal())
                .fotos(p.getFotos())
                .usuario(usuarioService.findById(p.getUsuario()).get())
                .seccion(seccionService.findById(p.getSeccion()).get())
                .categoria(categoriaServiceImpl.findById(p.getCategoria()).get())
                .marca(marcaService.findById(p.getMarca()).get())
                .build();

    }

}
