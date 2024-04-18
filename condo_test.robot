*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    https://mycondo.hu/login    Chrome    options=add_experimental_option("detach", True)
#Suite Teardown    Close Browser

*** Variables ***
${EMAIL}    maruzseszti@freemail.hu
${RECOVERY_EMAIL}    maruzseszti@freemail.hu
${USER_PASSWORD}    LOCiHqIs
${ADMIN_EMAIL}    eszter.maruzs@gmail.com
${ADMIN_PASSWORD}    gi41MXEr
${WRONG_EMAIL}    eszter.maruzs
${LOGIN_URL}     https://mycondo.hu/login 
${BROWSER}    Chrome

*** Test Cases ***
#USER
Elfelejtett jelszó
    Maximize Browser Window
    Go To    https://mycondo.hu/login/forgotpassword   
    Wait Until Page Contains    E-mail cím    5s
    Input Text    name=email    ${RECOVERY_EMAIL}
    Wait Until Element Is Enabled    xpath://button[contains(text(), 'Küldés')]    5s
    Sleep    5s
    Click Element    xpath://button[contains(text(), 'Küldés')]
    Sleep    5s
   
Bejelentkezés a MyCondo oldalra
    Maximize Browser Window
    Wait Until Page Contains    Bejelentkezés    5s
    Input Text    id:email    maruzseszti@freemail.hu
    Wait Until Element Is Visible    name:password    5s
    Input Text    name:password    LOCiHqIs
    Sleep    3s
    Wait Until Element Is Enabled    xpath://button[contains(text(),'Bejelentkezés')]    5s
    Click Element    xpath://button[contains(text(),'Bejelentkezés')]
    Sleep    5s   

Válassza ki a Híreket
    [Documentation]    Kattintson a Hírek menüpontra, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#bulletinBoard']    3s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#bulletinBoard']
    Sleep    3s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#bulletinBoard']
    
Válassza ki az Adatokat
    [Documentation]    Kattintson az Adatok menüpontra, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#datas']    3s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#datas']
    Sleep    3s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#datas']
    
Válassza ki a Költségeket
    [Documentation]    Kattintson a Költségek menüpontra, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#costs']    2s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#costs']
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);    
    Sleep    3s  
    Execute JavaScript    document.querySelector('.menu-title-a[data-bs-toggle="collapse"][data-bs-target="#costs"]').click();

 Válassza ki a Diktálást
    [Documentation]    Kattintson a Diktálás menüpontra, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#dictate']    2s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#dictate']
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)    
    Sleep    3s  
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#dictate']


 Válassza ki a Fájlokat
    [Documentation]    Kattintson a Fájlok menüpontra, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#files']    2s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#files']
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)    
    Sleep    3s  
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#files']


Válassza ki a Profilomat
    [Documentation]    Kattintson a Profilom menüpontra, majd zárja be.
    Maximize Browser Window
    Wait Until Page Contains Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#myprofile']    2s
    Click Element    css:.menu-title-a[data-bs-toggle='collapse'][data-bs-target='#myprofile']
    Sleep    2s
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


#ADMIN
Bejelentkezés a MyCondo oldalra, elrontott mail címmel
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Bejelentkezés    3s
    Input Text    css:#email    ${WRONG_EMAIL}
    Wait Until Element Is Visible    css:input[name='password']    3s
    Input Text    css:input[name='password']    ${ADMIN_PASSWORD}
    Sleep    3s
    Wait Until Element Is Enabled    xpath://button[contains(text(),'Bejelentkezés')]    3s
    Click Element    xpath://button[contains(text(),'Bejelentkezés')]
    Sleep    3s
    Wait Until Element Is Visible    css:app-login-failed .modal-footer > button    3s
    Click Element    css:app-login-failed .modal-footer > button
    [Teardown]    Close Browser

Bejelentkezés a MyCondo oldalra
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Bejelentkezés    3s
    Input Text    css:#email    ${ADMIN_EMAIL}
    Wait Until Element Is Visible    css:input:nth-child(4)    3s
    Input Text    css:input:nth-child(4)    ${ADMIN_PASSWORD}
    Sleep    3s
    Wait Until Element Is Enabled    xpath://button[contains(text(),'Bejelentkezés')]    3s
    Click Element    xpath://button[contains(text(),'Bejelentkezés')]
    Sleep    3s  
    
