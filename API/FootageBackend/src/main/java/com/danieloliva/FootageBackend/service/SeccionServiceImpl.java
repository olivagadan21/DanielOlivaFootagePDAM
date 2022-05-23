package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Seccion;
import com.danieloliva.FootageBackend.repository.SeccionRepository;
import com.danieloliva.FootageBackend.service.base.SeccionService;
import com.danieloliva.FootageBackend.service.base.StorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SeccionServiceImpl implements SeccionService {

    private final StorageService storageService;
    private final SeccionRepository seccionRepository;

    @Override
    public List<Seccion> findAll() {
        return seccionRepository.findAll();
    }

    @Override
    public Optional<Seccion> findById(Long id) {
        return seccionRepository.findById(id);
    }

    @Override
    public Seccion save(Seccion s) {
        return seccionRepository.save(s);
    }

    @Override
    public Seccion edit(Seccion s, Long id) {

        Seccion seccion = seccionRepository.getById(id);

        storageService.deleteFile(seccion.getImagen());

        seccion.setNombre(s.getNombre());
        seccion.setImagen(s.getImagen());

        return seccionRepository.save(seccion);
    }

    @Override
    public void delete(Seccion s) {
        storageService.deleteFile(s.getImagen());
        seccionRepository.delete(s);
    }

    @Override
    public void deleteById(Long id) {
        storageService.deleteFile(seccionRepository.getById(id).getImagen());
        seccionRepository.deleteById(id);
    }
}
