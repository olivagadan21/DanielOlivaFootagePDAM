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
@Table(name = "categorias")
public class Categoria implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    @NotNull(message = "{not.null}")
    private String nombre;

    @NotNull(message = "{not.null}")
    private String imagen;

}
