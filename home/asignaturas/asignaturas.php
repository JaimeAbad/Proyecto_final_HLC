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
              
        // Control accesop desde login.php
        if(!isset($_SESSION['id_user'])){

            echo "<h2>Debe estar registrado.</h2>";
            echo "<br><br>";
            echo '<a href="../../login/login.php"><button type="button">Iniciar sesión</button></a>';
    
        }else{

            $id_session_user = $_SESSION['id_user'];

            // aqui irá la select 
            // $resultado = $database->select("alum_curso",[
            //     "cod_curso"],
            //     ['cod_alum' => $id_session_user]
            // );

            //Si no obtenemos resultados
            if(empty($resultado)){

            //Mostrar resultados
            }else{
                
                

            }
        }
      ?>
  </body>
</html>