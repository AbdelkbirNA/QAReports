*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://fakestoreapi.com


*** Test Cases ***
GET tous les produit - validations complete
    ${response}=    GET    ${BASE_URL}/products
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${json}
    ${length}=    Get Length    ${json}
    Should Be True    ${length}>0
    ${first}=    Set Variable    ${json}[0]
    Dictionary Should Contain Key    ${first}    title
    Dictionary Should Contain Key    ${first}    price
    Dictionary Should Contain Key    ${first}    id

    ${price}=    Get From Dictionary    ${first}    price
    Should Be True    isinstance(${price},float) or isinstance(${price},int)

    ${title}=    Get From Dictionary    ${first}    title
    Should Not Be Empty    ${title}
