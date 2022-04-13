package com.danieloliva.FootageBackend.dto;

import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.model.Seccion;
import com.danieloliva.FootageBackend.service.CategoriaService;
import com.danieloliva.FootageBackend.service.MarcaService;
import com.danieloliva.FootageBackend.service.SeccionService;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import com.danieloliva.FootageBackend.usuario.service.UsuarioService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.text.DecimalFormat;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ProductoDtoConverter {

    private final UsuarioService usuarioService;
    private final SeccionService seccionService;
    private final CategoriaService categoriaService;
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
                .categoria(categoriaService.findById(p.getCategoria()).get())
                .marca(marcaService.findById(p.getMarca()).get())
                .build();

    }

}
