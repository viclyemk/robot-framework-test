*** Settings ***

Library  SeleniumLibrary
Resource    day7common.robot

*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${submit_btn}   //*[text()="Log in"]
${account_settings}     //*[@class="account-settings-toggle"]
${apitoken_page}    //*[@id="dc_api-token_link"]
${read}     //*[text()="Read"]
${trade}    //*[text()="Trade"]
${payments}     //*[text()="Payments"]
${admin}    //*[text()="Admin"]
${trading_info}     //*[text()="Trading information"]
${create_btn}       //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]


*** Test Cases ***

Open Deriv
    Login   ${my_email}    ${my_pw}
    AccountSettings
    CheckCheckbox
    reload page
    CheckEmptyInput
    CheckCorrectInput
    SpecialCharactersInput
    LessThanMin





