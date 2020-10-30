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

# Here are more tests, which check our navigation menu, and then adds items to the shopping card.
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

Continue shopping
    [Documentation]     Add a second product to the cart.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Gavin the Tiger
    VerifyText          His favorite meal is chickpea salad with a lemon juice dressing.
    VerifyText          $9.00
    ClickText           Add to cart
    ClickText           Continue shopping
    VerifyText          Fur, Inc.           # Check if we've exited the "cart" by looking for text in the footer.
