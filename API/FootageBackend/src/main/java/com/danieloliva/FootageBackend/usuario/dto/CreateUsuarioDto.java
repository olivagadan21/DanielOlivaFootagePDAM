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

    @NotNull(message = "{not.null}")
    private String nombre;

    @NotNull(message = "{not.null}")
    private String apellidos;

    @UniqueUsername(message = "El usuario debe ser único")
    @NotNull(message = "{not.null}")
    private String username;

    private String avatar;

    private String localizacion;

    private boolean premium;

    @Enumerated(EnumType.STRING)
    private RolUsuario rol;

    @NaturalId
    @NotNull(message = "{not.null}")
    private String email;

    @NotNull(message = "{not.null}")
    private String password;

    @NotNull(message = "{not.null}")
    private String password2;

}
