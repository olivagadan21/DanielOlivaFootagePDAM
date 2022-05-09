package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.model.Seccion;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Optional;

public interface SeccionService {

    List<Seccion> findAll();

    Optional<Seccion> findById(Long id);

    Seccion save(Seccion s, MultipartFile file);

    Seccion edit(Seccion s, MultipartFile file, Long id);

    void delete(Seccion s);

    void deleteById(Long id);

}
