<%-- 
    Document   : eliminar_y_actualizar
    Created on : 16-nov-2022, 22:00:14
    Author     : jesus
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="clasestiendainformatica.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
  Connection conexion = null;
  try {
    ConexionMysql cm = new ConexionMysql("tiendainformatica");

    conexion = cm.getConexion();
  } catch (Exception e) {

  }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar y actualizar</title>
  </head>
  <body bgcolor='#DBF9FC'>
    <h1>Eliminar y actualizar productos</h1>

    <%!  Productos p = null;
      String clave = "";%>
    <%
      boolean bandera1encontro = false;
      if (request.getParameter("cmdSeleccionar") != null) {
        clave = request.getParameter("cboClaveProductos");
        if (conexion != null) {
          OperacionesCrud crud = new OperacionesCrud(conexion);
          Map<String, Productos> productos_hm = crud.getHashMapProductos();
          p = productos_hm.get(clave);
          bandera1encontro = true;
        } else {
        }
      }

      boolean bandera2eliminar = false;
      boolean bandera3eliminar = false;
      if (request.getParameter("cmdEliminar") != null) {
        String codigo = request.getParameter("txtCodigo");
        if (conexion != null) {
          OperacionesCrud crud = new OperacionesCrud(conexion);
          boolean eliminar = crud.eliminarProductos(codigo);
          if (eliminar == true) {
            bandera2eliminar = true;

          }
        } else {
          bandera3eliminar = true;
        }
      }

      boolean bandera4actualizar = false;
      boolean bandera5actualizar = false;
      boolean bandera6actualizar = false;
      if (request.getParameter("cmdActualizar") != null) {
        String codigo = request.getParameter("txtCodigo");
        String nombreProducto = request.getParameter("txtNombre");
        String descripcion = request.getParameter("txtDescripcion");
        String precio = request.getParameter("txtPrecio");
        if (Validar.nombreProducto(nombreProducto) && Validar.descripcion(descripcion) && Validar.precio(precio)) {
          if (conexion != null) {
            OperacionesCrud crud = new OperacionesCrud(conexion);
            Productos productos = new Productos(codigo, nombreProducto, descripcion, Double.parseDouble(precio));
            boolean actualizar = crud.actualizarProductos(productos);
            if (actualizar == true) {
              bandera4actualizar = true;
            }
          } else {
            bandera5actualizar = true;
          }
        } else {
          bandera6actualizar = true;
          bandera1encontro = true;
        }
      }
    %>


  <center>
    <form action="">

      <%        if (conexion != null) {
          OperacionesCrud crud = new OperacionesCrud(conexion);
          Map<String, Productos> productos_hm = crud.getHashMapProductos();

          TreeMap<String, Productos> productos_tm = new TreeMap<>(productos_hm);

          Set<String> claves = productos_tm.keySet();


      %> 

      <select name="cboClaveProductos" size="1" style='animation-fill-mode: forwards'>
        <%                  for (String s : claves) {
        %>        
        <option value='<%=s%>'><%=s%></option> 
        <%
          }
        %>
      </select>
      <input type='submit' name='cmdSeleccionar' style=" width: 120px; height: 30px; border-radius: 5px;
             color: royalblue;background-color: transparent; margin-left: 90px" value='SELECCIONAR ' />
      <%
      } else {
      %>
      <br><br><br><br><br><br><br>
      <p><center><h3>ERROR DE CONEXIÓN</h3></center></p>   

      <%
        }
      %>




    </form>
  </center>
  <br><br>

  <%        if (bandera1encontro == true) {
      String ruta = request.getContextPath() + "/fotosproductos/" + p.getFoto();
  %> 

  <center>
    <form action=''>
      <input type='hidden' name='txtCodigo' value='<%=p.getCodigo()%>' />
      <table border='4'>
        <tr>
          <th>NOMBRE</th><th>DESCRIPCION</th><th>PRECIO</th><th>FOTO</th>
        </tr>

        <tr>
          <td><input type='text' name='txtNombre' value='<%=p.getNombreProducto()%>' /></td>
          <td><input type='text' name='txtDescripcion' value='<%=p.getDescripcion()%>' /></td>
          <td><input type='text' name='txtPrecio' value='<%=p.getPrecio()%>' /></td>
          <td><img style= 'width: 50px; height: 50px; border-radius: 8px;' src='<%=ruta%>'></td>
        </tr>
      </table>
      <%
        if (bandera6actualizar == true) {
      %>  


      <center><h3>-------------------- ENTRADA DE TIPO DE DATOS INCORRECTA --------------------</h3></center>   

      <% } %>

      <br><br>
      <input style= 'width: 110px; height: 30px; border-radius: 5px; background-color: transparent;margin-rigth: 80px' title='Eliminar elemento' type='submit' name='cmdEliminar' value='ELIMINAR' />
      
      
      <input style= 'width: 110px; height: 30px; border-radius: 5px; background-color: transparent;margin-left: 80px' title='Actualizar elemento' type='submit' name='cmdActualizar' value='ACTUALIZAR' />
    </form>
  </center>
  <%
    }

    if (bandera2eliminar == true) {
  %>       
  <br><br><br><br><br><br><br>
  <p><center><h3>-------------------- ELEMENTO <%=clave%>  ELIMINADO --------------------</h3></center></p>   

<%
  }

  if (bandera3eliminar == true) {
%>       
<br><br><br><br><br><br><br>
<p><center><h3>-------------------- ERROR DE CONEXIÓN --------------------</h3></center></p>    

<%
  }

  if (bandera4actualizar == true) {
%> 
<br><br><br><br><br><br><br>
<p><center><h3>-------------------- ELEMENTO <%=clave%> ACTUALIZADO --------------------</h3></center></p>   

<%
  }

  if (bandera5actualizar == true) {
%>       
<br><br><br><br><br><br><br>
<p><center><h3>-------------------- ERROR DE CONEXIÓN --------------------</h3></center></p>   

<%
  }
%>

</body>
</html>
