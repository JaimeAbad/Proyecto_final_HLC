<?php
    require 'C:\xampp\htdocs\Medoo.php'; //Preguntar Maria Ruta relativa
    use Medoo\Medoo;

    $database = new Medoo([
        'database_type' => 'mysql',
        'database_name' => 'db_gestor',
        'server' => 'localhost',
        'username' => 'root',
        'password' => ''
    ]);
?>