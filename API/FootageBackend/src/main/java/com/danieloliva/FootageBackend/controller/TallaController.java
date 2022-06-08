package com.danieloliva.FootageBackend.controller;

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
@CrossOrigin(origins = "http://localhost:4200")
public class TallaController {

    private final TallaService tallaService;

    @Operation(summary = "Obtiene lista de tallas")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado las tallas",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Talla.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado las tallas",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<Talla>> findAll() {

        List<Talla> tallas = tallaService.findAll();

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
                            schema = @Schema(implementation = Talla.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado la talla",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<Talla> findOne(@PathVariable Long id) {

        Optional<Talla> talla = tallaService.findById(id);

        if (talla.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(talla.get());
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
    @PostMapping(value = "")
    public ResponseEntity<Talla> create(@RequestBody Talla talla) {

        if (talla.getNombre().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            return ResponseEntity.status(HttpStatus.CREATED).body(tallaService.save(talla));
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
    @PutMapping(value = "{id}")
    public ResponseEntity<Talla> edit(@RequestBody Talla talla, @PathVariable Long id) {

        Optional<Talla> data = tallaService.findById(id);

        if (data.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(tallaService.edit(talla, id));
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
