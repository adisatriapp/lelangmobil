*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login/login.resource
Resource    ../resources/register/datadiri.resource
Resource    ../resources/register/databayar.resource
Resource    ../resources/profile/deposit.resource

Variables    ../test_data/data-auth.py
Variables    ../test_data/data-url.py
Variables    ../test_data/data-diri.py

Variables    ../locators/loc-login.py
Variables    ../locators/loc-beranda.py
Variables    ../locators/loc-daftar.py
Variables    ../locators/loc-deposit.py
Variables    ../locators/loc-datadiri.py