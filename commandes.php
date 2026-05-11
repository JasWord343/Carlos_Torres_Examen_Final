<?php
session_start();

if (!isset($_SESSION["noUser"])) {
    header("Location: connexion.php");
    exit();
}

require_once "include/connexion_bd.php";

$requeteCommandes = $connexion->query("
    SELECT
        tblClients.nom,
        tblClients.prenom,
        tblCommandes.dateCommande,
        tblCommandes.dateExpedition,
        tblCommandes.fraisExpedition
    FROM tblCommandes
    INNER JOIN tblClients
        ON tblCommandes.refClient = tblClients.noClient
    WHERE tblCommandes.refClient = (
        SELECT refClient
        FROM tblCommandes
        GROUP BY refClient
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
    ORDER BY tblCommandes.dateCommande
");

$commandes = $requeteCommandes->fetchAll();
$client = $commandes[0] ?? null;
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Les commandes</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <h1>Les commandes</h1>

        <a href="deconnexion.php">Deconnexion</a>
        <a href="fournisseurs.php">Voir les fournisseurs</a>

        <?php if ($client) : ?>
            <p>
                Le client qui a passe le plus de commandes est :
                <?php echo htmlspecialchars($client["prenom"] . " " . $client["nom"]); ?>
            </p>

            <table>
                <tr>
                    <th>Date commande</th>
                    <th>Date d'expedition</th>
                    <th>Frais d'expedition</th>
                </tr>

                <?php foreach ($commandes as $commande) : ?>
                    <tr>
                        <td><?php echo htmlspecialchars($commande["dateCommande"]); ?></td>
                        <td><?php echo htmlspecialchars($commande["dateExpedition"] ?? ""); ?></td>
                        <td><?php echo htmlspecialchars($commande["fraisExpedition"]); ?></td>
                    </tr>
                <?php endforeach; ?>
            </table>
        <?php else : ?>
            <p>Aucune commande trouvee.</p>
        <?php endif; ?>
    </body>
</html>
