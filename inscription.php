<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Inscription</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <h1>Inscription</h1>
        <form method="POST">
            <label>Utilisateur : <input type="text" maxlength="30" required></label>
            <label>Mot de passe : <input type="password" required maxlength="255"></label>
            <label>Fonction : <input type="text" required maxlength="25"></label>
            <input type="submit" value="S'inscrire"></input>
        </form>
        <a href="connexion.php">Connexion</a>
    </body>
</html>