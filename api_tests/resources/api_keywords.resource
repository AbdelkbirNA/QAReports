*** Settings ***
Library    Collections

Documentation    Shared API validation keywords for the Fake Store API tests.


*** Keywords ***
Valider Reponse Produits
    [Documentation]    Vérifie le statut et la structure de la réponse produits.
    [Arguments]    ${response}
    Valider Status Code    ${response}    200
    Valider Liste Produits    ${response.json()}
    Valider Premier Produit    ${response.json()}

Valider Liste Produits
    [Documentation]    Vérifie qu'une liste de produits n'est pas vide.
    [Arguments]    ${json}
    Should Not Be Empty    ${json}
    ${length}=    Get Length    ${json}
    Should Be True    ${length} > 0

Valider Premier Produit
    [Documentation]    Vérifie les champs du premier produit retourné.
    [Arguments]    ${json}
    ${first}=    Get From List    ${json}    0
    Dictionary Should Contain Key    ${first}    title
    Dictionary Should Contain Key    ${first}    price
    Dictionary Should Contain Key    ${first}    id
    ${price}=    Get From Dictionary    ${first}    price
    Should Be True    isinstance(${price}, float) or isinstance(${price}, int)
    ${title}=    Get From Dictionary    ${first}    title
    Should Not Be Empty    ${title}

Valider Categories
    [Documentation]    Vérifie qu'une liste de catégories n'est pas vide.
    [Arguments]    ${json}
    Should Not Be Empty    ${json}
    ${length}=    Get Length    ${json}
    Should Be True    ${length} > 0

Valider Status Code
    [Documentation]    Vérifie qu'un code HTTP est conforme.
    [Arguments]    ${response}    ${expected}
    Should Be Equal As Integers    ${response.status_code}    ${expected}
