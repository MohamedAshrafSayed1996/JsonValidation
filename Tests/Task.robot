*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${URL1}      https://61fefa005e1c4100174f6db5.mockapi.io
${URL2}      https://fakestoreapi.com
*** Keywords ***

*** Test Cases ***


Get_Request
    Create Session    GetUser     ${URL2}
    ${response} =  GET On Session  GetUser  /products/1
    Should Be Equal As Strings    ${response.status_code}    200
    ${json}=  Set Variable  ${response.json()}
    Should Be Equal As Strings    ${json['title']}    Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops
    Should Be Equal As Numbers    ${json['price']}    109.95
    Delete All Sessions
