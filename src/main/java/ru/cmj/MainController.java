package ru.cmj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by akonshina on 12.08.14.
 */

@Controller
@RequestMapping("/emp")
public class MainController {

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(
            @RequestParam String fio,
            @RequestParam String pass,
            @RequestParam(required = false) String permission_register,
            @RequestParam(required = false) String permission_read,
            @RequestParam(required = false) String permission_edit,
            @RequestParam(required = false) String permission_admin
    ) {
        PreparedStatement preparedStatement;
        try {
            Connection connection = DbConnection.getConnection();
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO employee(fio,password,can_req,can_read,can_edit,can_create_user) values(?,?,?,?,?,?)");
            preparedStatement.setString(1, fio);
            preparedStatement.setString(2, pass);
            preparedStatement.setInt(3, permission_register == null ? 0 : 1);
            preparedStatement.setInt(4, permission_read == null ? 0 : 1);
            preparedStatement.setInt(5, permission_edit == null ? 0 : 1);
            preparedStatement.setInt(6, permission_admin == null ? 0 : 1);
            preparedStatement.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return new ModelAndView("redirect:/emp/list?success=true");
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String main(Model ui) {
        ArrayList<User> mas = new ArrayList<User>();
        User us;
        PreparedStatement preparedStatement;
        try {
            Connection connection = DbConnection.getConnection();

            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT fio,can_req,can_read,can_edit,can_create_user FROM employee");
            while (rs.next()) {
                us = new User();
                us.setFio(rs.getString("fio"));
                us.setCanReq(rs.getInt("can_req") == 1);
                us.setCanRead(rs.getInt("can_read") == 1);
                us.setCanEdit(rs.getInt("can_edit") == 1);
                us.setCanAdmin(rs.getInt("can_create_user") == 1);
                mas.add(us);
            }
            ui.addAttribute("mas", mas);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "emp";
    }
}