Menüpontok Kezelése
    [Documentation]    Menüpontok lenyitása és bezárása 
    # Faliújság
    Wait Until Element Is Visible    css:body > app-root > app-adminhome > div > div > div > p:nth-child(4) > button
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(4) > button
    Sleep    1s  
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(4) > button
    Sleep    1s  

    # Lakók adatai
    Wait Until Element Is Visible    css:body > app-root > app-adminhome > div > div > div > p:nth-child(6) > button
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(6) > button
    Sleep    1s 
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(6) > button
    Sleep    1s  

    # Óraállások
    Wait Until Element Is Visible    css:body > app-root > app-adminhome > div > div > div > p:nth-child(8) > button
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(8) > button
    Sleep    1s  
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(8) > button
    Sleep    1s  

    # Beállítások
    Wait Until Element Is Visible    css:body > app-root > app-adminhome > div > div > div > p:nth-child(10) > button
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(10) > button
    Sleep    1s  
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2s  
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(10) > button
    Sleep    1s  

    # Fájlok
    Wait Until Element Is Visible    css:body > app-root > app-adminhome > div > div > div > p:nth-child(12) > button
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(12) > button
    Sleep    1s  
    Click Element    css:body > app-root > app-adminhome > div > div > div > p:nth-child(12) > button
    Sleep    1s  

Faliújság Teszt
    [Documentation]    Faliújság szerkesztése, módosítása és törlése a MyCondo weboldalon.
    # Faliújságra kattintás
    Wait Until Element Is Visible    css:#navbarNav > ul:nth-child(1) > li:nth-child(2) > a    2s
    Click Element    css:#navbarNav > ul:nth-child(1) > li:nth-child(2) > a
    Sleep    2s  

    # Szöveg beírása a szerkesztőbe
    Wait Until Element Is Visible    css:body > app-root > app-bboard > div > angular-editor > div > div > div    2s
    Input Text    css:body > app-root > app-bboard > div > angular-editor > div > div > div    Ez a mycondo weboldal faliújságjának tesztje.
    Sleep    2s  

    # Mentés gombra kattintás
    Wait Until Element Is Visible    css:body > app-root > app-bboard > div > div.editor-buttons > a    2s
    Click Element    css:body > app-root > app-bboard > div > div.editor-buttons > a
    Sleep    2s  

    # Bejegyzés módosítása
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    css:body > app-root > app-bboard > div > div.content > div.content-body > div:nth-child(1) > div.editor-buttons > a.buttons.blue.me-2    2s
    Click Element    css:body > app-root > app-bboard > div > div.content > div.content-body > div:nth-child(1) > div.editor-buttons > a.buttons.blue.me-2
    Sleep    5s
    ${existing_text}=    Get Text    css:body > app-root > app-bboard > div > angular-editor > div > div > div
    ${new_text}=    Catenate    ${existing_text}    MÓDOSÍTÁS
    Input Text    css:body > app-root > app-bboard > div > angular-editor > div > div > div    ${new_text}
    Sleep    5s

    # Módosítások mentése
    Wait Until Element Is Enabled    css:body > app-root > app-bboard > div > div.editor-buttons > a.buttons.green    2s
    Click Element    css:body > app-root > app-bboard > div > div.editor-buttons > a.buttons.green
    Sleep    5s  

    # Bejegyzés törlése
    Wait Until Element Is Enabled    css:body > app-root > app-bboard > div > div.content > div.content-body > div:nth-child(1) > div.editor-buttons > a.buttons.red    2s
    Execute JavaScript    window.scrollTo(0, document.querySelector('body > app-root > app-bboard > div > div.content > div.content-body > div:nth-child(1) > div.editor-buttons > a.buttons.red').getBoundingClientRect().top + window.pageYOffset - 100)
    Sleep    3s  
    Execute JavaScript    document.querySelector('body > app-root > app-bboard > div > div.content > div.content-body > div:nth-child(1) > div.editor-buttons > a.buttons.red').click()
    Sleep    3s  
    Wait Until Element Is Enabled    css:body > ngb-modal-window > div > div > div.modal-footer.editor-buttons > a.buttons.red    2s
    Execute JavaScript    document.querySelector('body > ngb-modal-window > div > div > div.modal-footer.editor-buttons > a.buttons.red').click()
    Sleep    3s  
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    3s 

