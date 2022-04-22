package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.repository.CategoriaRepository;
import com.danieloliva.FootageBackend.service.base.BaseService;
import com.danieloliva.FootageBackend.service.base.CategoriaService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CategoriaServiceImpl implements CategoriaService {

    private final CategoriaRepository categoriaRepository;
    private final StorageService storageService;

    @Override
    public List<Categoria> findAll() {
        return categoriaRepository.findAll();
    }

    @Override
    public Optional<Categoria> findById(Long id) {
        return categoriaRepository.findById(id);
    }

    @Override
    public Categoria save(Categoria c, MultipartFile file) {

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        Categoria categoria = Categoria.builder()
                .nombre(c.getNombre())
                .imagen(filename)
                .build();

        return categoriaRepository.save(categoria);

    }

    @Override
    public Categoria edit(Categoria c, MultipartFile file, Long id) {

        Categoria categoria = categoriaRepository.findById(id).get();

        storageService.deleteFile(categoria.getImagen());

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        categoria.setNombre(c.getNombre());
        categoria.setImagen(filename);

        return categoriaRepository.save(categoria);

    }

    @Override
    public void delete(Categoria c) {
        storageService.deleteFile(c.getImagen());
        categoriaRepository.delete(c);
    }

    @Override
    public void deleteById(Long id) {
        storageService.deleteFile(categoriaRepository.findById(id).get().getImagen());
        categoriaRepository.deleteById(id);
    }

}
