*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCT_TITLE}     class:inventory_item_name
${PRODUCT_PRICE}     class:inventory_item_price
${CART_ICON}         id:shopping_cart_container

*** Keywords ***
Verifier Produits Affiches
    Page Should Contain Element    ${PRODUCT_TITLE}

Verifier Prix Produits
    Page Should Contain Element    ${PRODUCT_PRICE}

Ajouter Premier Produit Au Panier
    Click Button    add-to-cart-sauce-labs-backpack

Aller Au Panier
    Click Element    ${CART_ICON}

Verifier Produit Dans Panier
    Page Should Contain Element    class:cart_item
