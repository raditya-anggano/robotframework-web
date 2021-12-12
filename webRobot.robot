*** Settings ***
Library             SeleniumLibrary
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Test Template       I want to login with valid credentials      
Library             DataDriver        credentials.csv              sheet_name=Sheet1

*** Variables ***
${BROWSERS}          Chrome
${WebURL}            https://www.saucedemo.com/

*** Keywords ***
I want to login with valid credentials and Add item to cart
    [Arguments]                     ${username}            ${password}
    Input Text                      id=user-name           ${username}
    Input Text                      id=password            ${password}      
    Click Element                   id=login-button
    Capture Page Screenshot
    Page should contain             Products
    Click Element                   id=add-to-cart-sauce-labs-backpack
    Capture Page Screenshot
    Click Element                   //body/div[@id='root']/div[@id='page_wrapper']/div[@id='contents_wrapper']/div[@id='header_container']/div[1]/div[3]/a[1]
    # Click Element                   id=react-burger-menu-btn
    # Click Element                    //a[@id='logout_sidebar_link']
    Capture Page Screenshot
    Sleep    1s

*** Test Cases ***
login with valid credentials         ${username}     ${password}