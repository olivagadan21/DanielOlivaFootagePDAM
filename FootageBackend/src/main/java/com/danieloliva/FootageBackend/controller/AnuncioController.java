package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.model.Anuncio;
import com.danieloliva.FootageBackend.service.AnuncioService;
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
@Tag(name = "Anuncio", description = "Controller de los anuncios")
@RequestMapping("/anuncio/")
public class AnuncioController {

    private final AnuncioService anuncioService;

    @Operation(summary = "Obtiene lista de anuncios")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los anuncios",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Anuncio.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los anuncios",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<Anuncio>> findAll() {

        List<Anuncio> anuncios = anuncioService.findAll();

        if (anuncios.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(anuncios);
        }

    }

    @Operation(summary = "Obtiene un anuncio en base a su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado el anuncio",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Anuncio.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado el anuncio",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<Optional<Anuncio>> findOne(@PathVariable UUID id) {

        Optional<Anuncio> anuncio = anuncioService.findById(id);

        if (anuncio.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(anuncio);
        }

    }

    @Operation(summary = "Crea un nuevo anuncio")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado el nuevo anuncio",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Anuncio.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado el nuevo anuncio",
                    content = @Content),
    })
    @PostMapping("")
    public ResponseEntity<Anuncio> create (@RequestBody Anuncio anuncio) {

        if (anuncio.getUrl().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            anuncioService.save(anuncio);
            return ResponseEntity.status(HttpStatus.CREATED).body(anuncio);
        }

    }

    @Operation(summary = "Edita un anuncio anteriormente creado, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado el anuncio",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Anuncio.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado el anuncio",
                    content = @Content),
    })
    @PutMapping("{id}")
    public ResponseEntity<Anuncio> edit (@RequestBody Anuncio anuncio, @PathVariable UUID id) {

        if (anuncioService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.of(
                    anuncioService.findById(id).map(a -> {
                        a.setEmpresa(anuncio.getEmpresa());
                        a.setUrl(anuncio.getUrl());
                        a.setImagen(anuncio.getImagen());
                        anuncioService.save(a);
                        return a;
                    })
            );
        }

    }

    @Operation(summary = "Borra un anuncio específico")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado el anuncio",
                    content = { @Content(mediaType = "application/json") }),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado el anuncio",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable UUID id) {

        if (anuncioService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            anuncioService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
