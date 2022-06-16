package com.danieloliva.FootageBackend.dto.categoria;

import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Component
@RequiredArgsConstructor
public class CategoriaDtoConverter {

    private final StorageService storageService;

    public Categoria createCategoria (CreateCategoriaDto createCategoriaDto, MultipartFile file) {

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        return Categoria.builder()
                .nombre(createCategoriaDto.getNombre())
                .imagen(uri)
                .build();

    }

    public Categoria createCategoria (CreateCategoriaDto createCategoriaDto) {

        return Categoria.builder()
                .nombre(createCategoriaDto.getNombre())
                .imagen("https://api-footage.herokuapp.com/download/category.png")
                .build();

    }

}
