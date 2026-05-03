*** Settings ***
Library    SeleniumLibrary
***Variables ***
${USERNAME_INPUT}    id:user-name
${PASSWORD_INPUT}    id:password
${LOGIN_BUTTON}     id:login-button
${ERROR_MESSAGE}    css:h3[data-test="error"]
*** Keywords ***
Ouvrir Page Login
    Open Browser    https://www.saucedemo.com/    chrome
    Maximize Browser window

Se Connecter Avec Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}

Verifier Login Reussi
    Location Should Contain    inventory.html
    Page Should Contain        Products
Fermer Browser
    Close Browser
Verifier Login Echoue
    Element Should Be Visible    ${ERROR_MESSAGE}
    Element Should Contain       ${ERROR_MESSAGE}    Username and password do not match