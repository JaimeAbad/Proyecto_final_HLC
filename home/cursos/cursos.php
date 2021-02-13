<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Proyecto Final HLC</title>
  </head>
  <body>  
      <?php
        include "../../init_meedo.php";

        session_start();
              
        // Controlamos que se acceda desde login.php
        if(!isset($_SESSION['id_user'])){

            echo "<h2>Debe primero estar registrado.</h2>";
            echo "<br><br>";
            echo '<a href="../../login/login.php"><button type="button">Iniciar sesión</button></a>';
    
        }else{

            $id_session_user = $_SESSION['id_user'];

            // SELECT cod_curso FROM alum_curso WHERE cod_alum = $id_sesion_user; 
            $resultado = $database->select("alum_curso",[
                "cod_curso"],
                ['cod_alum' => $id_session_user]
            );

            // Si no hay resultados..
            if(empty($resultado)){

                echo "<h2>INTRODUZCA LOS DATOS DEL CURSO</h2>";

                echo '<form action="insert_data.php" method="POST">';
                    echo 'Nombre del Centro: ';
                    echo '<input name="n_centro" type="text" required/><br><br>';
                    echo 'Año de inicio: ';
                    echo '<input name="anio_ini" type="number" required/><br><br>';
                    echo 'Año de finalización: ';
                    echo '<input name="anio_fin" type="number" required/><br><br>';
                    echo 'Descripción: ';
                    echo '<input name="descript" type="text" required/><br><br>';

                    echo '<input name="insert_curso" type="submit" value="Insertar datos" />';
                echo "</form> ";

            // Si hay resultados..
            }else{
                
                $cod_curso = $resultado[0]["cod_curso"];
                $curso_data = $database->select("curso","*",
                    ['cod_curso' => $cod_curso]
                );

                $nom_centro = $curso_data[0]["nom_centro"];
                $anio_ini = $curso_data[0]["anio_ini"];
                $anio_fin = $curso_data[0]["anio_fin"];
                $descript = $curso_data[0]["descript_curso"];

                echo "<h2>DATOS DEL CURSO $anio_ini/$anio_fin</h2>";

                echo "Centro: ";
                echo "$nom_centro<br><br>";

                echo "Descripción: ";
                echo "$descript<br><br>";

            }
        }
      ?>
  </body>
</html>