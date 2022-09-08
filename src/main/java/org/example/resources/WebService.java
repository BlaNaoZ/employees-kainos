package org.example.resources;

import io.swagger.annotations.Api;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Properties;

@Api("Engineering Academy Dropwizard API")

@Path("/api")
public class WebService {

    private static Connection conn;

    private static Connection getConnection() {
        String user;
        String password;
        String host;

        if (conn != null) {
            return conn;
        }

        try {
            FileInputStream propsStream =
                    new FileInputStream("src/main/resources/employeesdb.properties");

            Properties props = new Properties();
            props.load(propsStream);

            user            = props.getProperty("user");
            password        = props.getProperty("password");
            host            = props.getProperty("host");

            if (user == null || password == null || host == null)
                throw new IllegalArgumentException(
                        "Properties file must exist and must contain "
                                + "user, password, and host properties.");

            conn = DriverManager.getConnection("jdbc:mysql://"
                    + host + "/Web_Service_FlorianB?useSSL=false", user, password);
            return conn;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @POST
    @Path("/print")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String sendMsg(Message message) {

        try {
            Connection c = getConnection();
            Statement st = c.createStatement();

            String address = message.getAddress();
            String[] addressSplit = address.split(", ");

            System.out.println("INSERT INTO `Addresses` (AddressLineOne, Town, County, Postcode) VALUES ('"
                    + addressSplit[0] + "', "
                    + addressSplit[1] + "', '"
                    + addressSplit[2] + "', '"
                    + addressSplit[3] + "');");


            if(addressSplit.length == 4) {
                st.executeUpdate("INSERT INTO `Addresses` (AddressLineOne, Town, County, Postcode) VALUES ('"
                        + addressSplit[0] + "', '"
                        + addressSplit[1] + "', '"
                        + addressSplit[2] + "', '"
                        + addressSplit[3] + "');");
            }
            else{
                st.executeUpdate("INSERT INTO `Addresses` (AddressLineOne, Town, Postcode) VALUES ("
                        + addressSplit[0] + ", "
                        + addressSplit[1] + ", "
                        + addressSplit[2] + ");");
            }

            ResultSet addressID = st.executeQuery("SELECT AddressID FROM Addresses WHERE AddressLineOne = '" + addressSplit[0]
                                        + "' AND Town = '" + addressSplit[1]
                                        + "' AND Postcode = '" + addressSplit[3] +"';");
            int ID = 0;
            if(addressID.next()){
                ID = addressID.getInt(1);
            }

            st.executeUpdate(
                    "INSERT INTO `Employees` (EmployeeID, AddressID, Name, StartingSalary, BankNum, NIN, Department) VALUES ("
                            + message.getEmployeeNumber() + ", "
                            + ID + ", '"
                            + message.getName() + "', "
                            + message.getSalary() + ", '"
                            + message.getBankAcc() + "', '"
                            + message.getNino() + "', "
                            + "'Finance');");

            return "Message " + message.getName();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return "Hello from a RESTful Web service: " + message.getName();
    }

    @GET
    @Path("/print/{msg}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getMsg(@PathParam("msg") String message) {
        return "Hello from a RESTful Web service: " + message;
    }
}
