package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.repository.CategoriaRepository;
import com.danieloliva.FootageBackend.service.base.BaseService;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class CategoriaService extends BaseService<Categoria, UUID, CategoriaRepository> {
}
