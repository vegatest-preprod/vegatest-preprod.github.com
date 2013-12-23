Feature: Pages
  To verify page titles

  Scenario Outline: Check page titles
    Given I have opened <page> page
    Then the page should contain <text> text

  Examples:
    | page | text        |
    | /  | Vega Test |