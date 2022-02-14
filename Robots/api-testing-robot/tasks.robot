*** Settings ***
Documentation     Use GET request to https://jsonplaceholder.typicode.com/users and validate that the request is similar to the provided "task1.json" -file
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${base_url}  https://jsonplaceholder.typicode.com
${extension}  /users

*** Test Cases ***
Get data from the API
    Create Session    get_user_data    ${base_url}   
    ${response}=    GET On Session    get_user_data    ${extension}
    ${content_string}=    Convert To String    ${response.content}
    Set Global Variable    ${content_global}     ${content_string}   

Compare the API data to true JSON file 
    ${true_task1_json}=    Get File    files_to_compare/task1.json
    ${true_task1_string}=    Convert To String    ${true_task1_json}
    Should Be Equal As Strings    ${content_global}    ${true_task1_string}

Compare the API data to fake JSON file
    ${fake_task1_json}=    Get File    files_to_compare/task1_fake.json
    ${fake_task1_string}=    Convert To String    ${fake_task1_json}
    Should Not Be Equal As Strings    ${content_global}    ${fake_task1_string}



    