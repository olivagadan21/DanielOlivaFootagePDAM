package com.danieloliva.FootageBackend.dto.seccion;

import lombok.*;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateSeccionDto {

    @NotNull(message = "{not.null}")
    private String nombre;

}
