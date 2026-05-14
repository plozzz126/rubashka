package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseService {
    private static final String DEFAULT_URL = "jdbc:postgresql://localhost:5432/java_rubezh";
    private static final String DEFAULT_USER = "postgres";
    private static final String DEFAULT_PASSWORD = "postgres";

    private final String url;
    private final String user;
    private final String password;

    public DatabaseService() {
        this.url = getEnvOrDefault("DB_URL", DEFAULT_URL);
        this.user = getEnvOrDefault("DB_USER", DEFAULT_USER);
        this.password = getEnvOrDefault("DB_PASSWORD", DEFAULT_PASSWORD);
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    public void initDatabase() throws SQLException {
        String createTableSql = """
            CREATE TABLE IF NOT EXISTS users (
                id SERIAL PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                email VARCHAR(100) UNIQUE NOT NULL
            );
            """;

        String seedSql = """
            INSERT INTO users (name, email) VALUES
            ('Ayan', 'ayan@mail.com'),
            ('Dana', 'dana@mail.com'),
            ('Madiyar', 'madiyar@mail.com')
            ON CONFLICT (email) DO NOTHING;
            """;

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement()) {
            statement.execute(createTableSql);
            statement.executeUpdate(seedSql);
        }
    }

    private String getEnvOrDefault(String key, String fallback) {
        String value = System.getenv(key);
        if (value == null || value.isBlank()) {
            return fallback;
        }
        return value;
    }
}
