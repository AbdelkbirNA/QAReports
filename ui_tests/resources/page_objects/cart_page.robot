*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Verifier Produit Dans Panier
    Page Should Contain Element    class:cart_item

Aller Au Checkout
    Click Button    checkout