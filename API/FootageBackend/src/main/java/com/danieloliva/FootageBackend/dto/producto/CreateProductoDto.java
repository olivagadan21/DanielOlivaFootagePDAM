package com.danieloliva.FootageBackend.dto.producto;

import com.danieloliva.FootageBackend.model.Estado;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
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

    @Positive(message = "{positive}")
    private double precio;

    private boolean intercambio;

    private boolean original;

    @NotNull(message = "{not.null}")
    private Long usuario;

    @NotNull(message = "{not.null}")
    private Long seccion;

    @NotNull(message = "{not.null}")
    private Long categoria;

    @NotNull(message = "{not.null}")
    private Long marca;

    @NotNull(message = "{not.null}")
    private Long talla;

    @Enumerated(EnumType.STRING)
    private Estado estado;

}
