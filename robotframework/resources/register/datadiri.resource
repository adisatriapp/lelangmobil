*** Settings ***
Resource    ../imports.resource
Library    String
Library    OperatingSystem

*** Variables ***
${CREDS_PY}    ${OUTPUT DIR}/test_data/data-auth.py

*** Keywords ***
The user is on the Registration page - Data Diri tab
    Click Element    ${btn_daftar}
    Wait Until Element Is Visible    ${title_pendaftaran}

Generate email and password random
    # Cara 1: Random string + domain dummy (aman untuk e2e)
    ${rand}=    Generate Random String   10    [LETTERS][NUMBERS]
    ${EMAIL}=    Set Variable              test-${rand}@example.com
    ${PASSWORD}=    Generate Random String    16   [LETTERS][NUMBERS]
     # Tulis file Python yang berisi variabel
    ${newline}=     Set Variable    \n
    ${content}=     Catenate    SEPARATOR=
    ...             data_email_qa = "${EMAIL}"${newline}
    ...             data_pass_qa = "${PASSWORD}"${newline}
    Create File     ${CREDS_PY}    ${content}    encoding=UTF-8

The user fills all "Nama Depan" with value
    [Arguments]    ${val}
    Input Text    ${input_namaDepan}    ${val}

    ${valDepan}=    Get Value    ${input_namaDepan}
    Should Be Equal As Strings    ${valDepan}    ${val}

The user fills all "Nama Belakang" with value
    [Arguments]    ${val}
    Input Text    ${input_namaBelakang}    ${val} 

    ${valBelakang}=    Get Value    ${input_namaBelakang}
    Should Be Equal As Strings    ${valBelakang}    ${val}

Fill "Tempat Lahir" with value
    [Arguments]    ${val}
    Input Text    ${input_tempatLahir}    ${val}
    ${valCheck}=    Get Value    ${input_tempatLahir}
    Should Be Equal As Strings    ${valCheck}    ${val}

Fill "Tanggal Lahir" with value
    [Arguments]    ${val}
    # Scroll to the element first to ensure it's visible
    Scroll Element Into View    ${input_tglLahir}
    Wait Until Element Is Visible    ${input_tglLahir}
    Click Element    ${input_tglLahir}

    # Choose month
    Click Element    ${choose_month_overlay}
    Click Element    ${btn_Jan}

    # Choose year
    Click Element    ${choose_year_overlay}
    Click Element    ${btn_2006}

    # Choose day
    Click Element    ${btn_01}
    
    Click Element    ${btn_selectDate}

Fill Nomor KTP with value
    [Arguments]    ${val}
    ${rand}=    Generate Random String    6    [NUMBERS]
    # Scroll to the element first to ensure it's visible
    Scroll Element Into View    ${input_KTP}
    Wait Until Element Is Visible    ${input_KTP}
    Input Text    ${input_KTP}    ${val}${rand}

    ${valCheck}=    Get Value    ${input_KTP}
    Should Be Equal As Strings    ${valCheck}    ${val}${rand}

Upload KTP
    # Click Element    ${btn_uploadKTP}
    Sleep    3s
    # Choose File    ${upload_KTP}    ${EXECDIR}/resources/register/ktp.jpg
    Choose File    ${upload_KTP}    ${EXECDIR}/robotframework/test_data/files_data/ktp.jpg
    
Fill "Masa Berlaku KTP" with value
    # Scroll to the element first to ensure it's visible
    Scroll Element Into View    ${checkbox_masaKTP}
    Wait Until Element Is Visible    ${checkbox_masaKTP}
    Click Element    ${checkbox_masaKTP}
  

Choose "Kewarganegaraan" as WNI
    Scroll Element Into View    ${btn_selanjutnya}
    Click Element    ${btn_WNI}

Fill "Provinsi" with value
    [Arguments]    ${val}
    Input Text    ${input_provinsi}    ${val}
    Press Keys    ${input_provinsi}    ENTER
    # Click Element    ${input_provinsi}
    # Click Element    //li[@id='multiselect-option-31']
    

Fill "Kota" with value
    [Arguments]    ${val}
    Input Text    ${input_kota}    ${val}
    Press Keys    ${input_kota}    ENTER
Fill "Alamat Domisili" with value
    [Arguments]    ${val}
    Input Text    ${textarea_alamatDomisili}    ${val}

    ${valCheck}=    Get Value    ${textarea_alamatDomisili}
    Should Be Equal As Strings    ${valCheck}    ${val}

Fill "Nomor Telepon" with value 
    [Arguments]    ${val}
     ${rand}=    Generate Random String    6    [NUMBERS]
    Input Text    ${input_noTelp}    ${val}${rand}

    ${valCheck}=    Get Value    ${input_noTelp}
    Should Be Equal As Strings    ${valCheck}    ${val}${rand}

Choose "Pekerjaan" as
    [Arguments]    ${val}
    Scroll Element Into View    ${input_pekerjaan}

    Input Text    ${input_pekerjaan}    ${val}
    Press Keys    ${input_pekerjaan}    ENTER

Fill "Nama Perusahaan" with value
    [Arguments]    ${val}
    Input Text    ${input_namaPerusahaan}    ${val}

    ${valCheck}=    Get Value    ${input_namaPerusahaan}
    Should Be Equal As Strings    ${valCheck}    ${val}

Fill "Alamat perusahaan" with value
    [Arguments]    ${val}
    Input Text    ${textarea_alamatPerusahaan}    ${val}

    ${valCheck}=    Get Value    ${textarea_alamatPerusahaan}
    Should Be Equal As Strings    ${valCheck}    ${val}

