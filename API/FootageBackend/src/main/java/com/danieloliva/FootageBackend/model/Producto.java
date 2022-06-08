package com.danieloliva.FootageBackend.model;

import com.danieloliva.FootageBackend.usuario.model.Usuario;
import lombok.*;
import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "productos")
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

    private String foto;

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

    @ManyToOne
    @JoinColumn(name = "talla_id")
    private Talla talla;

    @Builder.Default
    @OneToMany(mappedBy = "producto", cascade = {CascadeType.REMOVE})
    private List<MeGusta> meGustas = new ArrayList<>();

}
