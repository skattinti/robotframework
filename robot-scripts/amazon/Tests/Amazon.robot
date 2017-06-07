*** Settings ***
Documentation  This is some basic info about the whole suite
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/AmazonApp.robot  # necessary for lower level keywords in test cases
Test Setup  Begin Web Test
Test Teardown  End Web Test

# Copy/paste the below line to Terminal window to execute
# pybot -d results tests/amazon.robot
*** Variables ***

${BROWSER} =  chrome
${START_URL} =  https://www.amazon.com
${SEARCH_TERM} =  Lamborghini Gallardo
${LOGIN_EMAIL} =  sushma.kattinti@yahoo.com
${LOGIN_PASSWORD} =  Starbucks0409!

*** Test Cases ***

Should be able to Login
    [Tags]  Current
    AmazonApp.Login  ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}


Logged out user can search for products
    [Tags]  Smoke
    AmazonApp.Search for Products


Logged out user can view a product
    [Tags]  Smoke
    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results

Logged out user can add product to cart
    [Tags]  Smoke
    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart

Logged out user must sign in to check out
    [Tags]  Smoke
    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart
    AmazonApp.Begin Checkout




