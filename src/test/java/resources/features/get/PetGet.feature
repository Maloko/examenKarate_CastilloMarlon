@feature_get
Feature: Prueba validando metodos get de API PET

  Background:
    * configure ssl = true
    Given url baseURLReqRes
    #Given url "https://petstore.swagger.io"

  @test_get1
  Scenario Outline: Listar mascotas x estado <estado>
    * def nombreStatus = <estado>
    * path '/v2/pet/findByStatus'
    * param status = nombreStatus
    When method get
    Then status 200
    Then match  each response[*].status == <estado>
    Examples:
      | estado      |
      | "available" |
      | "pending"   |
      | "sold"      |



