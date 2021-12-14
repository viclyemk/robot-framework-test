*** Settings ***

Library  SeleniumLibrary
Resource    day6common.robot

*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${submit_btn}   //*[text()="Log in"]
${acc_info}     //*[@id="dt_core_account-info_acc-info"]
${switch_demo}  //*[@id="dt_core_account-switcher_demo-tab"]
${switch_vir}   //*[contains(@id,"dt_VRTC")]
${chart_loader}     //*[@class="chart-container__loader"]
${menu_btn}     //*[@class="cq-menu-btn"]
${vol_10}       //*[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
${risepurchase_btn}     //*[@id="dt_purchase_call_button"]
${forex}    //*[text()="Forex" and contains(@class,"sc-mcd__filter__item ")]
${AUDUSD}   //*[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
${contract_dropdown}    //*[@id="dt_contract_dropdown"]
${highlow}  //*[@id="dt_contract_high_low_item"]
${contract_length}  //*[@class="dc-input__field"]
${payout_tog}   //*[@id="dc_payout_toggle_item"]
${payout_amnt}  //*[@id="dt_amount_input"]
${lower_btn}    //*[@id="dt_purchase_put_button"]
${barrier_input}    //*[@id="dt_barrier_1_input"]
${error_msg}    //*[text()="Contracts more than 24 hours in duration would need an absolute barrier."]
${synthetic_ind}    //*[text()="Synthetic Indices" and contains(@class,"sc-mcd__filter__item ")]
${vol_50}   //*[@class="sc-mcd__item sc-mcd__item--R_50 "]
${multiplier}   //*[@id="dt_contract_multiplier_item"]
${take_profit_checkbox}  //*[@id="dc_take_profit-checkbox_input"]
${stop_loss_checkbox}   //*[@id="dc_stop_loss-checkbox_input"]
${cancellation_checkbox}    //*[@id="dt_cancellation-checkbox_input"]
*** Keyword ***

*** Test Cases ***

Open Deriv
    Login   ${my_email}    ${my_pw}
    SwitchVirtual
    reload page
#    BuyRiseContract
#    sleep   10
    BuyLowerContract
    RelativeBarrierError
    MultiplierContract







#    Close Browser
#   //*[text()="Real" and contains(@class,"active")]