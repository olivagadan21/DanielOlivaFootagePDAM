
package com.danieloliva.FootageBackend.usuario.controller;


import com.danieloliva.FootageBackend.service.base.ProductoService;
import com.danieloliva.FootageBackend.usuario.dto.CreateUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.GetUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.GetUsuarioProductoDto;
import com.danieloliva.FootageBackend.usuario.dto.UsuarioDtoConverter;
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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@Tag(name = "Usuario", description = "Controller de los usuarios")
@RequestMapping("/usuario/")
@CrossOrigin(origins = "http://localhost:4200")
public class UsuarioController {

    private final ProductoService productoService;
    private final UsuarioService usuarioService;
    private final UsuarioDtoConverter usuarioDtoConverter;

    @Operation(summary = "Obtiene lista de usuarios")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los usuarios",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los usuarios",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<GetUsuarioDto>> findAll() {

        List<Usuario> data = usuarioService.findAll();
        List<GetUsuarioDto> usuarios = data.stream().map(usuarioDtoConverter::usuarioToGetUsuarioDto).toList();

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
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado el usuario",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<GetUsuarioDto> findOne(@PathVariable Long id) {

        Optional<Usuario> data = usuarioService.findById(id);

        if (data.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            GetUsuarioDto usuario = usuarioDtoConverter.usuarioToGetUsuarioDto(data.get());
            return ResponseEntity.ok().body(usuario);
        }

    }

    @Operation(summary = "Obtiene una lista de usuarios en base a si es premium.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los usuario premium.",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los usuarios premium.",
                    content = @Content),
    })
    @GetMapping("premium")
    public ResponseEntity<List<GetUsuarioDto>> findAllPremium() {

        List<Usuario> data = usuarioService.findAllPremium();
        List<GetUsuarioDto> usuarios = data.stream().map(usuarioDtoConverter::usuarioToGetUsuarioDto).toList();

        if (usuarios.isEmpty()) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.ok().body(usuarios);
        }

    }

    @Operation(summary = "Obtiene una lista de usuarios en base a si su rol es admin.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los usuarios de tipo admin.",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los usuarios de tipo admin.",
                    content = @Content),
    })
    @GetMapping("admin")
    public ResponseEntity<List<GetUsuarioDto>> findByRolAdmin() {

        List<Usuario> data = usuarioService.findByRol("ADMIN");
        List<GetUsuarioDto> usuarios = data.stream().map(usuarioDtoConverter::usuarioToGetUsuarioDto).toList();

        if (usuarios.isEmpty()) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.ok().body(usuarios);
        }

    }

    @Operation(summary = "Obtiene una lista de usuarios en base a si su rol es user.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los usuarios de tipo user.",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los usuarios de tipo user.",
                    content = @Content),
    })
    @GetMapping("user")
    public ResponseEntity<List<GetUsuarioDto>> findByRolUser() {

        List<Usuario> data = usuarioService.findByRol("USER");
        List<GetUsuarioDto> usuarios = data.stream().map(usuarioDtoConverter::usuarioToGetUsuarioDto).toList();

        if (usuarios.isEmpty()) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.ok().body(usuarios);
        }

    }

    @Operation(summary = "Edita un usuario anteriormente creado, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado el usuario",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado el usuario",
                    content = @Content),
    })
    @PutMapping("{id}")
    public ResponseEntity<GetUsuarioDto> edit (@RequestBody CreateUsuarioDto usuario, @PathVariable Long id) {

        Optional<Usuario> u = usuarioService.findById(id);

        if (u.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            GetUsuarioDto getUsuarioDto = usuarioDtoConverter.usuarioToGetUsuarioDto(usuarioService.editProfile(usuario, u.get()));
            return ResponseEntity.ok().body(getUsuarioDto);
        }

    }

    @Operation(summary = "Edita un usuario anteriormente creado, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado el usuario",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado el usuario",
                    content = @Content),
    })
    @PutMapping(value = "me", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<GetUsuarioDto> editMe (@RequestPart("user") CreateUsuarioDto usuarioDto, @AuthenticationPrincipal Usuario usuario, @RequestPart("file") MultipartFile file) throws IOException {
        return ResponseEntity.ok().body(usuarioDtoConverter.usuarioToGetUsuarioDto(usuarioService.editProfile(usuarioDto, file, usuario)));
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
    public ResponseEntity<?> delete(@PathVariable Long id) {

        if (usuarioService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            productoService.findByUsuario(id).forEach(producto -> productoService.delete(producto));
            usuarioService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}