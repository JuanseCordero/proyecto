<?php
include "connection.php";
if(isset($_POST["registrar"])){
    $documento= $_POST["id"];
    $tipodoc=$_POST["tipoid"];
    $nombre1= $_POST["n1"];
    $nombre2= $_POST["n2"];
    $ape1= $_POST["p1"];
    $ape2= $_POST["p2"];
    $correo= $_POST["email"];
    $tlf=$_POST["tlf"];
    $clave=$_POST["clave"];
    $rol=$_POST["rol"];
    $date= $_POST["date"];
    $edad=$_POST["edad"];
    $grupo=$_POST["grupo"];
    $encript=md5($clave);

    $registro= mysqli_query($conn,"INSERT INTO `user`(`doc`, `tipo_doc`, `nom1`, `nom2`, `ape1`, `ape2`, `correo`, `tel`, `id_rol_fk`, `nac`, `edad`, `fk_grupo`, `clave`) VALUES ('$documento','$tipodoc','$nombre1','$nombre2','$ape1','$ape2','$correo','$tlf','$rol','$date','$edad','$grupo','$encript')") or die ("Error en el registro");
    echo"<script>alert('registro exitoso')</script>" ;
    echo"<script>window.location='dashboard.php';</script>";
}
?>