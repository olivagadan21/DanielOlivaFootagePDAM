package com.danieloliva.FootageBackend.dto.producto;

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

    @NotNull
    private Long usuario;

    @NotNull
    private Long seccion;

    @NotNull
    private Long categoria;

    @NotNull
    private Long marca;

}
