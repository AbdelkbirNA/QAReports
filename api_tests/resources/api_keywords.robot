*** Settings ***
Library     Collections


*** Keywords ***
Valider Reponse Produits
    [Arguments]    ${response}

    # Status code
    Should Be Equal As Integers    ${response.status_code}    200

    # JSON
    ${json}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${json}

    ${length}=    Get Length    ${json}
    Should Be True    ${length} > 0

    # Premier produit
    ${first}=    Set Variable    ${json}[0]

    Dictionary Should Contain Key    ${first}    title
    Dictionary Should Contain Key    ${first}    price
    Dictionary Should Contain Key    ${first}    id

    # Vérifications qualité
    ${price}=    Get From Dictionary    ${first}    price
    Should Be True    isinstance(${price}, float) or isinstance(${price}, int)

    ${title}=    Get From Dictionary    ${first}    title
    Should Not Be Empty    ${title}
    
Valider Status Code
    [Arguments]    ${response}    ${expected}
    Should Be Equal As Integers    ${response.status_code}    ${expected}
