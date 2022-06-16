package com.danieloliva.FootageBackend.controller;

import com.danieloliva.FootageBackend.dto.producto.CreateProductoDto;
import com.danieloliva.FootageBackend.dto.producto.GetProductoDto;
import com.danieloliva.FootageBackend.dto.producto.ProductoDtoConverter;
import com.danieloliva.FootageBackend.model.Producto;
import com.danieloliva.FootageBackend.service.base.ProductoService;
import com.danieloliva.FootageBackend.usuario.model.RolUsuario;
import com.danieloliva.FootageBackend.usuario.model.Usuario;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@Tag(name = "Producto", description = "Controller de los productos")
@RequestMapping("/producto/")
@CrossOrigin(origins = "http://localhost:4200")
public class ProductoController {

    private final ProductoService productoService;
    private final ProductoDtoConverter productoDtoConverter;

    @Operation(summary = "Obtiene lista de productos")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los productos",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los productos",
                    content = @Content),
    })
    @GetMapping("")
    public ResponseEntity<List<GetProductoDto>> findAll() {

        List<Producto> productos = productoService.findAll();

        if (productos.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            List<GetProductoDto> p = productos.stream().map(productoDtoConverter::getProductoDto).toList();
            return ResponseEntity.ok().body(p);
        }

    }

    @Operation(summary = "Obtiene un producto en base a su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha encontrado el producto",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha encontrado el producto",
                    content = @Content),
    })
    @GetMapping("{id}")
    public ResponseEntity<GetProductoDto> findOne(@PathVariable Long id) {

        Optional<Producto> producto = productoService.findById(id);

        if (producto.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            GetProductoDto p = productoDtoConverter.getProductoDto(producto.get());
            return ResponseEntity.ok().body(p);
        }

    }

    @Operation(summary = "Obtiene lista de productos originales")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los productos originales",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los productos originales",
                    content = @Content),
    })
    @GetMapping("/original")
    public ResponseEntity<List<GetProductoDto>> findByOriginal() {

        List<Producto> originales = productoService.findByOriginal();

        if (originales.isEmpty())
            return ResponseEntity.noContent().build();
        else
            return ResponseEntity.ok().body(originales.stream().map(productoDtoConverter::getProductoDto).toList());

    }

    @Operation(summary = "Obtiene lista de productos en los que están permitidos el intercambio")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los productos con la opción de intercambio",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los productos con la opción de intercambio",
                    content = @Content),
    })
    @GetMapping("/intercambio")
    public ResponseEntity<List<GetProductoDto>> findByIntercambio() {

        List<Producto> intercambios = productoService.findByIntercambio();

        if (intercambios.isEmpty())
            return ResponseEntity.noContent().build();
        else
            return ResponseEntity.ok().body(intercambios.stream().map(productoDtoConverter::getProductoDto).toList());

    }

    @Operation(summary = "Obtiene lista de productos de una sección concreta")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los productos de esa sección",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los productos de esa sección",
                    content = @Content),
    })
    @GetMapping("/seccion/{id}")
    public ResponseEntity<List<GetProductoDto>> findBySeccion(@PathVariable Long id) {

        List<Producto> p = productoService.findBySeccion(id);

        if (p.isEmpty())
            return ResponseEntity.noContent().build();
        else
            return ResponseEntity.ok().body(p.stream().map(productoDtoConverter::getProductoDto).toList());

    }

    @Operation(summary = "Obtiene lista de productos de una categoria concreta")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los productos de esa categoria",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los productos de esa categoria",
                    content = @Content),
    })
    @GetMapping("/categoria/{id}")
    public ResponseEntity<List<GetProductoDto>> findByCategoria(@PathVariable Long id) {

        List<Producto> p = productoService.findByCategoria(id);

        if (p.isEmpty())
            return ResponseEntity.noContent().build();
        else
            return ResponseEntity.ok().body(p.stream().map(productoDtoConverter::getProductoDto).toList());

    }

    @Operation(summary = "Obtiene lista de productos de una marca concreta")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se han encontrado los productos de esa marca",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se han encontrado los productos de esa marca",
                    content = @Content),
    })
    @GetMapping("/marca/{id}")
    public ResponseEntity<List<GetProductoDto>> findByMarca(@PathVariable Long id) {

        List<Producto> p = productoService.findByMarca(id);

        if (p.isEmpty())
            return ResponseEntity.noContent().build();
        else
            return ResponseEntity.ok().body(p.stream().map(productoDtoConverter::getProductoDto).toList());

    }

    @Operation(summary = "Crea un nuevo producto")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado el nuevo producto",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado el nuevo producto",
                    content = @Content),
    })
    @PostMapping(value = "", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<GetProductoDto> create (@RequestPart("producto") CreateProductoDto productoDto, @RequestPart("file") MultipartFile file) {

        if (productoDto.getTitulo().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {

            Producto producto = productoDtoConverter.createProductoDtoToProducto(productoDto, file);

            GetProductoDto p = productoDtoConverter.getProductoDto(productoService.save(producto));

            return ResponseEntity.status(HttpStatus.CREATED).body(p);
        }

    }

    @Operation(summary = "Crea un nuevo producto")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha creado el nuevo producto",
                    content = {@Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "404",
                    description = "No se ha creado el nuevo producto",
                    content = @Content),
    })
    @PostMapping("withoutImage")
    public ResponseEntity<GetProductoDto> create (@RequestBody CreateProductoDto productoDto) {

        if (productoDto.getTitulo().isEmpty()) {
            return ResponseEntity.badRequest().build();
        } else {
            Producto producto = productoDtoConverter.createProductoDtoToProducto(productoDto);
            GetProductoDto p = productoDtoConverter.getProductoDto(productoService.save(producto));
            return ResponseEntity.status(HttpStatus.CREATED).body(p);
        }

    }

    @Operation(summary = "Edita un producto anteriormente creado, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado el producto",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado el producto",
                    content = @Content),
    })
    @PutMapping(value = "{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<GetProductoDto> edit (@AuthenticationPrincipal Usuario usuario, @RequestPart("producto") CreateProductoDto productoDto, @RequestPart("file1") MultipartFile file, @PathVariable Long id) throws IOException {

        Optional<Producto> producto = productoService.findById(id);

        if (producto.isEmpty())
            return ResponseEntity.notFound().build();
        else {

            if (producto.get().getUsuario().equals(usuario) || usuario.getRol().equals(RolUsuario.ADMIN))
                return ResponseEntity.ok().body(productoDtoConverter.getProductoDto(productoService.edit(productoDtoConverter.createProductoDtoToProducto(productoDto, file), id)));
            else
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();

        }

    }

    @Operation(summary = "Edita un producto anteriormente creado, buscando por su ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha editado el producto",
                    content = { @Content(mediaType = "application/json",
                            schema = @Schema(implementation = GetProductoDto.class))}),
            @ApiResponse(responseCode = "400",
                    description = "No se ha editado el producto",
                    content = @Content),
    })
    @PutMapping("{id}/withoutImage")
    public ResponseEntity<GetProductoDto> edit (@AuthenticationPrincipal Usuario usuario, @RequestBody CreateProductoDto productoDto, @PathVariable Long id) throws IOException {

        Optional<Producto> producto = productoService.findById(id);

        if (producto.isEmpty())
            return ResponseEntity.notFound().build();
        else {

            if (producto.get().getUsuario().equals(usuario) || usuario.getRol().equals(RolUsuario.ADMIN))
                return ResponseEntity.ok().body(productoDtoConverter.getProductoDto(productoService.edit(productoDtoConverter.createProductoDtoToProducto(productoDto), id)));
            else
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();

        }

    }

    @Operation(summary = "Borra un producto específico")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Se ha borrado el producto",
                    content = { @Content(mediaType = "application/json") }),
            @ApiResponse(responseCode = "400",
                    description = "No se ha borrado el producto",
                    content = @Content),
    })
    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {

        if (productoService.findById(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            productoService.deleteById(id);
            return ResponseEntity.noContent().build();
        }

    }

}
