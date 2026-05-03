*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/page_objects/login_page.robot

*** Test Cases ***
Login Valide SauceDemo
    Ouvrir Page Login
    Se Connecter Avec Credentials    standard_user    secret_sauce
    Verifier Login Reussi
    Fermer Browser
Login Invalide - utilisateur incorrect
    Ouvrir Page Login
    Se Connecter Avec Credentials    wrong_user    wrong_pass
    Verifier Login Echoue
    Fermer Browser