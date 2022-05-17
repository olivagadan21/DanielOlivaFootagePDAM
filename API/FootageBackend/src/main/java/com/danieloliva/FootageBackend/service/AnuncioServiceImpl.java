package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Anuncio;
import com.danieloliva.FootageBackend.repository.AnuncioRepository;
import com.danieloliva.FootageBackend.service.base.AnuncioService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import java.util.List;
import java.util.Optional;

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
    public Anuncio save(Anuncio a, MultipartFile file) {

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        Anuncio anuncio = Anuncio.builder()
                .empresa(a.getEmpresa())
                .imagen(filename)
                .url(a.getUrl())
                .build();

        return anuncioRepository.save(anuncio);
    }

    @Override
    public Anuncio edit(Anuncio a, MultipartFile file, Long id) {

        Anuncio anuncio = findById(id).get();

        storageService.deleteFile(anuncio.getImagen());

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        anuncio.setEmpresa(a.getEmpresa());
        anuncio.setImagen(filename);
        anuncio.setUrl(a.getUrl());

        return anuncioRepository.save(anuncio);

    }

    @Override
    public void delete(Anuncio p) {
        storageService.deleteFile(p.getImagen());
        anuncioRepository.delete(p);
    }

    @Override
    public void deleteById(Long id) {
        storageService.deleteFile(anuncioRepository.findById(id).get().getImagen());
        anuncioRepository.deleteById(id);
    }

}
