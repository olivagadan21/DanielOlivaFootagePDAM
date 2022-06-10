package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.dto.seccion.CreateSeccionDto;
import com.danieloliva.FootageBackend.dto.seccion.SeccionDtoConverter;
import com.danieloliva.FootageBackend.model.Seccion;
import com.danieloliva.FootageBackend.service.base.SeccionService;
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
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@Tag(name = "Seccion", description = "Controller de las secciones")
@RequestMapping("/seccion/")
@CrossOrigin(origins = "http://localhost:4200")
public class SeccionController {

    private final SeccionService seccionService;
    private final SeccionDtoConverter seccionDtoConverter;

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
    public ResponseEntity<Optional<Seccion>> findOne(@PathVariable Long id) {

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
    @PostMapping(value = "", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Seccion> create(@RequestPart("seccion") CreateSeccionDto seccionDto, @RequestPart("file") MultipartFile file) {

        if (seccionDto.getNombre().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Seccion seccion = seccionDtoConverter.createSeccion(seccionDto, file);
            seccionService.save(seccion);
            return ResponseEntity.status(HttpStatus.CREATED).body(seccion);
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
    public ResponseEntity<Seccion> create(@RequestPart("seccion") CreateSeccionDto seccionDto) {

        if (seccionDto.getNombre().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Seccion seccion = seccionDtoConverter.createSeccion(seccionDto);
            return ResponseEntity.status(HttpStatus.CREATED).body(seccionService.save(seccion));
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
    @PutMapping(value = "{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Seccion> edit(@RequestPart("seccion") CreateSeccionDto seccionDto, @RequestPart("file") MultipartFile file, @PathVariable Long id) {

        if (seccionService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            Seccion seccion = seccionDtoConverter.createSeccion(seccionDto, file);
            return ResponseEntity.ok().body(seccionService.edit(seccion, id));
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
    public ResponseEntity<?> delete(@PathVariable Long id) {

        if (seccionService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            seccionService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
