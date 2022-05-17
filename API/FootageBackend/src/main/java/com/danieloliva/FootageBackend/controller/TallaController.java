package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.dto.talla.CreateTallaDto;
import com.danieloliva.FootageBackend.dto.talla.GetTallaDto;
import com.danieloliva.FootageBackend.dto.talla.TallaDtoConverter;
import com.danieloliva.FootageBackend.model.Talla;
import com.danieloliva.FootageBackend.service.base.TallaService;
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

@RestController
@RequiredArgsConstructor
@Tag(name = "Talla", description = "Controller de las tallas")
@RequestMapping("/talla/")
public class TallaController {

    private final TallaService tallaService;
    private final TallaDtoConverter tallaDtoConverter;

    @Operation(summary = "Obtiene lista de tallas")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado las tallas",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetTallaDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado las tallas",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<GetTallaDto>> findAll() {

        List<GetTallaDto> tallas = tallaService.findAll().stream().map(tallaDtoConverter::getTallaDto).toList();

        if (tallas.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(tallas);
        }

    }

    @Operation(summary = "Obtiene una talla en base a su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado la talla",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetTallaDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado la talla",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<GetTallaDto> findOne(@PathVariable Long id) {

        Optional<Talla> talla = tallaService.findById(id);

        if (talla.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            GetTallaDto t = tallaDtoConverter.getTallaDto(talla.get());
            return ResponseEntity.ok().body(t);
        }

    }

    @Operation(summary = "Obtiene una talla en base a su categoria")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado la talla",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetTallaDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado la talla",
                    content = @Content),
    })
    @GetMapping("categoria/{id}")
    public ResponseEntity<List<GetTallaDto>> findByCategoria(@PathVariable Long id) {

        List<Talla> tallas = tallaService.findByCategoria(id);

        if (tallas.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            List<GetTallaDto> t = tallas.stream().map(tallaDtoConverter::getTallaDto).toList();
            return ResponseEntity.ok().body(t);
        }

    }

    @Operation(summary = "Crea una nueva talla")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado la nueva talla",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Talla.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado la nueva talla",
                    content = @Content),
    })
    @PostMapping("")
    public ResponseEntity<GetTallaDto> create(@RequestBody CreateTallaDto talla) {

        if (talla.getNombre().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            GetTallaDto t = tallaDtoConverter.getTallaDto(tallaService.save(tallaDtoConverter.createTallaDto(talla)));
            return ResponseEntity.status(HttpStatus.CREATED).body(t);
        }

    }

    @Operation(summary = "Edita una talla anteriormente creada, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado la talla",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Talla.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado la talla",
                    content = @Content),
    })
    @PutMapping("{id}")
    public ResponseEntity<GetTallaDto> edit(@RequestBody CreateTallaDto talla, @PathVariable Long id) {

        Optional<Talla> data = tallaService.findById(id);

        if (data.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            GetTallaDto t = tallaDtoConverter.getTallaDto(tallaService.edit(tallaDtoConverter.createTallaDto(talla), id));
            return ResponseEntity.ok().body(t);
        }

    }

    @Operation(summary = "Borra una talla específica")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado la talla",
                    content = {@Content(mediaType = "application/json")}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado la talla",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {

        if (tallaService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            tallaService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
