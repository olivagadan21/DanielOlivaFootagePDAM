package com.danieloliva.FootageBackend.dto.talla;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetTallaDto {

    private Long id;

    private String nombre;

    private String categoria;

}
