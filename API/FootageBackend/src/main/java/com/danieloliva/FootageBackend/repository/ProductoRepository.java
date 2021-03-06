package com.danieloliva.FootageBackend.repository;

import com.danieloliva.FootageBackend.model.*;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface ProductoRepository extends JpaRepository<Producto, Long> {

    @Query(value = """
            SELECT * FROM PRODUCTOS P WHERE P.ORIGINAL = TRUE
            """, nativeQuery = true)
    List<Producto> findByOriginal();

    @Query(value = """
            SELECT * FROM PRODUCTOS P WHERE P.INTERCAMBIO = TRUE
            """, nativeQuery = true)
    List<Producto> findByIntercambio();

    List<Producto> findBySeccion(Seccion seccion);
    List<Producto> findByCategoria(Categoria categoria);
    List<Producto> findByMarca(Marca marca);
    List<Producto> findByTalla(Talla talla);
    List<Producto> findByUsuario(Usuario usuario);


}
