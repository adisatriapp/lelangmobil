*** Settings ***
Resource    imports.resource

*** Variables ***
@{chrome_arguments}    --disable-infobars    --headless
...    --disable-gpu   --no-sandbox   --window-size=1920,1080

*** Keywords ***
Start Headless Browser
    [Arguments]    ${url}
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${url}

Set Chrome Options
    [Documentation]    Set Chrome options for headless mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    FOR    ${option}    IN    @{chrome_arguments}
        Call Method    ${options}    add_argument    ${option}
    END
    [Return]    ${options}