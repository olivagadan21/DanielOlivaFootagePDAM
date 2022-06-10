package com.danieloliva.FootageBackend.dto.producto;

import com.danieloliva.FootageBackend.dto.meGusta.MeGustaDtoConverter;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.service.base.*;
import com.danieloliva.FootageBackend.usuario.dto.UsuarioDtoConverter;
import com.danieloliva.FootageBackend.usuario.service.UsuarioService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Component
@RequiredArgsConstructor
public class ProductoDtoConverter {

    private final UsuarioService usuarioService;
    private final SeccionService seccionService;
    private final CategoriaService categoriaService;
    private final MarcaService marcaService;
    private final StorageService storageService;
    private final TallaService tallaService;
    private final UsuarioDtoConverter usuarioDtoConverter;

    public Producto createProductoDtoToProducto (CreateProductoDto p, MultipartFile file) {

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        return Producto.builder()
                .titulo(p.getTitulo())
                .descripcion(p.getDescripcion())
                .precio(p.getPrecio())
                .intercambio(p.isIntercambio())
                .original(p.isOriginal())
                .foto(uri)
                .usuario(usuarioService.findById(p.getUsuario()).get())
                .seccion(seccionService.findById(p.getSeccion()).get())
                .categoria(categoriaService.findById(p.getCategoria()).get())
                .marca(marcaService.findById(p.getMarca()).get())
                .talla(tallaService.findById(p.getTalla()).get())
                .build();

    }

    public Producto createProductoDtoToProducto (CreateProductoDto p) {

        return Producto.builder()
                .titulo(p.getTitulo())
                .descripcion(p.getDescripcion())
                .precio(p.getPrecio())
                .intercambio(p.isIntercambio())
                .original(p.isOriginal())
                .foto("http://localhost:8080/download/product.png")
                .usuario(usuarioService.findById(p.getUsuario()).get())
                .seccion(seccionService.findById(p.getSeccion()).get())
                .categoria(categoriaService.findById(p.getCategoria()).get())
                .marca(marcaService.findById(p.getMarca()).get())
                .talla(tallaService.findById(p.getTalla()).get())
                .build();

    }

    public GetProductoDto getProductoDto (Producto producto) {
        return GetProductoDto.builder()
                .id(producto.getId())
                .titulo(producto.getTitulo())
                .descripcion(producto.getDescripcion())
                .precio(producto.getPrecio())
                .intercambio(producto.isIntercambio())
                .original(producto.isOriginal())
                .foto(producto.getFoto())
                .usuario(usuarioDtoConverter.usuarioToGetUsuarioProductoDto(producto.getUsuario()))
                .seccion(producto.getSeccion())
                .categoria(producto.getCategoria())
                .marca(producto.getMarca())
                .talla(producto.getTalla())
                .meGustas(producto.getMeGustas().stream().map(meGusta -> {
                    return usuarioDtoConverter.usuarioToGetUsuarioProductoDto(meGusta.getUsuario());
                }).toList())
                .build();
    }

}
