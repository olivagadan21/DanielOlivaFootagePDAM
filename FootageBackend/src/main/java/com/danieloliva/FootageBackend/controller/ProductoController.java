package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.dto.producto.CreateProductoDto;
import com.danieloliva.FootageBackend.dto.producto.ProductoDtoConverter;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.service.ProductoServiceImpl;
import com.danieloliva.FootageBackend.service.base.ProductoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@Tag(name = "Producto", description = "Controller de los productos")
@RequestMapping("/producto/")
public class ProductoController {

    private final ProductoService productoService;

    @Operation(summary = "Obtiene lista de productos")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los productos",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Producto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los productos",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<Producto>> findAll() {

        List<Producto> productos = productoService.findAll();

        if (productos.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(productos);
        }

    }

    @Operation(summary = "Obtiene un producto en base a su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado el producto",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Producto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado el producto",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<Optional<Producto>> findOne(@PathVariable Long id) {

        Optional<Producto> producto = productoService.findById(id);

        if (producto.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(producto);
        }

    }

    @Operation(summary = "Crea un nuevo producto")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado el nuevo producto",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Producto.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado el nuevo producto",
                    content = @Content),
    })
    @PostMapping("")
    public ResponseEntity<Producto> create (@RequestPart("producto") CreateProductoDto productoDto, @RequestPart("file1") MultipartFile file1, @RequestPart("file2") MultipartFile file2) {

        if (productoDto.getTitulo().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Producto producto = productoService.save(productoDto, file1, file2);
            return ResponseEntity.status(HttpStatus.CREATED).body(producto);
        }

    }

    @Operation(summary = "Edita un producto anteriormente creado, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado el producto",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Producto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado el producto",
                    content = @Content),
    })
    @PutMapping("{id}")
    public ResponseEntity<Producto> edit (@RequestPart("producto") CreateProductoDto productoDto, @RequestPart("file1") MultipartFile file1, @RequestPart("file2") MultipartFile file2, @PathVariable Long id) {

        if (productoService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(productoService.edit(productoDto, file1, file2, id));
        }

    }

    @Operation(summary = "Borra un producto específico")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado el producto",
                    content = { @Content(mediaType = "application/json") }),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado el producto",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {

        if (productoService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            productoService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
