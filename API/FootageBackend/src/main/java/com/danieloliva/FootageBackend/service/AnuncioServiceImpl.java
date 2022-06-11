package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Anuncio;
import com.danieloliva.FootageBackend.repository.AnuncioRepository;
import com.danieloliva.FootageBackend.service.base.AnuncioService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class AnuncioServiceImpl implements AnuncioService {

    private final AnuncioRepository anuncioRepository;
    private final StorageService storageService;

    @Override
    public List<Anuncio> findAll() {
        return anuncioRepository.findAll();
    }

    @Override
    public Optional<Anuncio> findById(Long id) {
        return anuncioRepository.findById(id);
    }

    @Override
    public Anuncio findOneAleatory() {
        List<Anuncio> anuncios = findAll();
        Long id = new Random().nextLong(anuncios.size()) + 1;
        return anuncioRepository.getById(id);
    }

    @Override
    public Anuncio save(Anuncio a) {

        return anuncioRepository.save(a);

    }

    @Override
    public Anuncio edit(Anuncio a, Long id) {

        Anuncio anuncio = findById(id).get();

        anuncio.setEmpresa(a.getEmpresa());
        anuncio.setImagen(anuncio.getImagen());
        anuncio.setUrl(a.getUrl());

        return anuncioRepository.save(anuncio);

    }

    @Override
    public void delete(Anuncio p) {
        anuncioRepository.delete(p);
    }

    @Override
    public void deleteById(Long id) {
        anuncioRepository.deleteById(id);
    }

}
