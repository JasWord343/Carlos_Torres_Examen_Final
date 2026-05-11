<?php
session_start();
require_once "include/connexion_bd.php";

$message = "";

if (isset($_GET["message"]) && $_GET["message"] == "inscription_reussie") {
    $message = "Inscription reussie. Vous pouvez vous connecter.";
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $requete = $connexion->prepare("
        SELECT noUser, username, password, fonction
        FROM tblUsers
        WHERE username = :username
    ");

    $requete->execute([
        "username" => $username
    ]);

    $user = $requete->fetch();

    if ($user && password_verify($password, $user["password"])) {
        $_SESSION["noUser"] = $user["noUser"];
        $_SESSION["username"] = $user["username"];
        $_SESSION["fonction"] = $user["fonction"];

        header("Location: fournisseurs.php");
        exit();
    }

    $message = "Utilisateur ou mot de passe invalide.";
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Connexion</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <h1>Connexion</h1>

        <?php if ($message != "") : ?>
            <p class="message"><?php echo htmlspecialchars($message); ?></p>
        <?php endif; ?>

        <form method="POST" action="connexion.php">
            <label>
                Utilisateur :
                <input type="text" name="username" required maxlength="30">
            </label>
            <label>
                Mot de passe :
                <input type="password" name="password" required maxlength="255">
            </label>
            <input type="submit" value="Se connecter">
        </form>

        <a href="inscription.php">Inscription</a>
    </body>
</html>
