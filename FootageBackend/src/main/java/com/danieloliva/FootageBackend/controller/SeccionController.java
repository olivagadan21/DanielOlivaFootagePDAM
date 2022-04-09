package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.model.Seccion;
import com.danieloliva.FootageBackend.service.SeccionService;
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

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@Tag(name = "Seccion", description = "Controller de las secciones")
@RequestMapping("/seccion/")
public class SeccionController {

    private final SeccionService seccionService;

    @Operation(summary = "Obtiene lista de secciones")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado las secciones",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Seccion.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado las secciones",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<Seccion>> findAll() {

        List<Seccion> secciones = seccionService.findAll();

        if (secciones.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(secciones);
        }

    }

    @Operation(summary = "Obtiene una sección en base a su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado la sección",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Seccion.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado la sección",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<Optional<Seccion>> findOne(@PathVariable UUID id) {

        Optional<Seccion> seccion = seccionService.findById(id);

        if (seccion.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(seccion);
        }

    }

    @Operation(summary = "Crea una nueva sección")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado la nueva sección",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Seccion.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado la nueva sección",
                    content = @Content),
    })
    @PostMapping("")
    public ResponseEntity<Seccion> create(@RequestBody Seccion seccion) {

        if (seccion.getNombre().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            seccionService.save(seccion);
            return ResponseEntity.status(HttpStatus.CREATED).body(seccion);
        }

    }

    @Operation(summary = "Edita una sección anteriormente creada, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado la seccion",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Seccion.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado la seccion",
                    content = @Content),
    })
    @PutMapping("{id}")
    public ResponseEntity<Seccion> edit(@RequestBody Seccion seccion, @PathVariable UUID id) {

        if (seccionService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.of(
                    seccionService.findById(id).map(s -> {
                        s.setNombre(seccion.getNombre());
                        s.setImagen(seccion.getImagen());
                        seccionService.save(s);
                        return s;
                    })
            );
        }

    }

    @Operation(summary = "Borra una sección específica")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado la sección",
                    content = {@Content(mediaType = "application/json")}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado la sección",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable UUID id) {

        if (seccionService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            seccionService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
