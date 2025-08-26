*** Settings ***
Resource    ../imports.resource


*** Keywords ***
Click Tab Deposit
    Wait Until Element Is Visible    ${tab_deposit}
    Click Element    ${tab_deposit}

Validate element in deposit page
    Element Should Be Visible    ${btn_uploadBuktiBayar}
    Element Should Be Visible    ${btn_filterLelang}
    Element Should Be Visible    ${input_lelangDeposig}
    Element Should Be Visible    ${input_lokasiDeposit}
    Element Should Be Visible    ${input_kendaraanDeposit}
    Element Should Be Visible    ${input_pencarianDeposit}