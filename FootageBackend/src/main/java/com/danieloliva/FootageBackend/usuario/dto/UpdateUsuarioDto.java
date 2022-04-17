package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.validacion.anotaciones.UniqueUsername;
import lombok.*;
import org.hibernate.annotations.NaturalId;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpdateUsuarioDto {

    private String nombre;

    private String apellidos;

    @UniqueUsername(message = "El usuario debe ser único")
    private String username;

    private String avatar;

    private String localizacion;

    private boolean premium;

    @Enumerated(EnumType.STRING)
    @Column(name = "rol")
    private RolUsuario rol;

}