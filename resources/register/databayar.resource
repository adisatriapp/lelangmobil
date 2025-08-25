*** Settings ***
Resource    ../imports.resource

*** Keywords ***
Fill "Nomor rekening" with value
    [Arguments]    ${val}
    ${rand}=    Generate Random String    6    [NUMBERS]
    Wait Until Element Is Visible    ${input_noRek}
    Input Text    ${input_noRek}    ${val}${rand}

    ${valCheck}=    Get Value    ${input_noRek}
    Should Be Equal As Strings    ${valCheck}    ${val}${rand}

Choose "Bank" as
    [Arguments]    ${val}
    Input Text    ${input_bank}    ${val}
    Press Keys    ${input_bank}    ENTER
   
Fill "Nama pemilik rekening" with value
    [Arguments]    ${val}
    Input Text    ${input_namaPemilikRekening}    ${val}

   
Choose Sumber dana as
    [Arguments]    ${val}
    Input Text    ${input_sumberDana}    ${val}
    Press Keys    ${input_sumberDana}    ENTER


Choose "metode pembayaran" as
    [Arguments]    ${val}
    Input Text    ${input_metodeBayar}    ${val}
    Press Keys    ${input_metodeBayar}    ENTER

Click “Daftar”
    Click Element    ${btn_daftarForm}

The Data inputs are saved and email validation is sended
    Wait Until Element Is Visible    ${toast_berhasilDaftar}
    Element Should Be Visible    ${toast_berhasilDaftar}

User will redirect to login page
    Element Should Be Visible    ${field_email}
    Element Should Be Visible    ${field_password}