package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.repository.ProductoRepository;
import com.danieloliva.FootageBackend.service.base.BaseService;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class ProductoService extends BaseService<Producto, UUID, ProductoRepository> {
}
