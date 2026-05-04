*** Settings ***
Library    RequestsLibrary
Resource    ../resources/api_keywords.resource

Documentation    Validates category responses from the Fake Store API.


*** Variables ***
${BASE_URL}    https://fakestoreapi.com


*** Test Cases ***
Get Categories - validation
    [Documentation]    Vérifie que l'endpoint des catégories retourne une liste non vide.
    ${response}=    GET    ${BASE_URL}/products/categories
    Valider Status Code    ${response}    200
    Valider Categories    ${response.json()}

