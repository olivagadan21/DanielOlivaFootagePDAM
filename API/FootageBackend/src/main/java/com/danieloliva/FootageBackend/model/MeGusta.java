package com.danieloliva.FootageBackend.model;

import com.danieloliva.FootageBackend.usuario.model.Usuario;
import lombok.*;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class MeGusta {

    @Builder.Default
    @EmbeddedId
    private MeGustaPk id = new MeGustaPk();

    @ManyToOne
    @MapsId("producto_id")
    @JoinColumn(name = "producto_id")
    private Producto producto;

    @ManyToOne
    @MapsId("usuario_id")
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    public void addToProducto(Producto p) {
        producto = p;
        p.getMeGustas().add(this);
    }

    public void removeFromProducto(Producto p) {
        p.getMeGustas().remove(this);
        producto=null;
    }

    public void addToUsuario(Usuario u) {
        usuario = u;
        u.getMeGustas().add(this);
    }

    public void removeFromUsuario(Usuario u) {
        u.getMeGustas().remove(this);
        usuario=null;
    }

}
