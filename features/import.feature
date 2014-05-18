Feature: Import products

  Scenario: Can't find product type
    Given a file named "i.csv" with:
    """
    productType,variantId
    foo,1
    """
    When I run `node ../../lib/run --projectKey import-101-64 import --csv i.csv`
    Then the exit status should be 1
    And the output should contain:
    """
    CSV file with 2 row(s) loaded.
    [ '[row 2] Can\'t find product type for \'foo\'' ]
    """