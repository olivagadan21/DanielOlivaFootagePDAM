package com.danieloliva.FootageBackend.dto.talla;

import com.danieloliva.FootageBackend.model.Talla;
import com.danieloliva.FootageBackend.service.base.CategoriaService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class TallaDtoConverter {

    private final CategoriaService categoriaService;

    public Talla createTallaDto (CreateTallaDto createTallaDto) {
        return Talla.builder()
                .nombre(createTallaDto.getNombre())
                .categoria(categoriaService.findById(createTallaDto.getCategoria()).get())
                .build();
    }

    public GetTallaDto getTallaDto (Talla talla) {
        return GetTallaDto.builder()
                .id(talla.getId())
                .nombre(talla.getNombre())
                .categoria(talla.getCategoria().getNombre())
                .build();
    }

}
