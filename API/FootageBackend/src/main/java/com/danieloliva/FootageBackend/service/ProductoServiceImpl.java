package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.dto.producto.CreateProductoDto;
import com.danieloliva.FootageBackend.dto.producto.ProductoDtoConverter;
import com.danieloliva.FootageBackend.model.*;
import com.danieloliva.FootageBackend.repository.*;
import com.danieloliva.FootageBackend.service.base.BaseService;
import com.danieloliva.FootageBackend.service.base.ProductoService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import com.danieloliva.FootageBackend.usuario.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductoServiceImpl implements ProductoService {

    private final TallaRepository tallaRepository;
    private final UsuarioRepository usuarioRepository;
    private final SeccionRepository seccionRepository;
    private final CategoriaRepository categoriaRepository;
    private final MarcaRepository marcaRepository;
    private final ProductoRepository productoRepository;
    private final StorageService storageService;

    @Override
    public List<Producto> findAll() {
        return productoRepository.findAll();
    }

    @Override
    public Optional<Producto> findById(Long id) {
        return productoRepository.findById(id);
    }

    @Override
    public List<Producto> findByOriginal() {
        return productoRepository.findByOriginal();
    }

    @Override
    public List<Producto> findByIntercambio() {
        return productoRepository.findByIntercambio();
    }

    @Override
    public List<Producto> findBySeccion(Long id) {
        Seccion seccion = seccionRepository.getById(id);
        return productoRepository.findBySeccion(seccion);
    }

    @Override
    public List<Producto> findByCategoria(Long id) {
        Categoria categoria = categoriaRepository.getById(id);
        return productoRepository.findByCategoria(categoria);
    }

    @Override
    public List<Producto> findByMarca(Long id) {
        Marca marca = marcaRepository.getById(id);
        return productoRepository.findByMarca(marca);
    }

    @Override
    public List<Producto> findByTalla(Long id) {
        Talla talla = tallaRepository.getById(id);
        return productoRepository.findByTalla(talla);
    }

    @Override
    public List<Producto> findByUsuario(Long id) {
        Usuario usuario = usuarioRepository.getById(id);
        return productoRepository.findByUsuario(usuario);
    }

    @Override
    public Producto save(Producto p) {
        return productoRepository.save(p);
    }

    @Override
    public Producto edit(Producto p, Long id) throws IOException {

        Producto producto = productoRepository.getById(id);

        String name = StringUtils.cleanPath(String.valueOf(producto.getFoto())).replace("http://localhost:8080/download/", "").replace("%20", " ");

        Path pa = storageService.load(name);

        String filename = StringUtils.cleanPath(String.valueOf(pa)).replace("http://localhost:8080/download/", "").replace("%20", " ");

        Path path = Paths.get(filename);

        storageService.deleteFile(path);

        producto.setTitulo(p.getTitulo());
        producto.setDescripcion(p.getDescripcion());
        producto.setPrecio(p.getPrecio());
        producto.setIntercambio(p.isIntercambio());
        producto.setOriginal(p.isOriginal());
        producto.setFoto(producto.getFoto());
        producto.setUsuario(usuarioRepository.getById(p.getUsuario().getId()));
        producto.setSeccion(seccionRepository.getById(p.getSeccion().getId()));
        producto.setCategoria(categoriaRepository.getById(p.getCategoria().getId()));
        producto.setMarca(marcaRepository.getById(p.getMarca().getId()));

        return productoRepository.save(producto);

    }

    @Override
    public Producto edit2 (Producto p, Long id) {

        Producto producto = productoRepository.getById(id);

        producto.setTitulo(p.getTitulo());
        producto.setDescripcion(p.getDescripcion());
        producto.setPrecio(p.getPrecio());
        producto.setIntercambio(p.isIntercambio());
        producto.setOriginal(p.isOriginal());
        producto.setFoto(producto.getFoto());
        producto.setUsuario(usuarioRepository.getById(p.getUsuario().getId()));
        producto.setSeccion(seccionRepository.getById(p.getSeccion().getId()));
        producto.setCategoria(categoriaRepository.getById(p.getCategoria().getId()));
        producto.setMarca(marcaRepository.getById(p.getMarca().getId()));

        return productoRepository.save(producto);

    }

    @Override
    public void delete(Producto p) {
        productoRepository.delete(p);
    }

    @Override
    public void deleteById(Long id) {
        productoRepository.deleteById(id);
    }
}
