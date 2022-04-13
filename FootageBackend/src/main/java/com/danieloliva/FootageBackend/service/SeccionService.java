package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Seccion;
import com.danieloliva.FootageBackend.repository.SeccionRepository;
import com.danieloliva.FootageBackend.service.base.BaseService;
import org.springframework.stereotype.Service;
import java.util.UUID;

@Service
public class SeccionService extends BaseService<Seccion, Long, SeccionRepository> {
}
