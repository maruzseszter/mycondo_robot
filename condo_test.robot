*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    https://mycondo.hu/login    Chrome    options=add_experimental_option("detach", True)
#Suite Teardown    Close Browser

*** Variables ***
${EMAIL}    maruzseszti@freemail.hu
${RECOVERY_EMAIL}    maruzseszti@freemail.hu
${PASSWORD}    LOCiHqIs

*** Test Cases ***
#Elfelejtett jelszó
    # Maximize Browser Window
    # Wait Until Page Contains    Bejelentkezés    5s
    # Sleep    3s    
    # Click Link    Elfelejtette a jelszavát?
    # Go To    https://mycondo.hu/login/forgotpassword    
    # Wait Until Page Contains    E-mail cím    10s
    # Input Text    name=email    ${RECOVERY_EMAIL}
    # Wait Until Element Is Enabled    xpath://button[contains(text(), 'Küldés')]    10s
    # Click Element    xpath://button[contains(text(), 'Küldés')]
    # Sleep    5s
    
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

Válassza ki a Híreket
    [Documentation]    Kattintson a Hírek menüpontra, várjon 5 másodpercet, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#bulletinBoard']    5s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#bulletinBoard']
    Sleep    5s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#bulletinBoard']  

Válassza ki az Adatokat
    [Documentation]    Kattintson az Adatok menüpontra, várjon 5 másodpercet, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#datas']    5s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#datas']
    Sleep    3s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#datas']
    
Válassza ki a Költségeket
    [Documentation]    Kattintson a Költségek menüpontra, várjon 5 másodpercet, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#costs']    5s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#costs']
    Sleep    5s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);    
    Sleep    3s  
    Execute JavaScript    document.querySelector('.menu-title-a[data-bs-toggle="collapse"][data-bs-target="#costs"]').click();

Válassza ki a Diktálást
    [Documentation]    Kattintson a Diktálás menüpontra, várjon 5 másodpercet, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#dictate']    5s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#dictate']
    Sleep    5s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)    
    Sleep    3s  
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#dictate']

Válassza ki a Fájlokat
    [Documentation]    Kattintson a Fájlok menüpontra, várjon 5 másodpercet, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#files']    5s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#files']
    Sleep    5s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)    
    Sleep    3s  
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#files']

Válassza ki a Profilomat
    [Documentation]    Kattintson a Profilom menüpontra, várjon 5 másodpercet, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#myprofile']    5s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#myprofile']
    Sleep    5s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)    
    Sleep    3s  
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#myprofile']

Válassza ki a Kilépést
    [Documentation]    Kattintson a Kilépés gombra a teszt lezárásához, majd erősítse meg a kilépést.
    Maximize Browser Window
    Wait Until Page Contains    Kilépés    5s
    Execute JavaScript    document.querySelector('body > app-root > app-home > div > div.row.header > div.col.header-logout > a').click();
    Sleep    3s 
    Execute JavaScript    document.querySelector('#cdk-overlay-0 > mdb-modal-container > div > div > app-logoutcomfirm > div.modal-footer > button.btn.btn-primary').click();
    Sleep    5s
    [Teardown]    Close Browser
