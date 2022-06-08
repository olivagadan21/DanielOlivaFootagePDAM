package com.danieloliva.FootageBackend.dto.marca;

import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Component
@RequiredArgsConstructor
public class MarcaDtoConverter {

    private final StorageService storageService;

    public Marca createMarca (CreateMarcaDto createMarcaDto, MultipartFile file) {

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        return Marca.builder()
                .nombre(createMarcaDto.getNombre())
                .imagen(uri)
                .build();

    }

}
