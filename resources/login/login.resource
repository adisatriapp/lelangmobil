*** Settings ***
Resource    ../imports.resource

*** Keywords ***
Access Lelang Mobilku site
    Open Browser    ${login_URL}    chrome
    Maximize Browser Window

Close modal on beranda
    Wait Until Element Is Visible    ${btn_close_modal}
    Click Element    ${btn_close_modal}

Go to login page
    Click Element    ${btn_masuk}

Input form login
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${field_email}    10s
    Input Text    ${field_email}    ${username}
    Input Text    ${field_password}    ${password}

Click captcha
    # Sleep    5s
    Wait Until Element Is Visible    ${frame_recaptcha}    15s
    Select Frame    ${frame_recaptcha}
    Wait Until Element Is Visible    ${checkbox_captcha}    15s
    Click Element   ${checkbox_captcha}
    Unselect Frame


Click Syarat dan Ketentuan
    Click Button    ${checkbox_syarat}

Click Button Login
    Wait Until Element Is Visible    ${btn_login}
    Sleep    3s
    Click Element    ${btn_login}

Validate Data Diri
    Wait Until Element Is Visible    ${input_namaDepan_datadiri}
    Element Should Be Visible    ${input_namaBelakang_datadiri}
    Element Should Be Visible    ${input_tanggalLahir_datadiri}
    Element Should Be Visible    ${input_noKTP_datadiri}
    Element Should Be Visible    ${input_masaKTP_datadiri}