package service;

import model.User;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class FileService {
    private final String filePath;

    public FileService(String filePath) {
        this.filePath = filePath;
    }

    public void writeUsers(List<User> users) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (User user : users) {
                writer.write(user.toString());
                writer.newLine();
            }
        }
    }
}
