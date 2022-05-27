package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.model.MeGusta;

import java.util.List;
import java.util.Optional;

public interface MeGustaService {

    List<MeGusta> findAll();

    Optional<MeGusta> findById(Long id);

    MeGusta save(MeGusta m);

    MeGusta edit(MeGusta m, Long id);

    void delete(MeGusta m);

    void deleteById(Long id);

}
