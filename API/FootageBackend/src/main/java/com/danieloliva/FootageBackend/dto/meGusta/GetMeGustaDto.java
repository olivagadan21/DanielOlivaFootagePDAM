package com.danieloliva.FootageBackend.dto.meGusta;

import com.danieloliva.FootageBackend.dto.producto.GetProductoUsuarioDto;
import com.danieloliva.FootageBackend.model.MeGustaPk;
import com.danieloliva.FootageBackend.usuario.dto.GetUsuarioProductoDto;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GetMeGustaDto {

    private MeGustaPk meGustaPk;

    private GetProductoUsuarioDto getProductoUsuarioDto;

    private GetUsuarioProductoDto getUsuarioProductoDto;

}
