When('I make a request to register an employee') do
    @body = {
      "name": Faker::Name.name,
      "salary": Faker::Number.number(digits: 4),
      "age": Faker::Number.number(digits: 2)
    }.to_json

    @postEmployees = HTTParty.post'http://dummy.restapiexample.com/api/v1/create',
      :body => @body,
      :headers => {
        "Content-Type" => 'application/json'
      }
  end
  
  Then('the API will return the new employee registration and the status code will be {string}') do |statuscode|
    log @postEmployees.body
    log @postEmployees.code
    expect(@postEmployees.response.code).to eq statuscode
  end



When('I make a request to change an employee`s record') do
    @newName = Faker::Name.name
    @newSalary = Faker::Number.number(digits: 5)
    @newAge = Faker::Number.number(digits: 2)
  
    @putBody = {
      "name": @newName,
      "salary": @newSalary,
      "age": @newAge
    }.to_json

    @putEmployees = HTTParty.put 'http://dummy.restapiexample.com/api/v1/update/14',
    :body => @putBody,
    :headers => {
      "Content-Type" => 'application/json'
    }
  end
  
  Then('the API will return the change in an employee`s record and the status code will be {string}') do |status_code|
    log @putEmployees.body
    log @putEmployees.code
    expect(@putEmployees.response.code).to eq status_code
  end



When('I make a consultation request') do
    @getEmployees = HTTParty.get 'http://dummy.restapiexample.com/api/v1/employees'
  end
  
  Then('the API will return the existing employees registration and the status code will be {string}') do |statusCode|
    log @getEmployees.body
    log @getEmployees.code
    expect(@getEmployees.response.code).to eq statusCode
  end



When('I make a request to delete an employee') do
    @deleteBody = {
      "id": 19
    }.to_json

    @deleteEmployees = HTTParty.delete 'http://dummy.restapiexample.com/api/v1/delete/19',
    :body => @deleteBody,
    :headers => {
      "Content-Type" => 'application/json'
    }
  end
  
  Then('the API will return the status code will be {string}') do |status_Code|
    log @deleteEmployees.body
    log @deleteEmployees.code
    expect(@deleteEmployees["id"]).to eq nil
    expect(@deleteEmployees.response.code).to eq status_Code
  end