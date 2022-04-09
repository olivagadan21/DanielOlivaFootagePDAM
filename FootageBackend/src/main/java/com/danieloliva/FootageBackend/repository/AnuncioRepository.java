package com.danieloliva.FootageBackend.repository;

import com.danieloliva.FootageBackend.model.Anuncio;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface AnuncioRepository extends JpaRepository<Anuncio, UUID> {
}
