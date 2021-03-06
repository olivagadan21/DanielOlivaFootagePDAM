
package com.danieloliva.FootageBackend.usuario.service;

import com.danieloliva.FootageBackend.errores.excepciones.UserEntityException;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.service.base.BaseService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import com.danieloliva.FootageBackend.usuario.dto.CreateUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.GetUsuarioDto;
import com.danieloliva.FootageBackend.usuario.dto.UsuarioDtoConverter;
import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import com.danieloliva.FootageBackend.usuario.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service("userDetailService")
@RequiredArgsConstructor
public class UsuarioService extends BaseService<Usuario, Long, UsuarioRepository> implements UserDetailsService {

    private final PasswordEncoder passwordEncoder;
    private final StorageService storageService;
    private final UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return this.repositorio.findFirstByEmail(email).orElseThrow(()-> new UsernameNotFoundException(email + " no encontrado"));
    }

    public List<Usuario> findByRol (String rolUsuario) {
        return usuarioRepository.findByRol(RolUsuario.valueOf(rolUsuario));
    }

    public Optional<Usuario> findByEmail(String email){
        return usuarioRepository.findByEmail(email);
    }

    public Usuario saveUser (CreateUsuarioDto createUsuarioDto) {
        if (!createUsuarioDto.getPassword().equalsIgnoreCase(createUsuarioDto.getPassword2()))
            throw new UserEntityException("Las contrase??as no coinciden");
        else {

            List<Producto> p = new ArrayList<>();

            Usuario usuario = Usuario.builder()
                    .nombre(createUsuarioDto.getNombre())
                    .apellidos(createUsuarioDto.getApellidos())
                    .username(createUsuarioDto.getUsername())
                    .email(createUsuarioDto.getEmail())
                    .password(passwordEncoder.encode(createUsuarioDto.getPassword()))
                    .premium(false)
                    .rol(RolUsuario.USER)
                    .localizacion("")
                    .avatar("https://api-footage.herokuapp.com/download/user.png")
                    .articulos(p)
                    .build();

            usuarioRepository.save(usuario);

            return usuario;

        }
    }

    public Usuario saveAdmin (CreateUsuarioDto createUsuarioDto) {
        if (!createUsuarioDto.getPassword().equalsIgnoreCase(createUsuarioDto.getPassword2()))
            throw new UserEntityException("Las contrase??as no coinciden");
        else {

            List<Producto> p = new ArrayList<>();

            Usuario usuario = Usuario.builder()
                    .nombre(createUsuarioDto.getNombre())
                    .apellidos(createUsuarioDto.getApellidos())
                    .username(createUsuarioDto.getUsername())
                    .email(createUsuarioDto.getEmail())
                    .password(passwordEncoder.encode(createUsuarioDto.getPassword()))
                    .premium(createUsuarioDto.isPremium())
                    .rol(RolUsuario.ADMIN)
                    .localizacion(createUsuarioDto.getLocalizacion())
                    .avatar("https://api-footage.herokuapp.com/download/user.png")
                    .articulos(p)
                    .build();

            usuarioRepository.save(usuario);

            return usuario;

        }
    }

    public Usuario editProfile  (CreateUsuarioDto newUser, MultipartFile file, Usuario usuarioAuth) throws IOException {

        usuarioAuth.setNombre(newUser.getNombre());
        usuarioAuth.setApellidos(newUser.getApellidos());
        usuarioAuth.setUsername(newUser.getUsername());
        usuarioAuth.setLocalizacion(newUser.getLocalizacion());
        usuarioAuth.setPremium(newUser.isPremium());

        if (!file.isEmpty()) {

            String name = StringUtils.cleanPath(String.valueOf(usuarioAuth.getAvatar())).replace("https://api-footage.herokuapp.com/download/", "").replace("%20", " ");

            Path pa = storageService.load(name);

            String filename = StringUtils.cleanPath(String.valueOf(pa)).replace("https://api-footage.herokuapp.com/download/", "").replace("%20", " ");

            Path path = Paths.get(filename);

            storageService.deleteFile(path);

            String filename2 = storageService.store(file);

            String uri = ServletUriComponentsBuilder.fromCurrentContextPath()
                    .path("/download/")
                    .path(filename2)
                    .toUriString();

            usuarioAuth.setAvatar(uri);
        }

        save(usuarioAuth);

        return usuarioAuth;

    }

    public Usuario editProfile  (CreateUsuarioDto newUser, Usuario usuarioAuth) {

        usuarioAuth.setNombre(newUser.getNombre());
        usuarioAuth.setApellidos(newUser.getApellidos());
        usuarioAuth.setUsername(newUser.getUsername());
        usuarioAuth.setLocalizacion(newUser.getLocalizacion());
        usuarioAuth.setPremium(newUser.isPremium());
        usuarioAuth.setAvatar(usuarioAuth.getAvatar());
        save(usuarioAuth);
        return usuarioAuth;

    }

    public List<Usuario> findAllPremium () {
        return usuarioRepository.findByPremium();
    }

}
