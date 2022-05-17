package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.model.Marca;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

public interface MarcaService {

    List<Marca> findAll();

    Optional<Marca> findById(Long id);

    Marca save(Marca m, MultipartFile file);

    Marca edit(Marca m, MultipartFile file, Long id);

    void delete(Marca m);

    void deleteById(Long id);

}
