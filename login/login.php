<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Proyecto Final HLC</title>
    </head>
    <body>
        <h2>INICIAR SESIÓN</h2>
        <form action="login.php" method="GET">
            <p>Usuario:</p>
            <input name="n_user" type="text" required/>
            <br><br>
            <p>Contraseña:</p>
            <input name="password" type="password" required/>
            <br><br>
            <input name="access_home" type="submit" value="Iniciar sesión" />
        </form> 

        <?php
            include "../init_meedo.php";

            if(isset($_GET["access_home"])){
                $n_user = $_GET['n_user'];
                $password = $_GET['password'];

                // Método que me permite la autentificación.
                login($database, $n_user, $password);
        
            }
            
            function login($database, $n_user, $password) {
                $pass_login = false;
                $id_session_user;

                // SELECT contraseña FROM alumno WHERE nom_alum = $n_user; 
                $resultado = $database->select("alumno",[
                    "cod_alum",
                    "password"],
                    ['nom_alum' => $n_user]
                );

                if(empty($resultado)){
                    echo '<script>alert("No existe el usuario, inténtelo de nuevo.");</script>';
                }else{
                    if($resultado[0]["password"] == $password){
                        $pass_login = true;
                        $id_session_user = $resultado[0]["cod_alum"];
                    }

                    if($pass_login){
                        // Redirección a la página de home con la Id del usuario de la sesión actual.
                        header("Location: ../home/home.php?id_session_user=$id_session_user");

                    }else{
                        echo '<script>alert("Contraseña errónea, inténtelo de nuevo.");</script>';
                    }
                }
                
            }
        ?>
    </body>
</html>