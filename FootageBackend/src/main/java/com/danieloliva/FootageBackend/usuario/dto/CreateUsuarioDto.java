package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.validacion.anotaciones.UniqueUsername;
import org.hibernate.annotations.NaturalId;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateUsuarioDto {

    @NotNull
    private String nombre;

    @NotNull
    private String apellidos;

    @UniqueUsername(message = "El usuario debe ser único")
    @NotNull
    private String username;

    private String avatar;

    private String localizacion;

    private boolean premium;

    @Enumerated(EnumType.STRING)
    @Column(name = "rol")
    private RolUsuario rol;

    @NaturalId
    @NotNull
    private String email;

    @NotNull
    private String password;

    @NotNull
    private String password2;

}
