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

Valider Produit Unique
    [Documentation]    Vérifie la structure d'un produit unique retourné par l'API.
    [Arguments]    ${product}
    Dictionary Should Contain Key    ${product}    id
    Dictionary Should Contain Key    ${product}    title
    Dictionary Should Contain Key    ${product}    price
    Dictionary Should Contain Key    ${product}    category
    ${id}=    Get From Dictionary    ${product}    id
    ${price}=    Get From Dictionary    ${product}    price
    ${title}=    Get From Dictionary    ${product}    title
    Should Be True    isinstance(${id}, int)
    Should Be True    ${id} > 0
    Should Be True    isinstance(${price}, float) or isinstance(${price}, int)
    Should Be True    ${price} > 0
    Should Not Be Empty    ${title}

Valider Limite Resultats
    [Documentation]    Vérifie que l'API respecte un nombre de résultats attendu.
    [Arguments]    ${json}    ${expected}
    ${length}=    Get Length    ${json}
    Should Be Equal As Integers    ${length}    ${expected}

Valider Categories Produits
    [Documentation]    Vérifie que les catégories des produits existent dans la liste de catégories.
    [Arguments]    ${products}    ${categories}
    ${first}=    Get From List    ${products}    0
    ${category}=    Get From Dictionary    ${first}    category
    List Should Contain Value    ${categories}    ${category}
