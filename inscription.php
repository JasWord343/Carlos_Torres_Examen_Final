<?php
require_once "include/connexion_bd.php";

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $username = $_POST["username"];
    $password = $_POST["password"];
    $fonction = $_POST["fonction"];

    $passwordHash = password_hash($password, PASSWORD_DEFAULT);

    $requete = $connexion->prepare("
        INSERT INTO tblUsers (username, password, fonction)
        VALUES (:username, :password, :fonction)
    ");

    $requete->execute([
        "username" => $username,
        "password" => $passwordHash,
        "fonction" => $fonction
    ]);

    header("Location: connexion.php?message=inscription_reussie");
    exit();
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Inscription</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <h1>Inscription</h1>
        <form method="POST" action="inscription.php">
            <label>
                Utilisateur :
                <input type="text" name="username" maxlength="30" required>
            </label>
            <label>
                Mot de passe :
                <input type="password" name="password" maxlength="255" required>
            </label>
            <label>
                Fonction :
                <input type="text" name="fonction" maxlength="25" required>
            </label>
            <input type="submit" value="S'inscrire">
        </form>
        <a href="connexion.php">Connexion</a>
    </body>
</html>