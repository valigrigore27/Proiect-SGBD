package org.example;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;


public class Main {
    public static void main(String args[]) {
        try {
            var user = new User();
            //adaug user nou
            //user.addUser(13, "asudbas", "pass123", "Ionut Matei", "john@example.com", "Bucharest", 35, "2023-05-23", 10);

            HashSet <User> users = new HashSet<>();
            users.stream().sorted();

            //masinile cu id 3 primesc discount de 50
            user.carDiscount();

            //schimb locatia unui user
            //user.changeCity(1, "Ploiesti");

            //Masinilor sub 2010 li se maresgte taxa
            //user.pollutionTaxesIncrease();

            //Stergem masina cu id 10 din baza de date
            //user.deleteCar(10);
            //user.addCar(10, "Volkswaasdasdgen", 2014, "Diesel", "Automatic", "blufsde", 250);
            ///
            ConnectSQL.getConnection().setAutoCommit(false);
            ConnectSQL.getConnection().commit();
            ConnectSQL.getConnection().close();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

}