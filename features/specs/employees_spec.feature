Feature: Validate the Employee API methods
    In order to verify if the methods are working correctly
    As a system user
    I want to make requests in the API

    Scenario: Register an employee
        When I make a request to register an employee
        Then the API will return the new employee registration and the status code will be "200"
    
    Scenario: Change an employee`s record
        When I make a request to change an employee`s record
        Then the API will return the change in an employee`s record and the status code will be "200"

    Scenario: Consult all existing employees
        When I make a consultation request
        Then the API will return the existing employees registration and the status code will be "200"

    Scenario: Delete an employee
        When I make a request to delete an employee
        Then the API will return the status code will be "200"