package com.danieloliva.FootageBackend.model;

import lombok.*;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "secciones")
public class Seccion implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    private String nombre;

    private String imagen;

}
