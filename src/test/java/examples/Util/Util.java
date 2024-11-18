package examples.Util;

import com.github.javafaker.Faker;

public class Util {

    public static String obtenerNombreRandom() {
        Faker faker = new Faker();
        return faker.name().firstName();

    }
}
