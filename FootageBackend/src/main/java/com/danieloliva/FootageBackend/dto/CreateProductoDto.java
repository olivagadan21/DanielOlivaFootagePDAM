package com.danieloliva.FootageBackend.dto;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateProductoDto {

    private String titulo;

    @Lob
    private String descripcion;

    private double precio;

    private boolean intercambio;

    private boolean original;

    private List<String> fotos = new ArrayList<>();

    @NotNull
    private Long usuario;

    @NotNull
    private Long seccion;

    @NotNull
    private Long categoria;

    @NotNull
    private Long marca;

}
