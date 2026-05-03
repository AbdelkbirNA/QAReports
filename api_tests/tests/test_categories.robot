*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../resources/api_keywords.robot

*** Variables ***
${BASE_URL}    https://fakestoreapi.com

*** Test Cases ***
Get Categories - validation
    ${response}=    GET     ${BASE_URL}/products/categories
    ${response}=    GET    ${BASE_URL}/products/categories

    Valider Status Code    ${response}    200

    ${json}=    Set Variable    ${response.json()}

    Should Not Be Empty    ${json}

    ${length}=    Get Length    ${json}
    Should Be True    ${length} > 0