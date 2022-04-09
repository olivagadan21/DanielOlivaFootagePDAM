package com.danieloliva.FootageBackend.repository;

import com.danieloliva.FootageBackend.model.Seccion;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface SeccionRepository extends JpaRepository<Seccion, UUID> {
}
