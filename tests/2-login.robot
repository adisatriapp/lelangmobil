*** Settings ***
Documentation    Login flow validates user can authenticate to the site
Resource    ${CURDIR}/../resources/imports.resource


*** Test Cases ***
Login with valid credentials
    [Documentation]    Successful login using valid credentials
    GIVEN Access Lelang Mobilku site
    WHEN Input form login    ${data_email_qa}    ${data_pass_qa}
    AND Click captcha
    AND Click Syarat dan Ketentuan
    AND Click Button Login
