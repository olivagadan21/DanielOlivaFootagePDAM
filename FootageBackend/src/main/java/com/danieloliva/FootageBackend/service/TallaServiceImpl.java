package com.danieloliva.FootageBackend.service;

import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.model.Talla;
import com.danieloliva.FootageBackend.repository.CategoriaRepository;
import com.danieloliva.FootageBackend.repository.TallaRepository;
import com.danieloliva.FootageBackend.service.base.TallaService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TallaServiceImpl implements TallaService {

    private final TallaRepository tallaRepository;
    private final CategoriaRepository categoriaRepository;

    @Override
    public List<Talla> findAll() {
        return tallaRepository.findAll();
    }

    @Override
    public Optional<Talla> findById(Long id) {
        return tallaRepository.findById(id);
    }

    @Override
    public Talla save(Talla t) {
        return tallaRepository.save(t);
    }

    @Override
    public Talla edit(Talla t, Long id) {

        Talla talla = tallaRepository.getById(id);

        talla.setNombre(t.getNombre());
        talla.setCategoria(t.getCategoria());

        return tallaRepository.save(talla);
    }

    @Override
    public void delete(Talla t) {
        tallaRepository.delete(t);
    }

    @Override
    public void deleteById(Long id) {
        tallaRepository.deleteById(id);
    }

    @Override
    public List<Talla> findByCategoria(Long id) {
        Categoria categoria = categoriaRepository.getById(id);
        return tallaRepository.findByCategoria(categoria);
    }
}