# Lakók kezelése a MyCondo oldalon
#     [Documentation]    Lakók megnyitása, hozzáadása és törlése a MyCondo weboldalon.
    
#     # Lakók megnyitása
#     Wait Until Element Is Visible    css:#navbarNav > ul:nth-child(1) > li:nth-child(3) > a    2s
#     Click Element    css:#navbarNav > ul:nth-child(1) > li:nth-child(3) > a
#     Sleep    2s

#     # Lakó hozzáadása
#     Click Element    css:body > app-root > app-users > div > div.row.row-cols-auto.header > div:nth-child(1) > a
#     Sleep    2s
#     Input Text    css:#cdk-overlay-0 > mdb-modal-container > div > div > app-adduser > div > div.addsection > div > div > div > form > div:nth-child(1) > div.col-md-8 > input    Mészáros Lőrinc
#     Input Text    css:#cdk-overlay-0 > mdb-modal-container > div > div > app-adduser > div > div.addsection > div > div > div > form > div:nth-child(2) > div.col-md-8 > input    meszaros@okosabbvagyokmintzuckerberg.hu
#     Sleep    3s
#     Wait Until Element Is Visible    xpath=//*[@id="cdk-overlay-0"]/mdb-modal-container    10s
#     Execute JavaScript    var modal = document.querySelector('#cdk-overlay-0 mdb-modal-container div div app-adduser div div[2] div div'); modal.scrollTop = modal.scrollHeight;
#     Sleep    1s  # Várakozás a görgetési eseményre és az oldal frissítésére
#     Wait Until Element Is Visible    xpath=//*[@id="cdk-overlay-0"]/mdb-modal-container/div/div/app-adduser/div/div[2]/div/div/div/form/div[11]/div[2]/a    10s
#     Click Element    xpath=//*[@id="cdk-overlay-0"]/mdb-modal-container/div/div/app-adduser/div/div[2]/div/div/div/form/div[11]/div[2]/a
#     Sleep    1s  # Várakozás a mentés műveletre és az esetleges oldal frissítésre

    # # Átlépés a 2. oldalra
    # Click Element    xpath:/html/body/app-root/app-users/div/div[1]/div[2]/ngb-pagination/ul/li[3]/a
    # Sleep    5s

    # # Lakó adatainak lenyitása
    # Click Element    css:body > app-root > app-users > div > div.user-list > div:nth-child(5) > a > div > i
    # Sleep    2s

    # Lakó törlése
    # Click Element    css:body > app-root > app-users > div > div.user-list > div:nth-child(5) > div.col-lg-4.col-md-4.col-sm-12.user-actions > a.buttons.red
    # Sleep    2s
    # Click Element    css:#cdk-overlay-2 > mdb-modal-container > div > div > app-userdelconfirm > div.row > div.col-6.d-flex.justify-content-end > a
    # Sleep    2s
    # [Teardown]    Close Browser

Óraállások Bevitel
    [Documentation]    Óraállások adatbevitel a MyCondo weboldalon.
    
    # Óraállásokra kattintás
    Wait Until Element Is Visible    xpath=//*[@id="navbarNav"]/ul[1]/li[4]/a    5s
    Click Element    xpath=//*[@id="navbarNav"]/ul[1]/li[4]/a
    Sleep    2s  

    # Első óraállás beírása
    Wait Until Element Is Visible    xpath=/html/body/app-root/app-meters/div/div[2]/div[2]/div[2]/div[1]/input    5s
    Input Text    xpath=/html/body/app-root/app-meters/div/div[2]/div[2]/div[2]/div[1]/input    5
    Sleep    1s

    # Utolsó óraállás beírása
    Wait Until Element Is Visible    xpath=/html/body/app-root/app-meters/div/div[2]/div[2]/div[4]/div/input    5s
    Input Text    xpath=/html/body/app-root/app-meters/div/div[2]/div[2]/div[4]/div/input    5
    Sleep    1s

    # Mentés gombra kattintás
    Wait Until Element Is Visible    xpath=/html/body/app-root/app-meters/div/div[2]/div[2]/div[5]/div/a[1]    5s
    Click Element    xpath=/html/body/app-root/app-meters/div/div[2]/div[2]/div[5]/div/a[1]
    Sleep    2s 
    [Teardown]    Close Browser