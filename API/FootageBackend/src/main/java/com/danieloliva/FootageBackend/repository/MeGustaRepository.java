package com.danieloliva.FootageBackend.repository;

import com.danieloliva.FootageBackend.model.MeGusta;
import com.danieloliva.FootageBackend.model.MeGustaPk;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MeGustaRepository extends JpaRepository<MeGusta, MeGustaPk> {
}
