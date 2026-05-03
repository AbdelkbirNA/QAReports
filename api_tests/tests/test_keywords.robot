*** Settings ***
Library     RequestsLibrary
Resource    ../resources/api_keywords.robot


*** Variables ***
${BASE_URL}     https://fakestoreapi.com


*** Test Cases ***
Test Valider Reponse Produits
    ${response}=    GET    ${BASE_URL}/products
    Valider Reponse Produits    ${response}
