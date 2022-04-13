
package com.danieloliva.FootageBackend.usuario.repository;

import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
import java.util.UUID;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Optional<Usuario> findFirstByEmail(String email);
    Optional<Usuario> findById(Long id);
    Page<Usuario> findByRol (RolUsuario rol, Pageable pageable);
    boolean existsByNombre(String nombre);

}
