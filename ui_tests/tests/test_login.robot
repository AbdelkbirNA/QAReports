*** Settings ***
Resource    ../resources/page_objects/login_page.resource
Resource    ../resources/page_objects/inventory_page.resource

Documentation    Login scenarios for SauceDemo.


*** Test Cases ***
Login Valide SauceDemo
    [Documentation]    Vérifie un login valide sur SauceDemo.
    Ouvrir Page Login
    Se Connecter Avec Credentials    standard_user    secret_sauce
    Verifier Login Reussi
    Fermer Browser

Login Invalide - utilisateur incorrect
    [Documentation]    Vérifie qu'un login invalide affiche un message d'erreur.
    Ouvrir Page Login
    Se Connecter Avec Credentials    wrong_user    wrong_pass
    Verifier Login Echoue
    Fermer Browser

Login Invalide - utilisateur bloque
    [Documentation]    Vérifie le message d'erreur pour un utilisateur verrouillé.
    Ouvrir Page Login
    Se Connecter Avec Credentials    locked_out_user    secret_sauce
    Verifier Message Erreur Egal    Epic sadface: Sorry, this user has been locked out.
    Fermer Browser

Login Valide - verifier inventaire visible
    [Documentation]    Vérifie la visibilité des produits et des prix après login.
    Ouvrir Page Login
    Se Connecter Avec Credentials    standard_user    secret_sauce
    Verifier Login Reussi
    Verifier Produits Affiches
    Verifier Prix Produits
    Fermer Browser
