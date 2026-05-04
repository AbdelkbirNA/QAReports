*** Settings ***
Library     RequestsLibrary
Resource    ../resources/api_keywords.resource

Documentation    Sanity checks for shared API validation keywords.


*** Variables ***
${BASE_URL}     https://fakestoreapi.com


*** Test Cases ***
Test Valider Reponse Produits
    [Documentation]    Vérifie le helper de validation des produits.
    ${response}=    GET    ${BASE_URL}/products
    Valider Reponse Produits    ${response}

