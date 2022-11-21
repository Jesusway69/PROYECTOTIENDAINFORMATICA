package clasestiendainformatica;

public class Productos {

  private String codigo;
  private String nombreProducto;
  private String descripcion;
  private double precio;
  private String foto;

  public Productos() {
  }

  public Productos(String codigo, String nombreProducto, String descripcion, double precio, String foto) {
    this.codigo = codigo;
    this.nombreProducto = nombreProducto;
    this.descripcion = descripcion;
    this.precio = precio;
    this.foto = foto;
  }

  public Productos(String codigo, String nombreProducto, String descripcion, double precio) {
    this.codigo = codigo;
    this.nombreProducto = nombreProducto;
    this.descripcion = descripcion;
    this.precio = precio;
  }
  

  public String getCodigo() {
    return codigo;
  }

  public void setCodigo(String codigo) {
    this.codigo = codigo;
  }

  public String getNombreProducto() {
    return nombreProducto;
  }

  public void setNombreProducto(String nombreProducto) {
    this.nombreProducto = nombreProducto;
  }

  public String getDescripcion() {
    return descripcion;
  }

  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  public double getPrecio() {
    return precio;
  }

  public void setPrecio(double precio) {
    this.precio = precio;
  }

  public String getFoto() {
    return foto;
  }

  public void setFoto(String foto) {
    this.foto = foto;
  }

  @Override
  public String toString() {
    return "Productos{" + "codigo=" + codigo + ", nombreProducto=" + nombreProducto + ", descripcion=" + descripcion + ", precio=" + precio + ", foto=" + foto + '}';
  }
  
  

}
