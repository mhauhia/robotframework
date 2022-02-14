*** Settings ***
Documentation     The robot locates to Elisa.fi -website, searches for available options for home Internet connection in the given address and saves a screenshot.
Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    Screenshot   

*** Keywords ***
Open browser and locate to given URL
    Open Available Browser    https://www.elisa.fi   maximized: bool = True

Select the category for home internet connections
    Wait Until Page Contains Element     css:li.ea-category-menu__item:nth-child(3) > a:nth-child(1)
    Click Element    css:li.ea-category-menu__item:nth-child(3) > a:nth-child(1)
  
Input postal code and address
    
    Wait Until Page Contains Element    css:#klk-page > div > div > div > div.klk-hero-addressform-wrapper.tabbed > div.klk-page__address-selector > div > form
    Input Text    css:input[placeholder="Postinumero"]    00520
    Sleep    2 seconds     
    Input Text    css:input[placeholder="Syötä osoite"]    Ratavartijankatu  
    Press Keys    css:input[placeholder="Syötä osoite"]    SPACE
    Press Keys    css:input[placeholder="Syötä osoite"]    1
    Press Keys    css:#klk-page-new---step-1-0-address > input    ENTER

Capture and save screenshot
    Sleep    5 seconds
    Capture Page Screenshot    ${OUTPUT_DIR}${/}screenshot.png

Close the browser
    Close Browser

*** Tasks ***
Open the website, locate to the correct area and save a screenshot
    Open browser and locate to given URL
    Select the category for home internet connections
    Input postal code and address
    Capture and save screenshot
    [Teardown]    Close the browser

    



