*** Settings ***
# Don't change these settings when trying out Qentinel Pace for the first time.
Documentation       Test suites for Pace starter.
Library             QWeb
Suite Setup         Open Browser       about:blank       chrome
Suite Teardown      Close All Browsers


*** Test Cases ***
# You can start editing from this line onwards.
Test the home page      # This is the name of your test case
    [Documentation]     Go to the shop homepage and verify text.    # A short explaination of the test.
    GoTo                https://qentinelqi.github.io/shop/          # You can change this URL to test any other website.
    VerifyText          Find your spirit animal                     # Verify that the page contains the given text.

# The above is the most basic test, which just goes to a web page and verifies if a line of text exists or not.

# Here are more tests, that navigate aroud the website, fills up a form, and proceeds with the checkout process.
Check the navigation menu items
    [Documentation]     Go to the shop homepage and verify text.
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Products              
    VerifyText          Our Story              
    VerifyText          Contact              

Shop for products
    [Documentation]     Select a product, verify details on the page, add it to the cart and continue shopping.
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

Continue shopping
    [Documentation]     Add a second product to the cart.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Gavin the Tiger
    VerifyText          His favorite meal is chickpea salad with a lemon juice dressing.
    VerifyText  	    $9.00
    ClickText           Add to cart

Proceed to checkout
    [Documentation]     Proceed with the checkout process.
    ClickText           Checkout
    VerifyText          Billing
    VerifyText          Order summary
    # We now proceed with filling up the form.
    ClickText           I don't see my address
    TypeText            Full name                Pekka Suomalainen 
    TypeText            Email                    noreply@qentinel.fi
    TypeText            Street address           Joulumaantie 1
    TypeText            City                     Rovaniemi
    ClickText           Country
    ClickText           Canada
    ClickText           Province/State
    TypeText            Yukon
    TypeText            Postal/ZIP code          99999
    ClickText           Continue to payment

Proceed with payment
    [Documentation]     Fill up the payment form with the card details
    VerifyText          Credit card
    TypeText            Card number         4242 4242 4242 4242     # This is test credit card on Stripe.
    TypeText            MM/YY               10/30
    TypeText            CVV                 424
    ClickText           Place order
    VerifyText          Processing payment
    