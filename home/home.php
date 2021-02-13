<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Proyecto Final HLC</title>
  </head>
  <body>
    <?php
      // Controlamos que se acceda desde login.php
      if(!isset($_GET["id_session_user"])){

        echo "<h2>Debe primero estar registrado.</h2>";
        echo "<br><br>";
        echo '<a href="../login/login.php"><button type="button">Iniciar sesión</button></a>';

      }else{

        $id_session_user = $_GET["id_session_user"];
        session_start();
        $_SESSION['id_user'] = $id_session_user;

        echo "<h2>MENÚ PRINCIPAL</h2>";

        echo '<form action="cursos/cursos.php" method="GET">';
          echo '<input type="submit" name="cursos" value=Cursos /><br><br>';
        echo '</form>';
        echo '<form action="asignaturas/asignaturas.php" method="GET">';
          echo '<input type="submit" name="asignaturas" value=Asignaturas /><br><br>';
        echo '</form>';
        echo '<form action="tareas/tareas.php" method="GET">';
          echo '<input type="submit" name="tareas" value=Tareas /><br><br>';
        echo '</form>';

        echo '<a href="cerrar.php"><button type="button">Cerrar sesión</button></a>';

      }
    ?>
  </body>
</html>