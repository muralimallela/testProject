package projectManagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertBatchData {
    
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/projectManagement";
        String user = "root";
        String password = "";

        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            for (int i = 1; i <= 20; i++) {
                String batchID = "24CS" + String.format("%02d", i);

                String insertQuery = "INSERT INTO batches (batch) VALUES (?)";

                try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                    preparedStatement.setString(1, batchID);
                    preparedStatement.executeUpdate();
                }
            }

            System.out.println("Data inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
