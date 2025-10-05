Feature: Factorial calculation

  Scenario: Successful calculation
    Given a business service that calculates the factorial of a number
    When the number is <number>
    Then it should return <result>

    Examples:
      | number | result |
      | 0      | 1      |
      | 1      | 1      |
      | 2      | 2      |
      | 3      | 6      |
      | 4      | 24     |
      | 5      | 120    |
      | 6      | 720    |