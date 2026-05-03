*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_NAME}    id:first-name
${LAST_NAME}     id:last-name
${POSTAL_CODE}   id:postal-code
${CONTINUE}      id:continue
${FINISH}        id:finish

*** Keywords ***
Remplir Informations Client
    [Arguments]    ${first}    ${last}    ${zip}
    Input Text    ${FIRST_NAME}    ${first}
    Input Text    ${LAST_NAME}     ${last}
    Input Text    ${POSTAL_CODE}   ${zip}

Confirmer Achat
    Click Button    ${FINISH}