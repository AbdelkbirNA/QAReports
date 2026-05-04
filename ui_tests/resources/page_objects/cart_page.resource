*** Settings ***
Library    Browser

Documentation    Shared keywords for the SauceDemo cart page.


*** Keywords ***
Verifier Produit Dans Panier
    [Documentation]    Vérifie qu'un produit est visible dans le panier.
    Wait For Elements State    css=.cart_item    visible

Aller Au Checkout
    [Documentation]    Lance le tunnel de paiement.
    Click    css=#checkout
