package com.danieloliva.FootageBackend.repository;

import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.model.Talla;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TallaRepository extends JpaRepository<Talla, Long> {
    List<Talla> findByCategoria(Categoria categoria);
}
