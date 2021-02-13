<?php
    include "../../init_meedo.php";
    session_start();
    $id_session_user = $_SESSION['id_user'];

    $nom_centro = $_POST['n_centro'];
    $anio_ini = $_POST['anio_ini'];
    $anio_fin = $_POST['anio_fin'];
    $descript = $_POST['descript'];

    //Insercción de datos en la tabla 'cursos'.
    $database->insert("curso", [
        "nom_centro" => $nom_centro,
        "anio_ini" => $anio_ini,
        "anio_fin" => $anio_fin,
        "descript_curso" => $descript
    ]);

    // Recuperación del cod_curso generado.
    $curso_data = $database->select("curso",
        ["cod_curso"],
        ['nom_centro' => $nom_centro]
    );

    $cod_curso = $curso_data[0]["cod_curso"];

    //Insercción de datos en la tabla 'alum_curso'.
    $database->insert("alum_curso", [
        "cod_curso" => $cod_curso,
        "cod_alum" => $id_session_user,
    ]);


?>