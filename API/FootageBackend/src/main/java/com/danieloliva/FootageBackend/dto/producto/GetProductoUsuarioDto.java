package com.danieloliva.FootageBackend.dto.producto;

import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.model.Talla;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetProductoUsuarioDto {

    private Long id;

    private String titulo;

    private double precio;

    private boolean original;

    private String foto;

    private Marca marca;

    private Talla talla;

}
