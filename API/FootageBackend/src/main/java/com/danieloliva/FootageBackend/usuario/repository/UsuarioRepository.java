
package com.danieloliva.FootageBackend.usuario.repository;

import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import java.util.List;
import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Optional<Usuario> findFirstByEmail(String nombre);
    Optional<Usuario> findById(Long id);
    List<Usuario> findByRol (RolUsuario rol);
    Usuario findByUsername(String username);
    boolean existsByUsername(String username);

    @Query(value = """
            select * from USUARIOS U where U.PREMIUM = true
            """, nativeQuery = true)
    List<Usuario> findByPremium ();

    Optional<Usuario> findByEmail(String email);

}
