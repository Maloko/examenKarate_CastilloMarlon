@feature_post
Feature: Validación de actualización de mascota POST

  Background:
    * configure ssl = true

  @test_postExitoso
  Scenario: Validar  un codigo existente
    * def petId = 123
    * def nombre = 'puerco'
    * def estado = 'available'

    * if (petId == null || !Number.isInteger(petId)) karate.fail('El petId debe ser un número entero')

    * url 'https://petstore.swagger.io/v2/pet/' + petId

    #Configurar encabezados necesarios
    * header Accept = 'application/json'
    * header Content-Type = 'application/x-www-form-urlencoded'

   #Configurar los datos en form-data
    * form field name = nombre
    * form field status = estado

    #Enviar la solicitud POST
    When method post
    Then status 200
    * match response.code == 200
    * match response.message == petId.toString()


  @test_postFallido
  Scenario: Validar  un codigo no existente
    * def petId = 100000001
    * def nombre = 'puercoMt'
    * def estado = 'available'

    * url 'https://petstore.swagger.io/v2/pet/' + petId

    #Configurar encabezados necesarios
    * header Accept = 'application/json'
    * header Content-Type = 'application/x-www-form-urlencoded'

   #Configurar los datos en form-data
    * form field name = nombre
    * form field status = estado

    #Enviar la solicitud POST
    When method post
    Then status 404
    * match response.code == 404
    * match response.message == 'not found'

