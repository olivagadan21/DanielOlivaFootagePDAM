package com.danieloliva.FootageBackend.dto.talla;

import lombok.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateTallaDto {

    @NotNull
    private String nombre;

    @NotNull
    private Long categoria;

}
