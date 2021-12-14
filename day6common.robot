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

SwitchVirtual
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   ${acc_info}
    element should be enabled   //*[text()="Real" and contains(@class,"active")]
    click element   ${switch_demo}
    element should be enabled   //*[text()="Demo" and contains(@class,"active")]
    click element   ${switch_vir}

BuyRiseContract
    wait until page does not contain element    ${chart_loader}   60
    click element   ${menu_btn}
    sleep  5
    click element   ${vol_10}
    wait until element is enabled   ${risepurchase_btn}
    click element   ${risepurchase_btn}

BuyLowerContract
    wait until page does not contain element    ${chart_loader}   60
    click element   ${menu_btn}
    click element   ${forex}
    sleep   5
    click element   ${AUDUSD}
    wait until element is enabled   ${contract_dropdown}
    click element   ${contract_dropdown}
    click element   ${highlow}
    press keys  ${contract_length}    BACKSPACE
    input text  ${contract_length}    ${2}
    click element   ${payout_tog}
    press keys  ${payout_amnt}  CTRL+A  DELETE
    input text  ${payout_amnt}  ${15.50}
    wait until element is enabled   ${lower_btn}
    click element   ${lower_btn}

RelativeBarrierError
    press keys  ${barrier_input}   CTRL+A  DELETE
    input text  ${barrier_input}   +1
    press keys  ${payout_amnt}   CTRL+A  DELETE
    input text  ${payout_amnt}   10
    sleep   5
    element should be disabled  ${lower_btn}
    page should contain element   ${error_msg}

MultiplierContract
    wait until page does not contain element    ${chart_loader}   60
    click element   ${menu_btn}
    click element   ${synthetic_ind}
    sleep   5
    click element   ${vol_50}
    wait until element is enabled   ${contract_dropdown}
    click element   ${contract_dropdown}
    click element   ${multiplier}
    wait until page does not contain element    ${chart_loader}   60
    sleep   5
    page should not contain element     ${payout_tog}
    click element     ${take_profit_checkbox}//parent::label
    checkbox should be selected  ${take_profit_checkbox}
    click element     ${stop_loss_checkbox}//parent::label
    checkbox should be selected  ${stop_loss_checkbox}
    checkbox should not be selected  ${cancellation_checkbox}
    click element     ${cancellation_checkbox}//parent::label
    sleep  2
    checkbox should be selected  ${cancellation_checkbox}
#    checkbox should not be selected  ${take_profit_checkbox}
#    checkbox should not be selected  //*[@id="dc_stop_loss-checkbox_input"]
#    click element     //*[@id="dc_take_profit-checkbox_input"]//parent::label
#    checkbox should be selected  //*[@id="dc_take_profit-checkbox_input"]
#    checkbox should not be selected  //*[@id="dt_cancellation-checkbox_input"]