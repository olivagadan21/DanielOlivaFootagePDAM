package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.dto.marca.CreateMarcaDto;
import com.danieloliva.FootageBackend.dto.marca.MarcaDtoConverter;
import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.service.base.MarcaService;
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
@Tag(name = "Marca", description = "Controller de las marcas")
@RequestMapping("/marca/")
@CrossOrigin(origins = "http://localhost:4200")
public class MarcaController {

    private final ProductoService productoService;
    private final MarcaService marcaService;
    private final MarcaDtoConverter marcaDtoConverter;

    @Operation(summary = "Obtiene lista de marcas")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado las marcas",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Marca.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado las marcas",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<Marca>> findAll() {

        List<Marca> marcas = marcaService.findAll();

        if (marcas.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(marcas);
        }

    }

    @Operation(summary = "Obtiene una marca en base a su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado la marca",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Marca.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado la marca",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<Optional<Marca>> findOne(@PathVariable Long id) {

        Optional<Marca> marca = marcaService.findById(id);

        if (marca.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(marca);
        }

    }

    @Operation(summary = "Crea una nueva marca")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado la nueva marca",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Marca.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado la nueva marca",
                    content = @Content),
    })
    @PostMapping("")
    public ResponseEntity<Marca> create(@RequestBody CreateMarcaDto marcaDto) {

        if (marcaDto.getNombre().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Marca marca = marcaDtoConverter.createMarca(marcaDto);
            return ResponseEntity.status(HttpStatus.CREATED).body(marcaService.save(marca));
        }

    }

    @Operation(summary = "Edita una marca anteriormente creada, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado la marca",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Marca.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado la marca",
                    content = @Content),
    })
    @PutMapping("{id}")
    public ResponseEntity<Marca> edit(@RequestBody CreateMarcaDto marcaDto, @PathVariable Long id) throws IOException {

        Optional<Marca> mar = marcaService.findById(id);

        if (mar.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            Marca marca = marcaDtoConverter.createMarca(marcaDto);
            return ResponseEntity.ok().body(marcaService.edit(marca, id));
        }

    }

    @Operation(summary = "Borra una marca espec??fica")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado la marca",
                    content = {@Content(mediaType = "application/json")}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado la marca",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {

        if (marcaService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            productoService.findByMarca(id).forEach(producto -> {producto.setMarca(null);});
            marcaService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
