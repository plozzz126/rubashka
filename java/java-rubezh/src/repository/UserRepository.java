package repository;

import model.User;
import service.DatabaseService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    private final DatabaseService databaseService;

    public UserRepository(DatabaseService databaseService) {
        this.databaseService = databaseService;
    }

    public List<User> findAll() throws SQLException {
        String sql = "SELECT id, name, email FROM users ORDER BY id";
        List<User> users = new ArrayList<>();

        try (Connection connection = databaseService.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                users.add(
                    new User(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("email")
                    )
                );
            }
        }

        return users;
    }
}
