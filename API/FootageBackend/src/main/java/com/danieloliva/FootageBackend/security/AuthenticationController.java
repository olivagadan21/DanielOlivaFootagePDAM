package com.danieloliva.FootageBackend.security;

import com.danieloliva.FootageBackend.security.dto.JwtUsuarioResponse;
import com.danieloliva.FootageBackend.security.dto.LoginDto;
import com.danieloliva.FootageBackend.security.jwt.JwtProvider;
import com.danieloliva.FootageBackend.usuario.dto.CreateUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.GetUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.UsuarioDtoConverter;
import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import com.danieloliva.FootageBackend.usuario.service.UsuarioService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class AuthenticationController {

    private final AuthenticationManager authenticationManager;
    private final JwtProvider jwtProvider;
    private final UsuarioDtoConverter usuarioDtoConverter;
    private final UsuarioService usuarioService;

    @Operation(summary = "Crea un nuevo usuario de tipo user")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado el nuevo usuario de tipo user",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado el nuevo usuario de tipo user",
                    content = @Content),
    })
    @PostMapping("/auth/register/user")
    public ResponseEntity<GetUsuarioDto> createUser (@RequestBody CreateUsuarioDto usuario) {

        if (usuario.getUsername().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Usuario usu = usuarioService.saveUser(usuario);
            GetUsuarioDto u = usuarioDtoConverter.usuarioToGetUsuarioDto(usu);
            return ResponseEntity.status(HttpStatus.CREATED).body(u);
        }

    }

    @Operation(summary = "Crea un nuevo usuario de tipo admin")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado el nuevo usuario de tipo admin",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetUsuarioDto.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado el nuevo usuario de tipo admin",
                    content = @Content),
    })
    @PostMapping("/auth/register/admin")
    public ResponseEntity<GetUsuarioDto> createAdmin (@RequestBody CreateUsuarioDto usuario) {

        if (usuario.getUsername().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Usuario usu = usuarioService.saveAdmin(usuario);
            GetUsuarioDto u = usuarioDtoConverter.usuarioToGetUsuarioDto(usu);
            return ResponseEntity.status(HttpStatus.CREATED).body(u);
        }

    }

    @PostMapping("/auth/login")
    public ResponseEntity<?> login(@RequestBody LoginDto loginDto) {

        Authentication authentication =
                authenticationManager.authenticate(
                        new UsernamePasswordAuthenticationToken(
                                loginDto.getEmail(),
                                loginDto.getPassword()
                        )
                );

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String jwt = jwtProvider.generateToken(authentication);

        Usuario usuario = (Usuario) authentication.getPrincipal();

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(convertUsuarioToJwtUsuariorResponse(usuario, jwt));

    }

    @PostMapping("/auth/login/admin")
    public ResponseEntity<?> loginAdmin(@RequestBody LoginDto loginDto) {

        if (usuarioService.findByEmail(loginDto.getEmail()).get().getRol().equals(RolUsuario.valueOf("ADMIN"))) {
            Authentication authentication =
                    authenticationManager.authenticate(
                            new UsernamePasswordAuthenticationToken(
                                    loginDto.getEmail(),
                                    loginDto.getPassword()
                            )
                    );

            SecurityContextHolder.getContext().setAuthentication(authentication);

            String jwt = jwtProvider.generateToken(authentication);

            Usuario usuario = (Usuario) authentication.getPrincipal();

            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(convertUsuarioToJwtUsuariorResponse(usuario, jwt));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

    }

    @GetMapping("/profile/me")
    public ResponseEntity<?> identificarme(@AuthenticationPrincipal Usuario usuario){
        return ResponseEntity.ok(convertUsuarioToJwtUsuariorResponse(usuario, null));
    }


    private JwtUsuarioResponse convertUsuarioToJwtUsuariorResponse(Usuario usuario, String jwt) {
        return JwtUsuarioResponse.builder()
                .id(usuario.getId())
                .nombre(usuario.getNombre())
                .apellidos(usuario.getApellidos())
                .username(usuario.getUsername())
                .email(usuario.getEmail())
                .avatar(usuario.getAvatar())
                .localizacion(usuario.getLocalizacion())
                .premium(usuario.isPremium())
                .rol(usuario.getRol().name())
                .token(jwt)
                .build();
    }


}