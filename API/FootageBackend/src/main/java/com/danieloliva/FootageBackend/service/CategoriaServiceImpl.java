package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.repository.CategoriaRepository;
import com.danieloliva.FootageBackend.service.base.CategoriaService;
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
    public Categoria save(Categoria c) {

        return categoriaRepository.save(c);

    }

    @Override
    public Categoria edit(Categoria c, Long id) {

        Categoria categoria = categoriaRepository.findById(id).get();

        categoria.setNombre(c.getNombre());
        categoria.setImagen(categoria.getImagen());

        return categoriaRepository.save(categoria);

    }

    @Override
    public void delete(Categoria c) {
        categoriaRepository.delete(c);
    }

    @Override
    public void deleteById(Long id) {
        categoriaRepository.deleteById(id);
    }

}
