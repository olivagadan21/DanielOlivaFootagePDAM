package com.danieloliva.FootageBackend.dto.talla;

import lombok.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateTallaDto {

    @NotNull(message = "{not.null}")
    private String nombre;

    @NotNull(message = "{not.null}")
    private Long categoria;

}
