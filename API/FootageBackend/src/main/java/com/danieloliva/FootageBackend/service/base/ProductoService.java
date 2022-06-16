package com.danieloliva.FootageBackend.service.base;

import com.danieloliva.FootageBackend.dto.producto.CreateProductoDto;
import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.model.Seccion;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface ProductoService {

    List<Producto> findAll();

    Optional<Producto> findById(Long id);

    List<Producto> findByOriginal();

    List<Producto> findByIntercambio();

    List<Producto> findBySeccion(Long id);

    List<Producto> findByCategoria(Long id);

    List<Producto> findByMarca(Long id);

    List<Producto> findByTalla(Long id);

    List<Producto> findByUsuario(Long id);

    Producto save(Producto p);

    Producto edit(Producto p, Long id) throws IOException;

    Producto edit2(Producto p, Long id);

    void delete(Producto p);

    void deleteById(Long id);

}