Fill "Nomor Telepon Perusahaan" with value
    [Arguments]    ${val}
     ${rand}=    Generate Random String    6    [NUMBERS]
    Input Text    ${input_noTelpPerusahaan}    ${val}${rand}

    ${valCheck}=    Get Value    ${input_noTelpPerusahaan}
    Should Be Equal As Strings    ${valCheck}    ${val}${rand}

Choose NPWP as "Tidak Ada"
    Click Button    ${btn_tidakPunyaNPWP}

Choose "Jenis Kendaraan" as
    [Arguments]    ${val}
    Scroll Element Into View    ${btn_selanjutnya}
    Input Text    ${input_kendaraan}    ${val}
    Press Keys    ${input_kendaraan}    ENTER
    
Choose "Kendaraan yang dicari" as
    [Arguments]    ${val}
    Input Text    ${input_kendaraanDiCari}    ${val}
    Press Keys    ${input_kendaraanDiCari}    ENTER

Choose "Tujuan Pembelian" as
    [Arguments]    ${val}
    Input Text    ${input_tujuanPembelian}    ${val}
    Press Keys    ${input_tujuanPembelian}    ENTER

Fill email with value
    [Arguments]    ${val}
    # Cara 1: Random string + domain dummy (aman untuk e2e)
    ${rand}=    Generate Random String   10    [LETTERS][NUMBERS]
    ${EMAIL}=    Set Variable              testlogique-${rand}@example.com
    
    # Check if file exists and update data_email_qa, or create new if it doesn't exist
    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${CREDS_PY}
    ${newline}=     Set Variable    \n
    
    IF    ${file_exists}
        # Read existing file content
        ${existing_content}=    Get File    ${CREDS_PY}    encoding=UTF-8
        ${lines}=    Split To Lines    ${existing_content}
        
        # Find and replace data_email_qa line, or add if not found
        ${email_line_found}=    Set Variable    False
        ${updated_content}=    Set Variable    ${EMPTY}
        
        FOR    ${line}    IN    @{lines}
            ${is_email_line}=    Run Keyword And Return Status    Should Contain    ${line}    data_email_qa
            IF    ${is_email_line}
                ${updated_content}=    Catenate    SEPARATOR=${newline}    ${updated_content}    data_email_qa = "${EMAIL}"
                ${email_line_found}=    Set Variable    True
            ELSE
                ${updated_content}=    Catenate    SEPARATOR=${newline}    ${updated_content}    ${line}
            END
        END
        
        # If email line wasn't found, add it
        IF    not ${email_line_found}
            ${updated_content}=    Catenate    SEPARATOR=${newline}    ${updated_content}    data_email_qa = "${EMAIL}"
        END
        
        # Write updated content back to file
        Create File    ${CREDS_PY}    ${updated_content}${newline}    encoding=UTF-8
    ELSE
        # Create new file if it doesn't exist
        ${content}=     Catenate    SEPARATOR=
        ...             data_email_qa = "${EMAIL}"${newline}
        Create File     ${CREDS_PY}    ${content}    encoding=UTF-8
    END

    Input Text    ${input_emailRegis}    testlogique-${rand}@example.com

    ${valCheck}=    Get Value    ${input_emailRegis}
    Should Be Equal As Strings    ${valCheck}    testlogique-${rand}@example.com

Fill "Kata sandi" and "Konfirmasi" with value
    [Arguments]    ${val}
    # Cara 1: Random string + domain dummy (aman untuk e2e)
    ${PASSWORD}=    Generate Random String    16   [LETTERS][NUMBERS]
    
    # Check if file exists and update data_pass_qa, or create new if it doesn't exist
    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${CREDS_PY}
    ${newline}=     Set Variable    \n
    
    IF    ${file_exists}
        # Read existing file content
        ${existing_content}=    Get File    ${CREDS_PY}    encoding=UTF-8
        ${lines}=    Split To Lines    ${existing_content}
        
        # Find and replace data_pass_qa line, or add if not found
        ${password_line_found}=    Set Variable    False
        ${updated_content}=    Set Variable    ${EMPTY}
        
        FOR    ${line}    IN    @{lines}
            ${is_password_line}=    Run Keyword And Return Status    Should Contain    ${line}    data_pass_qa
            IF    ${is_password_line}
                ${updated_content}=    Catenate    SEPARATOR=${newline}    ${updated_content}    data_pass_qa = "${PASSWORD}"
                ${password_line_found}=    Set Variable    True
            ELSE
                ${updated_content}=    Catenate    SEPARATOR=${newline}    ${updated_content}    ${line}
            END
        END
        
        # If password line wasn't found, add it
        IF    not ${password_line_found}
            ${updated_content}=    Catenate    SEPARATOR=${newline}    ${updated_content}    data_pass_qa = "${PASSWORD}"
        END
        
        # Write updated content back to file
        Create File    ${CREDS_PY}    ${updated_content}${newline}    encoding=UTF-8
    ELSE
        # Create new file if it doesn't exist
        ${content}=     Catenate    SEPARATOR=
        ...             data_pass_qa = "${PASSWORD}"${newline}
        Create File     ${CREDS_PY}    ${content}    encoding=UTF-8
    END

    Input Text    ${input_passwordRegis}    ${PASSWORD}
    Input Text    ${input_passwordRegisConfirm}    ${PASSWORD}

    ${valCheck1}=    Get Value    ${input_passwordRegis}
    Should Be Equal As Strings    ${valCheck1}    ${PASSWORD}
    ${valCheck2}=    Get Value    ${input_passwordRegisConfirm}
    Should Be Equal As Strings    ${valCheck2}    ${PASSWORD}

The user clicks "Selanjutnya"
    Click Button    ${btn_selanjutnya}
