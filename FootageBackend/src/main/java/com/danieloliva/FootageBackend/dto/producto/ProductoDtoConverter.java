package com.danieloliva.FootageBackend.dto.producto;

import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.service.base.CategoriaService;
import com.danieloliva.FootageBackend.service.base.MarcaService;
import com.danieloliva.FootageBackend.service.base.SeccionService;
import com.danieloliva.FootageBackend.service.base.StorageService;
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

    public Producto createProductoDtoToProducto (CreateProductoDto p, MultipartFile file1, MultipartFile file2) {

        String filename1 = storageService.store(file1);

        String uri1 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename1)
                .toUriString();

        String filename2 = storageService.store(file2);

        String uri2 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename2)
                .toUriString();

        return Producto.builder()
                .titulo(p.getTitulo())
                .descripcion(p.getDescripcion())
                .precio(p.getPrecio())
                .intercambio(p.isIntercambio())
                .original(p.isOriginal())
                .foto1(filename1)
                .foto2(filename2)
                .usuario(usuarioService.findById(p.getUsuario()).get())
                .seccion(seccionService.findById(p.getSeccion()).get())
                .categoria(categoriaService.findById(p.getCategoria()).get())
                .marca(marcaService.findById(p.getMarca()).get())
                .build();

    }

}
