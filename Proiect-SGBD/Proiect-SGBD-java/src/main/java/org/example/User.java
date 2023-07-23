package org.example;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class User {
        public void addUser(int id_user, String username, String password, String name, String email,  String city, int id_car, String date_rented, int to_pay) throws SQLException, SQLException {
            Connection con = ConnectSQL.getConnection();


            try (PreparedStatement pstmt = con.prepareStatement(
                    "insert into USERI (id_user, username, password, name, email, city, id_car, date_rented, to_pay) values (?,?,?,?,?,?,?,?,?)")) {
                pstmt.setInt(1, id_user);
                pstmt.setString(2, username);
                pstmt.setString(3, password);
                pstmt.setString(4, name);
                pstmt.setString(5, email);
                pstmt.setString(6, city);
                pstmt.setInt(7, id_car);
                pstmt.setString(8, date_rented);
                pstmt.setInt(9,to_pay);
                pstmt.executeUpdate();
                System.out.println("User-ul " + name + " a fost adaugat!");
            }
        }

    public void carDiscount(){
        try{
            CallableStatement statement = null;
            String sql = "{call car_discount()}";
            statement = ConnectSQL.getConnection().prepareCall(sql);
            statement.execute();
            System.out.println("Masinile cu id-ul 3 primesc 50% discount");
            statement.close();
        } catch (SQLException e){
            System.out.println("Exception catched: Nu exista masini cu id 3.");
        }
    }
    public void changeCity(int userId, String city) {
        try{
            CallableStatement statement = null;
            String sql = "{call change_city(?,?)}";
            statement = ConnectSQL.getConnection().prepareCall(sql);
            statement.setInt(1, userId);
            statement.setString(2, city);
            statement.execute();
            System.out.println("User-ul cu id = " + userId + " s-a mutat la " + city);
        } catch (SQLException e){
            System.out.println("Exception catched: Utilizatorul nu exista!");
        }
    }

    //////

    public void addCar(int id_car, String name, int year, String combustion, String transmission,  String color, int pollution_taxes) throws SQLException, SQLException {
        Connection con = ConnectSQL.getConnection();
        try (PreparedStatement pstmt = con.prepareStatement(
                "insert into CARS (id_car, name, year, combustion, transmission, color, pollution_taxes) values (?,?,?,?,?,?,?)")) {
            pstmt.setInt(1, id_car);
            pstmt.setString(2, name);
            pstmt.setInt(3, year);
            pstmt.setString(4, combustion);
            pstmt.setString(5, transmission);
            pstmt.setString(6, color);
            pstmt.setInt(7, pollution_taxes);
            pstmt.executeUpdate();
            System.out.println("Masina " + name + " a fost adaugata!");
        }
    }

    ///////
    public void pollutionTaxesIncrease(){
        try{
            CallableStatement statement = null;
            String sql = "{call pollution_taxes_increase()}";
            statement = ConnectSQL.getConnection().prepareCall(sql);
            statement.execute();
            System.out.println("Masinilor fabricate inainte de 2010 li se va adauga o taxa de 100 de lei");
            statement.close();
        } catch (SQLException e){
            System.out.println("Exception catched: Nu exista masini sub 2010.");
        }
    }
    public void deleteCar(int carId){
        try{
            CallableStatement statement = null;
            String sql = "{call delete_car(?)}";
            statement = ConnectSQL.getConnection().prepareCall(sql);
            statement.setInt(1, carId);
            statement.execute();
            System.out.println("Am sters masina cu id " + carId + " din baza de date");
            statement.close();
        } catch (SQLException e) {
            System.out.println("Exception catched: Nu exista masini cu acest id!");
        }
    }


}
