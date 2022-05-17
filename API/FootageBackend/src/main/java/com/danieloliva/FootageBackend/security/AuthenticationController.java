package com.danieloliva.FootageBackend.security;

import com.danieloliva.FootageBackend.security.dto.JwtUsuarioResponse;
import com.danieloliva.FootageBackend.security.dto.LoginDto;
import com.danieloliva.FootageBackend.security.jwt.JwtProvider;
import com.danieloliva.FootageBackend.usuario.dto.UsuarioDtoConverter;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import com.danieloliva.FootageBackend.usuario.service.UsuarioService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class AuthenticationController {

    private final AuthenticationManager authenticationManager;
    private final JwtProvider jwtProvider;
    private final UsuarioDtoConverter usuarioDtoConverter;
    private final UsuarioService usuarioService;

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
                .articulos(usuario.getArticulos())
                .token(jwt)
                .build();
    }


}