package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.dto.producto.CreateProductoDto;
import com.danieloliva.FootageBackend.dto.producto.ProductoDtoConverter;
import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.model.Seccion;
import com.danieloliva.FootageBackend.repository.CategoriaRepository;
import com.danieloliva.FootageBackend.repository.MarcaRepository;
import com.danieloliva.FootageBackend.repository.ProductoRepository;
import com.danieloliva.FootageBackend.repository.SeccionRepository;
import com.danieloliva.FootageBackend.service.base.BaseService;
import com.danieloliva.FootageBackend.service.base.ProductoService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import com.danieloliva.FootageBackend.usuario.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductoServiceImpl implements ProductoService {

    private final UsuarioRepository usuarioRepository;
    private final SeccionRepository seccionRepository;
    private final CategoriaRepository categoriaRepository;
    private final MarcaRepository marcaRepository;
    private final ProductoRepository productoRepository;
    private final StorageService storageService;
    private final ProductoDtoConverter productoDtoConverter;

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
    public Producto save(CreateProductoDto p, MultipartFile file1, MultipartFile file2) {

        Producto producto = productoDtoConverter.createProductoDtoToProducto(p, file1, file2);

        return productoRepository.save(producto);

    }

    @Override
    public Producto edit(CreateProductoDto p, MultipartFile file1, MultipartFile file2, Long id) {

        Producto producto = productoRepository.getById(id);

        storageService.deleteFile(producto.getFoto1());
        storageService.deleteFile(producto.getFoto2());

        String filename1 = storageService.store(file1);
        String filename2 = storageService.store(file2);

        String uri1 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename1)
                .toUriString();

        String uri2 = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/download/")
                .path(filename2)
                .toUriString();

        producto.setTitulo(p.getTitulo());
        producto.setDescripcion(p.getDescripcion());
        producto.setPrecio(p.getPrecio());
        producto.setIntercambio(p.isIntercambio());
        producto.setOriginal(p.isOriginal());
        producto.setFoto1(filename1);
        producto.setFoto2(filename2);
        producto.setUsuario(usuarioRepository.getById(p.getUsuario()));
        producto.setSeccion(seccionRepository.getById(p.getSeccion()));
        producto.setCategoria(categoriaRepository.getById(p.getCategoria()));
        producto.setMarca(marcaRepository.getById(p.getMarca()));

        return productoRepository.save(producto);

    }

    @Override
    public void delete(Producto p) {
        storageService.deleteFile(p.getFoto1());
        storageService.deleteFile(p.getFoto2());
        productoRepository.delete(p);
    }

    @Override
    public void deleteById(Long id) {
        storageService.deleteFile(productoRepository.getById(id).getFoto1());
        storageService.deleteFile(productoRepository.getById(id).getFoto2());
        productoRepository.deleteById(id);
    }
}
