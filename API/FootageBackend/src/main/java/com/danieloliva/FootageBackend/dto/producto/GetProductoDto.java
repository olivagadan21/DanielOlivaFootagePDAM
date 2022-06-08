package com.danieloliva.FootageBackend.dto.producto;

import com.danieloliva.FootageBackend.dto.meGusta.GetMeGustaDto;
import com.danieloliva.FootageBackend.model.Categoria;
import com.danieloliva.FootageBackend.model.Marca;
import com.danieloliva.FootageBackend.model.Seccion;
import com.danieloliva.FootageBackend.model.Talla;
import com.danieloliva.FootageBackend.usuario.dto.GetUsuarioProductoDto;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetProductoDto {

    private Long id;

    private String titulo;

    private String descripcion;

    private double precio;

    private boolean intercambio;

    private boolean original;

    private String foto;

    private GetUsuarioProductoDto usuario;

    private Seccion seccion;

    private Categoria categoria;

    private Marca marca;

    private Talla talla;

    private List<GetUsuarioProductoDto> meGustas = new ArrayList<>();

}
