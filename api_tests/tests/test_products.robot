*** Settings ***
Library     RequestsLibrary
Resource    ../resources/api_keywords.resource

Documentation    Validates the products endpoint of the Fake Store API.


*** Variables ***
${BASE_URL}     https://fakestoreapi.com


*** Test Cases ***
GET tous les produit - validations complete
    [Documentation]    Vérifie que l'endpoint produits retourne un catalogue valide.
    ${response}=    GET    ${BASE_URL}/products
    Valider Reponse Produits    ${response}

