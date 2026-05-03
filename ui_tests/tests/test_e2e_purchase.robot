*** Settings ***
Resource    ../resources/page_objects/login_page.robot
Resource    ../resources/page_objects/inventory_page.robot
Resource    ../resources/page_objects/cart_page.robot
Resource    ../resources/page_objects/checkout_page.robot
Library    SeleniumLibrary

*** Test Cases ***
Achat Complet Produit
    Ouvrir Page Login
    Se Connecter Avec Credentials    standard_user    secret_sauce

    Ajouter Premier Produit Au Panier
    Aller Au Panier

    Aller Au Checkout
    Remplir Informations Client    John    Doe    12345
    Confirmer Achat

    Page Should Contain    Thank you for your order