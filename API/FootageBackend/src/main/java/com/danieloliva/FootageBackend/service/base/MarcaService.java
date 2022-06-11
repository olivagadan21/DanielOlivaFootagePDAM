package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.model.Marca;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface MarcaService {

    List<Marca> findAll();

    Optional<Marca> findById(Long id);

    Marca save(Marca m);

    Marca edit(Marca m, Long id) throws IOException;

    void delete(Marca m);

    void deleteById(Long id);

}
