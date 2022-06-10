package com.danieloliva.FootageBackend.dto.seccion;

import com.danieloliva.FootageBackend.model.Seccion;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Component
@RequiredArgsConstructor
public class SeccionDtoConverter {

    private final StorageService storageService;

    public Seccion createSeccion (CreateSeccionDto createSeccionDto, MultipartFile file) {

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        return Seccion.builder()
                .nombre(createSeccionDto.getNombre())
                .imagen(uri)
                .build();

    }

    public Seccion createSeccion (CreateSeccionDto createSeccionDto) {

        return Seccion.builder()
                .nombre(createSeccionDto.getNombre())
                .imagen("http://localhost:8080/download/section.png")
                .build();

    }

}
