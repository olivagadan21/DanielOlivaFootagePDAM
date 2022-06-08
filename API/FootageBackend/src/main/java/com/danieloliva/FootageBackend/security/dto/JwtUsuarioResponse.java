package com.danieloliva.FootageBackend.security.dto;

import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import lombok.*;
import org.hibernate.annotations.NaturalId;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JwtUsuarioResponse {

    private Long id;
    private String email;
    private String nombre;
    private String apellidos;
    private String avatar;
    private String rol;
    private String token;
    private String username;
    private String localizacion;
    private boolean premium;

}