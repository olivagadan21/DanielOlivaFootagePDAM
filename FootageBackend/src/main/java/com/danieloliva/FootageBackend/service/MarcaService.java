package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.repository.MarcaRepository;
import com.danieloliva.FootageBackend.service.base.BaseService;
import org.springframework.stereotype.Service;
import java.util.UUID;

@Service
public class MarcaService extends BaseService<Marca, Long, MarcaRepository> {
}
