package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.dto.producto.CreateProductoDto;
import com.danieloliva.FootageBackend.model.Producto;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Optional;

public interface ProductoService {

    List<Producto> findAll();

    Optional<Producto> findById(Long id);

    Producto save(CreateProductoDto p, MultipartFile file1, MultipartFile file2);

    Producto edit(CreateProductoDto p, MultipartFile file1, MultipartFile file2, Long id);

    void delete(Producto p);

    void deleteById(Long id);

}
