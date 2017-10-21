*** Settings ***
### Robotframework Documentation  : http://robotframework.org/robotframework/
Library     ExtendedSelenium2Library

*** Variables ***
${Browser}  chrome
${rbn_flights}  xpath=//*[@id="TGS_sb_fImg" and @name="TGS_tabButtons"]
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
${tbx_departure_date}    xpath=//*[@id="TGS_f_departDate"]
${lst_departure_time}   xpath=//*[@id="TGS_f_departTime"]
${tbx_return_date}   xpath=//*[@id="TGS_f_returnDate"]
${lst_return_time}  xpath=//*[@id="TGS_f_returnTime"]
${lnk_flexible_options}     xpath=//*[@id="TGS_f_flexLink"]
${lst_adults}    xpath=//*[@id="TGS_f_cmbAdults"]
${lst_children}     xpath=//*[@id="TGS_f_cmbChildren"]
${lst_seniors}  xpath=//*[@id="TGS_f_cmbSeniors"]
${lst_infants}  xpath=//*[@id="TGS_f_cmbInfants"]
${cbx_non_stop}  xpath=//*[@id="TGS_f_cbNonStop"]
${lst_airline}  xpath=//*[@id="TGS_f_cmbAirlines"]
${lst_class}    xpath=//*[@id="TGS_f_cmbFlightClass"]
${btn_search_flight}    xpath=//*[@id="TGS_f_butSearch"]
${btn_search_flight_hotel}  xpath=//*[@id="TGS_f_butSearch"]

*** Test Cases ***
Book a Round Trip Flight
    Launch Easy Click Travel
    I want a    Flight
    I am departing from  DFW
    I am returning to   LAX
    I am departing on date   12/20/2017
    I am returning on date   01/20/2018
    The number of adults are    2
    The number of children are  2
    I prefer non-stop
    I want airline  American
    I want class    Business Class
    Search for my flight


*** Keywords ***

Launch Easy Click Travel
    [Documentation]  Present some information about this test case
    Open Browser    http://www.easyclicktravel.com/   ${Browser}
    maximize browser window

I want a
    [Arguments]  ${option}
    run keyword if  '${option}' == 'Flight'    run keywords
         wait until element is visible  ${rbn_flights}
        click element  ${rbn_flights}

I want a package
    [Arguments]  ${package}
    run keyword if  "${package}" == "Flight + Hotel + Car"     run keywords
        wait until element is visible  ${rbn_flight_hotel_car}
        click element  ${rbn_flight_hotel_car}

I am departing from
    [Arguments]  ${from}
        wait until element is visible  ${tbx_from}
        click element  ${tbx_from}
        input text  ${tbx_from}     ${from}
        press key  ${tbx_from}  \\09

I am returning to
    [Arguments]  ${to}
        wait until element is visible  ${tbx_to}
        click element  ${tbx_to}
        input text  ${tbx_to}   ${to}
        press key  ${tbx_to}  \\09

I am departing on date
    [Arguments]  ${depature_date}
        wait until element is visible  ${tbx_departure_date}
        input text  ${tbx_departure_date}   ${depature_date}
        press key  ${tbx_departure_date}    \\09

I am departing at
    [Arguments]  ${depature_time}
        wait until element is visible   ${lst_departure_time}
        @{list_items}=  get list items  ${lst_departure_time}
        log to console  @{list_items}
        select from list by value  ${lst_departure_time}    ${lst_departure_time}

I am returning on date
    [Arguments]  ${return_date}
        wait until element is visible  ${tbx_return_date}
        input text  ${tbx_return_date}  ${return_date}
        press key  ${tbx_return_date}   \\09

The number of adults are
    [Arguments]  ${number_of_adults}
        wait until element is visible  ${lst_adults}
         @{list_items}=  get list items  ${lst_adults}
        log to console  '@{list_items}'
        select from list by value  ${lst_adults}    ${number_of_adults}

The number of children are
    [Arguments]  ${number_of_children}
        wait until element is visible  ${lst_children}
         @{list_items}=  get list items  ${lst_children}
        log to console  '@{list_items}'
        select from list by value  ${lst_children}    ${number_of_children}

I prefer non-stop
    wait until element is visible  ${cbx_non_stop}
    select checkbox  ${cbx_non_stop}

I want airline
    [Arguments]  ${arline}
    wait until element is visible  ${lst_airline}
    @{list_items}=  get list items  ${lst_airline}
    log to console  '@{list_items}'
    select from list    ${lst_airline}    ${arline}

I want class
    [Arguments]  ${class}
    wait until element is visible  ${lst_class}
    @{list_items}=  get list items  ${lst_class}
    log to console  '@{list_items}'
    select from list  ${lst_class}    ${class}

Search for my flight
    wait until element is visible  ${btn_search_flight}
    click element  ${btn_search_flight}