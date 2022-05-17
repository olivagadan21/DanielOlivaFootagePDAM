package com.danieloliva.FootageBackend.validacion.validadores;

import com.danieloliva.FootageBackend.usuario.repository.UsuarioRepository;
import com.danieloliva.FootageBackend.validacion.anotaciones.UniqueUsername;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueUsernameValidator implements ConstraintValidator<UniqueUsername, String> {

    @Autowired
    private UsuarioRepository categoryRepository;

    @Override
    public void initialize(UniqueUsername constraintAnnotation) { }

    @Override
    public boolean isValid(String username, ConstraintValidatorContext context) {
        return !categoryRepository.existsByUsername(username) && username != null;
    }

}