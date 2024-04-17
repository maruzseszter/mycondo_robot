*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    https://mycondo.hu/login    Chrome    options=add_experimental_option("detach", True)
#Suite Teardown    Close Browser

*** Variables ***
${EMAIL}    maruzseszti@freemail.hu
${RECOVERY_EMAIL}    maruzseszti@freemail.hu
${PASSWORD}    LOCiHqIs

*** Test Cases ***
Elfelejtett jelszó
    Maximize Browser Window
    Wait Until Page Contains    Bejelentkezés    5s
    Sleep    3s    
    Click Link    Elfelejtette a jelszavát?
    Go To    https://mycondo.hu/login/forgotpassword    
    Wait Until Page Contains    E-mail cím    10s
    Input Text    name=email    ${RECOVERY_EMAIL}
    Wait Until Element Is Enabled    xpath://button[contains(text(), 'Küldés')]    10s
    Click Element    xpath://button[contains(text(), 'Küldés')]
    Sleep    10s
    
Bejelentkezés a MyCondo oldalra
    Maximize Browser Window
    Wait Until Page Contains    Bejelentkezés    10s
    Input Text    id:email    ${EMAIL}
    Wait Until Element Is Visible    name:password    10s
    Input Text    name:password    ${PASSWORD}
    Sleep    3s
    Wait Until Element Is Enabled    xpath://button[contains(text(),'Bejelentkezés')]    10s
    Click Element    xpath://button[contains(text(),'Bejelentkezés')]
    Sleep    10s   
    # [Teardown]    Close Browser