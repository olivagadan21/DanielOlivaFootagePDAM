package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.model.Categoria;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Optional;

public interface CategoriaService {

    List<Categoria> findAll();

    Optional<Categoria> findById(Long id);

    Categoria save(Categoria p, MultipartFile file);

    Categoria edit(Categoria p, MultipartFile file, Long id);

    void delete(Categoria p);

    void deleteById(Long id);

}
