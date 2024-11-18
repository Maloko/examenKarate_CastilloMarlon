@feature_put
Feature: Validación de actualización de mascota (PUT)

  Background:
    * configure ssl = true
    Given url baseURLReqRes

  @test_put1
  Scenario: Validar que los valores de 'name' y 'status' sean validos
    * path '/v2/pet'
    * def utilGenerarNombres = Java.type('examples.Util.Util')
    * def name = utilGenerarNombres.obtenerNombreRandom()
    * def status = 'available'
    And header Content-Type = 'application/json'
    And def bodyRequest = read('classpath:resources/json/put_pet.json')
    And request bodyRequest
    When method put
    Then status 200
    * print 'El nombre enviado es: ' + name
    * print 'El status enviado es: ' + status
    And match response.name == name
    And match response.status == status
    * print 'El nombre en la respuesta es: ' + response.name
    * print 'El status en la respuesta es: ' + response.status


