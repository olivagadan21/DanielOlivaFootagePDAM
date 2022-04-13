package com.danieloliva.FootageBackend.usuario.dto;

import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.validacion.anotaciones.UniqueUsername;
import org.hibernate.annotations.NaturalId;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

public class CreateUsuarioDto {

    private String nombre;

    private String apellidos;

    @UniqueUsername(message = "El usuario debe ser único")
    private String username;

    @NaturalId
    private String email;

    private String password;

    private String password2;

}
