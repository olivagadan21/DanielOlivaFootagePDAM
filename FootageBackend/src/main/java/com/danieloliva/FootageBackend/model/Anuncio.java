package com.danieloliva.FootageBackend.model;

import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Anuncio implements Serializable {

    @Id
    @GeneratedValue
    private Long id;

    private String empresa;

    private String url;

    private String imagen;

}
