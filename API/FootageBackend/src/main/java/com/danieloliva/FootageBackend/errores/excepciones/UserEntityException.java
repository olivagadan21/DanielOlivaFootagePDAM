package com.danieloliva.FootageBackend.errores.excepciones;

public class UserEntityException extends EntityNotFoundException{

    public UserEntityException(String message) {
        super(message);
    }
}