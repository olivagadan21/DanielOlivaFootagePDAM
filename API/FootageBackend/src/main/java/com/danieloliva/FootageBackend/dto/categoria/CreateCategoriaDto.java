package com.danieloliva.FootageBackend.dto.categoria;

import lombok.*;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateCategoriaDto {

    @NotNull(message = "{not.null}")
    private String nombre;

}
