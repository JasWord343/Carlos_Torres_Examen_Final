<?php
session_start();

if (!isset($_SESSION["noUser"])) {
    header("Location: connexion.php");
    exit();
}

require_once "include/connexion_bd.php";

$requete = $connexion->query("
    SELECT societe, nomContact, prenomContact, email
    FROM tblFournisseurs
    ORDER BY societe
");

$fournisseurs = $requete->fetchAll();
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Les fournisseurs</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <h1>Les fournisseurs</h1>

        <a href="deconnexion.php">Deconnexion</a>
        <a href="commandes.php">Voir les commandes</a>

        <p>Bonjour <?php echo htmlspecialchars($_SESSION["username"]);?>!</p>

        <table>
            <tr>
                <th>Societe</th>
                <th>Nom contact</th>
                <th>Courriel</th>
            </tr>

            <?php foreach ($fournisseurs as $fournisseur) : ?>
                <tr>
                    <td><?php echo htmlspecialchars($fournisseur["societe"]); ?></td>
                    <td><?php echo htmlspecialchars($fournisseur["nomContact"] . " " . $fournisseur["prenomContact"]); ?></td>
                    <td><?php echo htmlspecialchars($fournisseur["email"]); ?></td>
                </tr>
            <?php endforeach; ?>
        </table>
    </body>
</html>
