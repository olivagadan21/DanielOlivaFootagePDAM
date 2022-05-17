package com.danieloliva.FootageBackend.repository;

import com.danieloliva.FootageBackend.model.Marca;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface MarcaRepository extends JpaRepository<Marca, Long> {
}
