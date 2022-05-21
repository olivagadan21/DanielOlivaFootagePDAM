package com.danieloliva.FootageBackend.dto.marca;

import lombok.*;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateMarcaDto {

    @NotNull(message = "{not.null}")
    private String nombre;

}
