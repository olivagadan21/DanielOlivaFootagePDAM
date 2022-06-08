package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.model.Talla;

import java.util.List;
import java.util.Optional;

public interface TallaService {

    List<Talla> findAll();

    Optional<Talla> findById(Long id);

    Talla save(Talla t);

    Talla edit(Talla t, Long id);

    void delete(Talla t);

    void deleteById(Long id);

}
