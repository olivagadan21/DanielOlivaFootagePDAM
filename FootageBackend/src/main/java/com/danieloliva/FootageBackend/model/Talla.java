package com.danieloliva.FootageBackend.model;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "tallas")
public class Talla implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    private String nombre;

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    @NotNull
    private Categoria categoria;

}
