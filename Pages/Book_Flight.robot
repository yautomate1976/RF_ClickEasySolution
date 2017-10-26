*** Settings ***
Library  ExtendedSelenium2Library

*** Variables ***
${btn_submit}   xpath=//*[@id="EmailCaptureSubmitButton"]
${img_flight_search_results}    xpath=//*[@id="imgHeaderImage"]
${tbl_flight_search_results}    xpath=//*[@class="flight_matrix_table"]*/tbody/tr

*** Test Cases ***
Book a flight
    Select Airline  American

*** Keywords ***
Select Airline
    [Arguments]  ${airline_to_select}
    ${number_of_rows}=  get matching xpath count    ${tbl_flight_search_results}
    table row should contain    ${tbl_flight_search_results}    1   ${airline_to_select}
    log to console  ${number_of_rows}


