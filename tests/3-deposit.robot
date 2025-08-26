*** Settings ***
Documentation    Login flow validates user can authenticate to the site
Resource    ${CURDIR}/../resources/imports.resource

Suite Teardown    Close Browser

*** Test Cases ***
Validate Deposit
    [Documentation]    Validate Deposit
    AND Click Tab Deposit
    THEN Validate element in deposit page