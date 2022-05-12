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
@Table(name = "anuncios")
public class Anuncio implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    private String empresa;

    private String url;

    private String imagen;

}
