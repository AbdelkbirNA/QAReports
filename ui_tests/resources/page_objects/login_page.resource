*** Settings ***
Library    Browser

Documentation    Shared keywords for the SauceDemo login page.


*** Variables ***
${USERNAME_INPUT}    css=#user-name
${PASSWORD_INPUT}    css=#password
${LOGIN_BUTTON}      css=#login-button
${ERROR_MESSAGE}     css=h3[data-test="error"]
${INVALID_LOGIN_ERROR}    Epic sadface: Username and password do not match any user in this service


*** Keywords ***
Ouvrir Page Login
    [Documentation]    Ouvre la page de connexion SauceDemo en Chromium headless.
    New Browser    chromium    headless=True
    New Context
    New Page    https://www.saucedemo.com/

Se Connecter Avec Credentials
    [Documentation]    Renseigne les identifiants et soumet le formulaire.
    [Arguments]    ${username}    ${password}
    Fill Text    ${USERNAME_INPUT}    ${username}
    Fill Text    ${PASSWORD_INPUT}    ${password}
    Click    ${LOGIN_BUTTON}

Verifier Login Reussi
    [Documentation]    Vérifie la redirection vers l'inventaire après connexion.
    ${current_url}=    Get Url
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory.html
    ${page_title}=    Get Text    css=span.title
    Should Be Equal As Strings    ${page_title}    Products

Fermer Browser
    [Documentation]    Ferme le navigateur.
    Close Browser

Verifier Login Echoue
    [Documentation]    Vérifie le message d'erreur affiché après un login invalide.
    Wait For Elements State    ${ERROR_MESSAGE}    visible
    ${error_message}=    Get Text    ${ERROR_MESSAGE}
    Should Be Equal As Strings    ${error_message}    ${INVALID_LOGIN_ERROR}
