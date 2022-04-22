package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.model.Anuncio;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

public interface AnuncioService {

    List<Anuncio> findAll();

    Optional<Anuncio> findById(Long id);

    Anuncio save(Anuncio p, MultipartFile file);

    Anuncio edit(Anuncio p, MultipartFile file, Long id);

    void delete(Anuncio p);

    void deleteById(Long id);

}
