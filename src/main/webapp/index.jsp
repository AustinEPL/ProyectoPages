<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro para el Evento</title>
    <!-- Enlace al archivo CSS externo -->
    <link rel="stylesheet" type="text/css" href="./css/styles.css">
    <!-- Enlace al archivo JavaScript externo -->
    <script src="./js/scripts.js" defer></script>
</head>
<body>

<div class="container">
    <h1>Bienvenidos a la lista de registro para el evento CIERRE DE CICLO 2024-I UTP INGENIERIAS</h1>

    <h2>Ingrese los siguientes datos para estar en la lista</h2>
    <form method="post" action="index.jsp" autocomplete="off">

        <table class="form-table">
            <tr>
                <td colspan="3" class="radio-group">
                    <label>¿Está inscrito en el ciclo actual?</label><br><br>
                    <label for="inscritoSi" class="radio-label">Sí</label>
                    <input type="radio" id="inscritoSi" name="inscritoCiclo" value="Sí" required>
                    <label for="inscritoNo" class="radio-label">No</label>
                    <input type="radio" id="inscritoNo" name="inscritoCiclo" value="No" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="edad">Ingrese su edad</label>
                    <input type="number"  max="99" id="edad" name="edad" required>
                </td>
                <td>
                    <label for="nombres">Ingrese sus nombres</label>
                    <input type="text" name="nombres" id="nombres" required>
                </td>
                <td>
                    <label for="apellidos">Ingrese sus apellidos</label>
                    <input type="text" name="apellidos" id="apellidos" required>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="codigo">Ingrese su código</label>
                    <input type="text" name="codigo" id="codigo" required>
                </td>
                <td>
                    <label for="email">Ingrese su correo electrónico</label>
                    <input type="email" name="email" id="email"  required>

                </td>
                <td>
                    <label for="telefono">Ingrese su número de celular</label>
                    <input type="tel" name="telefono" id="telefono" required>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <label for="carrera">Seleccione su ingeniería</label>
                    <select name="carrera" id="carrera" required>
                        <option value="Seguridad Industrial y Minera">Ingeniería de Seguridad Industrial y Minera</option>
                        <option value="Industrial">Ingeniería Industrial</option>
                        <option value="Sistemas e Informática">Ingeniería de Sistemas e Informática</option>
                        <option value="Software">Ingeniería de Software</option>
                        <option value="Ambiental">Ingeniería Ambiental</option>
                        <option value="Mecánica">Ingeniería Mecánica</option>
                        <option value="Mecatrónica">Ingeniería Mecatrónica</option>
                        <option value="Empresarial">Ingeniería Empresarial</option>
                        <option value="Electrónica">Ingeniería Electrónica</option>
                        <option value="Civil">Ingeniería Civil</option>
                        <option value="Seguridad Laboral y Ambiental">Ingeniería en Seguridad Laboral y Ambiental</option>
                        <option value="Telecomunicaciones">Ingeniería de Telecomunicaciones</option>
                        <option value="Minas">Ingeniería de Minas</option>
                        <option value="Diseño Gráfico">Ingeniería de Diseño Gráfico</option>
                        <option value="Redes y Comunicaciones">Ingeniería de Redes y Comunicaciones</option>
                        <option value="Eléctrica y de Potencia">Ingeniería Eléctrica y de Potencia</option>
                        <option value="Biomédica">Ingeniería Biomédica</option>
                        <option value="Automotriz">Ingeniería Automotriz</option>
                        <option value="Aeronáutica">Ingeniería Aeronáutica</option>
                    </select>
                </td>
            </tr>
        </table>

        <input type="submit" value="Registrarse" id="submitButton" disabled>
    </form>


    <%
        // Solo procesar si el formulario ha sido enviado
        if (request.getMethod().equalsIgnoreCase("post")) {
            // Obtener o crear el ArrayList en la sesión
            ArrayList<String[]> registros = (ArrayList<String[]>) session.getAttribute("registros");
            if (registros == null) {
                registros = new ArrayList<>();
            }

            // Obtener los parámetros del formulario
            String nombres = request.getParameter("nombres");
            String carrera = request.getParameter("carrera");


            // Agregar los datos a la lista
            registros.add(new String[]{nombres, carrera});

            // Guardar la lista actualizada en la sesión
            session.setAttribute("registros", registros);
            response.sendRedirect("index.jsp");
        }
    %>




    <button type="button" onclick="toggleTable()">¿Quieres ver quiénes asistirán?</button>

    <table id="registradosTable" class="registrados-table" style="display:none;">
        <thead>
        <tr>
            <th>Nombres</th>
            <th>Carrera</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Obtener el ArrayList de la sesión
            ArrayList<String[]> registros = (ArrayList<String[]>) session.getAttribute("registros");
            if (registros != null) {
                for (String[] registro : registros) {
        %>
        <tr>
            <td><%= registro[0] %></td>
            <td><%= registro[1] %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

</div>

</body>
</html>