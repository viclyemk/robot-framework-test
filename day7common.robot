*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Keywords ***
Login
    [arguments]     ${email}    ${pw}
    Open Browser   https://app.deriv.com   chrome
    maximize browser window
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element  ${login_btn}   60
    Click element  ${login_btn}
    wait until page contains element  ${email_field}    15
    input text      ${email_field}      ${email}
    input password  ${pw_field}    ${pw}
    click element   ${submit_btn}

AccountSettings
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   ${account_settings}
    sleep  10
    click element   ${apitoken_page}

CheckCheckbox
    wait until page does not contain element    //*[@class="initial-loader account__initial-loader"]    60
    click element   ${read}//parent::label
    checkbox should be selected   read
    click element   ${trade}//parent::label
    checkbox should be selected     trade
    click element   ${payments}//parent::label
    checkbox should be selected     payments
    click element   ${admin}//parent::label
    checkbox should be selected     admin
    click element   ${trading_info}//parent::label
    checkbox should be selected     trading_information

CheckEmptyInput
    wait until page does not contain element    //*[@class="initial-loader account__initial-loader"]    60
    click element   ${read}//parent::label
    checkbox should be selected   read
    click element   token_name
    ${text_length}=    get element attribute   token_name  value
    Should Be Empty      ${text_length}
    element should be disabled      ${create_btn}

CheckCorrectInput
    click element   token_name
    input text  token_name      hello
    ${text_length}=    get element attribute   token_name  value
    ${value_length}=    Get Length    ${text_length}
    Should Be Equal As Integers    ${value_length}     5
    element should be enabled      ${create_btn}

SpecialCharactersInput
    click element   token_name
    press keys      token_name      CTRL+A  DELETE
    input text  token_name      !@&%
    page should contain     Only letters, numbers, and underscores are allowed.

LessThanMin
    click element   token_name
    press keys      token_name      CTRL+A  DELETE
    input text  token_name      a
    ${text_length}=    get element attribute   token_name  value
    ${value_length}=    Get Length    ${text_length}
    Should Be Equal As Integers    ${value_length}     1
    page should contain     Length of token name must be between 2 and 32 characters.
