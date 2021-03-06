package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.dto.anuncio.AnuncioDtoConverter;
import com.danieloliva.FootageBackend.dto.anuncio.CreateAnuncioDto;
import com.danieloliva.FootageBackend.model.Anuncio;
import com.danieloliva.FootageBackend.service.base.AnuncioService;
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
@Tag(name = "anuncio", description = "Controller de los anuncios")
@RequestMapping("/anuncio/")
@CrossOrigin(origins = "http://localhost:4200")
public class AnuncioController {

    private final AnuncioService anuncioService;
    private final AnuncioDtoConverter anuncioDtoConverter;

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
    public ResponseEntity<Optional<Anuncio>> findOne(@PathVariable Long id) {

        Optional<Anuncio> anuncio = anuncioService.findById(id);

        if (anuncio.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(anuncio);
        }

    }

    @Operation(summary = "Obtiene un anuncio al azar")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado el anuncio",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Anuncio.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado el anuncio",
                    content = @Content),
    })
    @GetMapping("/aleatorio")
    public ResponseEntity<Anuncio> findOneAleatory() {

        if (anuncioService.findAll().isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(anuncioService.findOneAleatory());
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
    public ResponseEntity<Anuncio> create (@RequestBody CreateAnuncioDto anuncio) {

        if (anuncio.getUrl().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Anuncio a = anuncioDtoConverter.createAnuncio(anuncio);
            return ResponseEntity.status(HttpStatus.CREATED).body(anuncioService.save(a));
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
    public ResponseEntity<Anuncio> edit (@RequestBody CreateAnuncioDto anuncioDto, @PathVariable Long id) throws IOException {

        Optional<Anuncio> a = anuncioService.findById(id);

        if (a.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            Anuncio anuncio = anuncioDtoConverter.createAnuncio(anuncioDto);
            return ResponseEntity.ok().body(anuncioService.edit(anuncio, id));
        }

    }

    @Operation(summary = "Borra un anuncio espec??fico")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado el anuncio",
                    content = { @Content(mediaType = "application/json") }),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado el anuncio",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {

        if (anuncioService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            anuncioService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
