*** Settings ***
### Robotframework Documentation  : http://robotframework.org/robotframework/
Library     ExtendedSelenium2Library

*** Variables ***
${Browser}  chrome
${rbn_flights}  xpath=//*[@id="TGS_sb_fImg"]
${rbn_hotels}   xpath=//*[@id="td_TGS_sb_hImg"]
${rbn_cruises}  xpath=//*[@id="td_TGS_sb_cImg"]
${rbn_cars}     xpath=//*[@id="TGS_sb_rImg"]
${rbn_activities}   xpath=//*[@id="TGS_sb_aImg"]
${rbn_flight_hotel_car}     xpath=//*[@id="TGS_sb_pFHRImg"]
${rbn_flight_hotel}   xpath=//*[@id="TGS_sb_pFHImg"]
${rbn_flgiht_car}   xpath=//*[@id="TGS_sb_pFRImg"]
${rbn_hotel_car}    xpath=//*[@id="TGS_sb_pHRImg"]
${tbx_from}     xpath=//*[@id="TGS_f_txtFrom"]
${tbx_to}   xpath=//*[@id="TGS_f_txtTo"]
${tbx_departure}    xpath=//*[@id="TGS_f_departDate"]
${lst_departure}   xpath=//*[@id="TGS_f_departTime"]
${tbx_return}   xpath=//*[@id="TGS_f_returnDate"]
${lst_return}  xpath=//*[@id="TGS_f_returnTime"]
${lnk_flexible_options}     xpath=//*[@id="TGS_f_flexLink"]
${lst_adults}    xpath=//*[@id="TGS_f_cmbAdults"]
${lst_children}     xpath=//*[@id="TGS_f_cmbChildren"]
${lst_seniors}  xpath=//*[@id="TGS_f_cmbSeniors"]
${lst_infants}  xpath=//*[@id="TGS_f_cmbInfants"]
${cbx_non-stop}  xpath=//*[@id="TGS_f_cbNonStop"]
${lst_airline}  xpath=//*[@id="TGS_f_cmbAirlines"]
${lst_class}    xpath=//*[@id="TGS_f_cmbFlightClass"]
${btn_search_flight}    xpath=//*[@id="TGS_f_butSearch"]
${btn_search_flight_hotel}  xpath=//*[@id="TGS_f_butSearch"]

*** Test Cases ***
Book a One WAy Flight
    Launch Easy Click Travel
    I want a    Flight

*** Keywords ***

Launch Easy Click Travel
    [Documentation]  Present some information about this test case
    Open Browser    http://www.easyclicktravel.com/   ${Browser}
    maximize browser window

I want a
    [Arguments]  ${option}

    run keyword if  "${option}" == "Flight"
            run keywords
            wait until element is visible  ${rbn_flights}
            click element  ${rbn_flights}

    run keyword if  "${option}" == "Hotels"
            run keywords
            wait until element is visible  ${rbn_hotels}
            click element  ${rbn_hotels}





