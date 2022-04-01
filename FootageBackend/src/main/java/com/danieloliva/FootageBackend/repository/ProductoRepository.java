package com.danieloliva.FootageBackend.repository;

import com.danieloliva.FootageBackend.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ProductoRepository extends JpaRepository<Producto, UUID> {
}
