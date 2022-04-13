package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Anuncio;
import com.danieloliva.FootageBackend.repository.AnuncioRepository;
import com.danieloliva.FootageBackend.service.base.BaseService;
import org.springframework.stereotype.Service;
import java.util.UUID;

@Service
public class AnuncioService extends BaseService<Anuncio, Long, AnuncioRepository> {
}
