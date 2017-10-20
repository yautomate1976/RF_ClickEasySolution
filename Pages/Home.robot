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
    I want a package   Flight + Hotel + Car
    I am departing from  DFW
    I am returning to   LAX
    I want to leave at
    I am returning on
    I want to return from
    The number of adults are
    The number of children are
    I prefer non-stop
    I want airline
    I want class
    Search for my flight


*** Keywords ***

Launch Easy Click Travel
    [Documentation]  Present some information about this test case
    Open Browser    http://www.easyclicktravel.com/   ${Browser}
    maximize browser window

I want a
    [Arguments]  ${option}
    run keyword if  '${option}' == 'Flight'     run keywords
        wait until element is visible  ${rbn_flights}
        click element  ${rbn_flights}

    run keyword if  "${option}" == "Hotels"     run keywords
        wait until element is visible  ${rbn_hotels}
        click element  ${rbn_hotels}

I want a package
    [Arguments]  ${package}
    run keyword if  "${package}" == "Flight + Hotel + Car"     run keywords
        wait until element is visible  ${rbn_flight_hotel_car}
        click element  ${rbn_flight_hotel_car}

I am departing from
    [Arguments]  ${from}
        wait until element is visible  ${tbx_from}
        click element  ${tbx_from}
        input text  ${tbx_from} ${from}
        press key  ${tbx_from}  \\09

I am returning to
    [Arguments]  ${to}
        wait until element is visible  ${tbx_to}
        click element  ${tbx_to}
        input text  ${tbx_to} ${to}
        press key  ${tbx_to}  \\09


I want to leave at
    [Arguments]  ${time_range}
        wait until element is visible  ${lst_departure}
        @{my_list}=     select all from list  ${lst_departure}
        log to console  @{my_list}
        select from list by value  ${lst_departure}  ${time_range}
        press key  ${lst_departure}  \\09


