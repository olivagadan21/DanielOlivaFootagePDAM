package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.repository.MarcaRepository;
import com.danieloliva.FootageBackend.service.base.BaseService;
import com.danieloliva.FootageBackend.service.base.MarcaService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MarcaServiceImpl implements MarcaService {

    private final MarcaRepository marcaRepository;
    private final StorageService storageService;

    @Override
    public List<Marca> findAll() {
        return marcaRepository.findAll();
    }

    @Override
    public Optional<Marca> findById(Long id) {
        return marcaRepository.findById(id);
    }

    @Override
    public Marca save(Marca m) {

        return marcaRepository.save(m);

    }

    @Override
    public Marca edit(Marca m, Long id) {

        Marca marca = marcaRepository.getById(id);

        storageService.deleteFile(marca.getImagen());

        marca.setNombre(m.getNombre());
        marca.setImagen(m.getImagen());

        return marcaRepository.save(marca);

    }

    @Override
    public void delete(Marca m) {

        storageService.deleteFile(m.getImagen());
        marcaRepository.delete(m);

    }

    @Override
    public void deleteById(Long id) {

        storageService.deleteFile(findById(id).get().getImagen());
        marcaRepository.deleteById(id);

    }
}
