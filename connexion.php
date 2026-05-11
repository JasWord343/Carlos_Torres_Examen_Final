<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Connexion</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>
        <h1>Connexion</h1>
        <form method="POST">
            <label>Utilisateur : <input type="text" required  maxlength="40"></label>
            <label>Mot de passe : <input type="password"  required  maxlength="255"></label>
            <input type="submit" value="Se connecter"></input>
        </form>
        <a href="inscription.php">Inscription</a>
    </body>
</html>