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
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator",
            parameters = {
                    @org.hibernate.annotations.Parameter(
                            name = "uuid_gen_strategy_class",
                            value = "org.hibernate.id.uuid.CustomVersionOneStrategy"
                    )
            }
    )
    @Column(name = "id", updatable = false, nullable = false)
    private UUID id;

    private String titulo;

    @Lob
    private String descripcion;

    private double precio;

    private boolean intercambio;

    private boolean original;

    private List<String> fotos = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "usuario_id", updatable = false, nullable = false)
    private Usuario usuario;

}
