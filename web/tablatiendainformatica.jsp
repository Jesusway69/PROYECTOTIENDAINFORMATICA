<%-- 
    Document   : tablatiendainformatica
    Created on : 15-nov-2022, 22:06:59
    Author     : jesus
--%>

<%@page import="java.util.*"%>
<%@page import="clasestiendainformatica.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tienda de Informática</title>
    <style>
      .redondear {
        width: 50px;
        height: 50px;
        border: 2px solid blue;
        border-radius: 8px;
      }
    </style>
  </head>
  <body>
  <center><h1>Tabla de componentes para montar un PC</h1></center>

  <%
    String mensaje = "";
    ConexionMysql cm = new ConexionMysql("tiendainformatica");
    Connection conexion = cm.getConexion();

    if (conexion != null) {
      OperacionesCrud crud = new OperacionesCrud(conexion);
      List<Productos> productos_al = crud.getArrayListProductos();
      if (productos_al != null) {
  %>

  <center>
    <table border="10">
      <thead>
        <tr>
          <th>CODIGO</th>
          <th>NOMBRE</th>
          <th>DESCRIPCION</th>
          <th>PRECIO</th>
          <th>FOTO</th>
        </tr>
      </thead>
      <tbody>

        <%
          for (Productos p : productos_al) {
            String ruta = request.getContextPath()+ "/fotosproductos/" + p.getFoto();
        %>

        <tr>
          <td><%=p.getCodigo()%></td>
          <td><%=p.getNombreProducto()%></td>
          <td><%=p.getDescripcion()%></td>
          <td><%=p.getPrecio()%></td>
          <td><img class="redondear" src="<%=ruta%>"></td>
        </tr>

        <% }%>
      </tbody>
    </table>
  </center>

  <%
      } else {
        mensaje = "Error en base de datos";
      }
    } else {
      mensaje = "Error de conexión";
    }


  %>

  <br><br><br><br><br><br><br><br><br>
  <center><h3><p>************* <%=mensaje%> ************</p></h3></center>
</body>
</html>




