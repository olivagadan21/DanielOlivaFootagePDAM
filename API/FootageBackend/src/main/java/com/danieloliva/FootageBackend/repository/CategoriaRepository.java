package com.danieloliva.FootageBackend.repository;

import com.danieloliva.FootageBackend.model.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface CategoriaRepository extends JpaRepository<Categoria, Long> {
}
