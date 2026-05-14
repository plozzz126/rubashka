import model.User;
import repository.UserRepository;
import service.DatabaseService;
import service.FileService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        DatabaseService databaseService = new DatabaseService();
        UserRepository userRepository = new UserRepository(databaseService);
        FileService fileService = new FileService("users.txt");

        try {
            databaseService.initDatabase();

            List<User> users = userRepository.findAll();

            System.out.println("Список пользователей из базы данных:");
            for (User user : users) {
                System.out.println(user);
            }

            fileService.writeUsers(users);
            System.out.println("Пользователи успешно записаны в файл: users.txt");
        } catch (SQLException e) {
            System.out.println("Ошибка работы с базой данных: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("Ошибка записи в файл: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Неожиданная ошибка: " + e.getMessage());
        }
    }
}
