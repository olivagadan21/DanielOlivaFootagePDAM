package com.danieloliva.FootageBackend.dto.anuncio;

import lombok.*;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateAnuncioDto {

    @NotNull(message = "{not.null}")
    private String empresa;

    @NotNull(message = "{not.null}")
    private String url;

}
