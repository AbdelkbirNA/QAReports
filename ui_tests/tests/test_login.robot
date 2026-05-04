*** Settings ***
Resource    ../resources/page_objects/login_page.resource

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
