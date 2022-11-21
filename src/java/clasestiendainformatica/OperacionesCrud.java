package clasestiendainformatica;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OperacionesCrud {

    private Connection conexion;

    public OperacionesCrud(Connection conexion) {
        this.conexion = conexion;
    }

    public List<Productos> getArrayListProductos() {
        List<Productos> productos_al = new ArrayList<>();
        String query = "select * from Producto";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
               String codigo = rs.getString(1);
               String nombre = rs.getString(2);
               String descripcion = rs.getString(3);
               double precio = rs.getDouble(4);
               String foto = rs.getString(5);
               Productos producto = new Productos(codigo,nombre,descripcion,precio,foto);
               productos_al.add(producto);
            }
        } catch (Exception e) {
            productos_al = null;
        }
        return productos_al;
    }
 public Map<String, Productos> getHashMapProductos() {
        Map<String, Productos> productos_hm = new HashMap<>();

        List<Productos> productos_al = getArrayListProductos();

        for (Productos a : productos_al) {
            productos_hm.put(a.getCodigo(), a);
        }
        return productos_hm;
    }

    public boolean eliminarProductos(String codigo) {
        String query = "delete from Producto where codigo = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, codigo);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            return false;
        }
    }
    
     public boolean actualizarProductos(Productos productos) {
        String query = "update Producto set nombreProducto = ?, descripcion = ?, precio = ? where codigo = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, productos.getNombreProducto());
            ps.setString(2, productos.getDescripcion());
            ps.setDouble(3, productos.getPrecio());
            ps.setString(4, productos.getCodigo());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }

    }
}
