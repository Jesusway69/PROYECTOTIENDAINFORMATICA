package clasestiendainformatica;

public class Validar {

  public static boolean nombreProducto(String np) {
    return np.matches("[0-9a-zA-ZñÑáéíóú\\s]+");
  }

  public static boolean descripcion(String nd) {
      return nd.matches("[0-9\"\\.a-zA-ZñÑáéíóú\\s]+");
  }

  public static boolean precio(String pr) {
    return pr.matches("([0-9]+\\.[0-9]+)||[0-9]+");
  }

}

