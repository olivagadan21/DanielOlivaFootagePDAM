package com.danieloliva.FootageBackend.model;

import com.danieloliva.FootageBackend.usuario.model.Usuario;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Producto implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    private String titulo;

    @Lob
    private String descripcion;

    private double precio;

    private boolean intercambio;

    private boolean original;

    @Column
    @ElementCollection(targetClass = String.class)
    private List<String> fotos = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "usuario_id", updatable = false, nullable = false)
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "seccion_id")
    private Seccion seccion;

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    private Categoria categoria;

    @ManyToOne
    @JoinColumn(name = "marca_id")
    private Marca marca;

}
