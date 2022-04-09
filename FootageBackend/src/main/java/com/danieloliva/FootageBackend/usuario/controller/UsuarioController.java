
package com.danieloliva.FootageBackend.usuario.controller;


import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import com.danieloliva.FootageBackend.usuario.service.UsuarioService;
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
@Tag(name = "Usuario", description = "Controller de los usuarios")
public class UsuarioController {

    private final UsuarioService usuarioService;

    @Operation(summary = "Obtiene lista de usuarios")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los usuarios",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Producto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los usuarios",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<Usuario>> findAll() {

        List<Usuario> usuarios = usuarioService.findAll();

        if (usuarios.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(usuarios);
        }

    }

    @Operation(summary = "Obtiene un usuario en base a su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado el usuario",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Producto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado el usuario",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<Optional<Usuario>> findOne(@PathVariable UUID id) {

        Optional<Usuario> usuario = usuarioService.findById(id);

        if (usuario.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().body(usuario);
        }

    }

    @Operation(summary = "Crea un nuevo usuario")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado el nuevo usuario",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = Producto.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado el nuevo usuario",
                    content = @Content),
    })
    @PostMapping("")
    public ResponseEntity<Usuario> create (@RequestBody Usuario usuario) {

        if (usuario.getUsername().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            usuarioService.save(usuario);
            return ResponseEntity.status(HttpStatus.CREATED).body(usuario);
        }

    }

    @Operation(summary = "Edita un usuario anteriormente creado, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado el usuario",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = Producto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado el usuario",
                    content = @Content),
    })
    @PutMapping("{id}")
    public ResponseEntity<Usuario> edit (@RequestBody Usuario usuario, @PathVariable UUID id) {

        if (usuarioService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.of(
                    usuarioService.findById(id).map(p -> {
                        p.setNombre(usuario.getNombre());
                        p.setApellidos(usuario.getApellidos());
                        p.setUsername(usuario.getUsername());
                        p.setPassword(usuario.getPassword());
                        p.setAvatar(usuario.getAvatar());
                        p.setPremium(usuario.isPremium());
                        p.setRol(usuario.getRol());
                        p.setArticulos(usuario.getArticulos());
                        usuarioService.save(p);
                        return p;
                    })
            );
        }

    }

    @Operation(summary = "Borra un usuario específico")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado el usuario",
                    content = { @Content(mediaType = "application/json") }),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado el usuario",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable UUID id) {

        if (usuarioService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            usuarioService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}