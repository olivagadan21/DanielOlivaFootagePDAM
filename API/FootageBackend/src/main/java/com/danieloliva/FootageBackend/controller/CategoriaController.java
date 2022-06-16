package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.dto.categoria.CategoriaDtoConverter;
import com.danieloliva.FootageBackend.dto.categoria.CreateCategoriaDto;
import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.service.base.CategoriaService;
import com.danieloliva.FootageBackend.service.base.ProductoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@Tag(name = "Categoria", description = "Controller de las categorías")
@RequestMapping("/categoria/")
@CrossOrigin(origins = "http://localhost:4200")
public class CategoriaController {

    private final ProductoService productoService;
    private final CategoriaService categoriaService;
    private final CategoriaDtoConverter categoriaDtoConverter;

    @Operation(summary = "Obtiene lista de categorías")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado las categorías",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Categoria.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado las categorías",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<Categoria>> findAll() {

        List<Categoria> categorias = categoriaService.findAll();

        if (categorias.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(categorias);
        }

    }

    @Operation(summary = "Obtiene una categoría en base a su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado la categoría",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Categoria.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado la categoría",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<Optional<Categoria>> findOne(@PathVariable Long id) {

        Optional<Categoria> categoria = categoriaService.findById(id);

        if (categoria.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(categoria);
        }

    }

    @Operation(summary = "Crea una nueva categoría")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado la nueva categoría",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Categoria.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado la nueva categoría",
                    content = @Content),
    })
    @PostMapping("")
    public ResponseEntity<Categoria> create(@RequestBody CreateCategoriaDto categoriaDto) {

        if (categoriaDto.getNombre().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Categoria categoria = categoriaDtoConverter.createCategoria(categoriaDto);
            return ResponseEntity.status(HttpStatus.CREATED).body(categoriaService.save(categoria));
        }

    }

    @Operation(summary = "Edita una categoría anteriormente creada, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado la categoría",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Categoria.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado la categoría",
                    content = @Content),
    })
    @PutMapping("{id}")
    public ResponseEntity<Categoria> edit(@RequestBody CreateCategoriaDto categoriaDto, @PathVariable Long id) throws IOException {

        Optional<Categoria> cat = categoriaService.findById(id);

        if (cat.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            Categoria categoria = categoriaDtoConverter.createCategoria(categoriaDto);
            return ResponseEntity.ok().body(categoriaService.edit(categoria, id));
        }

    }

    @Operation(summary = "Borra una categoría específica")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado la categoría",
                    content = {@Content(mediaType = "application/json")}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado la categoría",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {

        Optional<Categoria> categoria = categoriaService.findById(id);

        if (categoria.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            productoService.findByCategoria(id).forEach(producto -> {producto.setCategoria(null);});
            categoriaService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
