
package com.danieloliva.FootageBackend.usuario.service;

import com.danieloliva.FootageBackend.service.base.BaseService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import com.danieloliva.FootageBackend.usuario.dto.CreateUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.GetUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.UpdateUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.UsuarioDtoConverter;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import com.danieloliva.FootageBackend.usuario.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.UUID;

@Service("userDetailsService")
@RequiredArgsConstructor
public class UsuarioService extends BaseService<Usuario, Long, UsuarioRepository> implements UserDetailsService {

    private final UsuarioDtoConverter usuarioDtoConverter;
    private final StorageService storageService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return this.repositorio.findFirstByEmail(email).orElseThrow(()-> new UsernameNotFoundException(email + " no encontrado"));
    }

    public GetUsuarioDto saveUser (CreateUsuarioDto createUsuarioDto) {
        return usuarioDtoConverter.usuarioToGetUsuarioDto(usuarioDtoConverter.createUsuarioUserDtoToUsuario(createUsuarioDto));
    }

    public GetUsuarioDto saveAdmin (CreateUsuarioDto createUsuarioDto) {
        return usuarioDtoConverter.usuarioToGetUsuarioDto(usuarioDtoConverter.createUsuarioAdminDtoToUsuario(createUsuarioDto));
    }

    public Usuario editMyProfile  (UpdateUsuarioDto newUser, MultipartFile file, Usuario usuarioAuth) {

        usuarioAuth.setNombre(newUser.getNombre());
        usuarioAuth.setApellidos(newUser.getApellidos());
        usuarioAuth.setUsername(newUser.getUsername());
        usuarioAuth.setLocalizacion(newUser.getLocalizacion());
        usuarioAuth.setPremium(newUser.isPremium());
        usuarioAuth.setRol(newUser.getRol());

        storageService.deleteFile(usuarioAuth.getAvatar());

        String filename = storageService.store(file);

        String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename)
                .toUriString();

        save(usuarioAuth);

        return usuarioAuth;

    }

}
