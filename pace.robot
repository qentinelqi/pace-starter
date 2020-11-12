# Tip 1: Everything that starts with # is a guidance for you and will not get executed.

*** Settings ***
Documentation           Test suites for Pace starter.
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

# Tip 2: Settings are where you define suite level configuration.
#        Suite setup and teardown are actions that happen before and after a suite run.
#        For first time users, we don't recommend to change them. 
#        You may change chrome to firefox should you wish to test your application on firefox.

*** Test Cases ***

# Tip 3: Test cases start from under *** Test Cases ***
#        The structure of a test case is as follows: 
#        Name of the test
#             Documentation   A short explanation of the test.
#             Test steps

Test the home page      
    [Documentation]     Go to the shop webshop's homepage and verify text. This is the document for this text. 
    ...                 The document continues. 
    GoTo                https://qentinelqi.github.io/shop/          # Tip 4: You can change this URL to test any other website.
    VerifyText          Find your spirit animal                     # Tip 5: Verify that the page contains the given text.

# Tip 6: Please note that a test starts on a new line.
#        Every test step starts with an indent of minimum two spaces. A tab is recommended.
#        A tab or minimum of two spaces is necessary between a PaceWord and its argument, and between two arguments.

Check the navigation menu items
    [Documentation]     Go to the shop homepage and verify text.
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Products
    VerifyText          Our Story
    VerifyText          Contact

Shop for products
    [Documentation]     Select a product, verify details on the page, add it to the cart and continue shopping.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

# Pro Tip 1: You could define initital states for your application. We call them AppState. That is the pro way to start your test.
#            An initial state is the state of your application before a test execution begins.
#            In the given tests, we are navigating to https://qentinelqi.github.io/shop/ as an initial application state. 
#            We could also do it by defining a keyword as in the last test case:
# Home
#    Goto        https://qentinelqi.github.io/shop/
# And instead of 'GoTo                https://qentinelqi.github.io/shop/' in the test cases we could use
# AppState      Home
# This is a very simple example, we could define as many AppStates as we wish.

Continue shopping
    [Documentation]     Add a second product to the cart.
    AppState            Home
    ClickText           Gavin the Tiger
    VerifyText          His favorite meal is chickpea salad with a lemon juice dressing.
    VerifyText          $9.00
    ClickText           Add to cart
    ClickText           Continue shopping
    VerifyText          Fur, Inc.           # Check if we've exited the "cart" by looking for text in the footer.
    
*** Keywords ***

Home 
    Goto        https://qentinelqi.github.io/shop/

# Pro Tip 2: You could combine PaceWords to make your own PaceWord. Keywords are defined under ***Keywords ***.
#            The pro way is to define them in a separate file and import that file under settings.  
