package com.danieloliva.FootageBackend.dto.anuncio;

import com.danieloliva.FootageBackend.model.Anuncio;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Component
@RequiredArgsConstructor
public class AnuncioDtoConverter {

    private final StorageService storageService;
    public Anuncio createAnuncio (CreateAnuncioDto createAnuncioDto, MultipartFile file) {

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        return Anuncio.builder()
                .empresa(createAnuncioDto.getEmpresa())
                .url(createAnuncioDto.getUrl())
                .imagen(uri)
                .build();

    }

}
