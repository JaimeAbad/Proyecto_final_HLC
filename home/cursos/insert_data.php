<?php
    include "../../init_meedo.php";
    session_start();
    $id_session_user = $_SESSION['id_user'];

    $nom_centro = $_POST['n_centro'];
    $anio_ini = $_POST['anio_ini'];
    $anio_fin = $_POST['anio_fin'];
    $descript = $_POST['descript'];

    // INSERT INTO curso (nom_centro, anio_ini, anio_fin, descript_curso) VALUES($nom_centro, $anio_ini, $anio_fin, $descript);
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

    // INSERT INTO alum_curso (cod_alum, cod_curso) VALUES($cod_curso, $id_session_user);
    $database->insert("alum_curso", [
        "cod_curso" => $cod_curso,
        "cod_alum" => $id_session_user,
    ]);


?>