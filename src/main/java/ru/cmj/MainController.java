package ru.cmj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.cmj.domain.User;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by akonshina on 12.08.14.
 */

@Controller
@RequestMapping("/emp")
public class MainController {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(
            @RequestParam String fio,
            @RequestParam String pass,
            @RequestParam(required = false) String permission_register,
            @RequestParam(required = false) String permission_read,
            @RequestParam(required = false) String permission_edit,
            @RequestParam(required = false) String permission_admin
    ) {
        this.jdbcTemplate.update(
                "INSERT INTO employee(fio,password,can_req,can_read,can_edit,can_create_user) values(?,?,?,?,?,?)",
                fio, pass,
                permission_register == null ? 0 : 1, permission_read == null ? 0 : 1,
                permission_edit == null ? 0 : 1, permission_admin == null ? 0 : 1);

        return "redirect:/emp/list?success=true";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String main(Model ui) {

        List<User> mas = this.jdbcTemplate.query(
                "SELECT fio,can_req,can_read,can_edit,can_create_user FROM employee",
                new RowMapper<User>() {
                    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                        User us = new User();
                        us.setFio(rs.getString("fio"));
                        us.setCanReq(rs.getInt("can_req") == 1);
                        us.setCanRead(rs.getInt("can_read") == 1);
                        us.setCanEdit(rs.getInt("can_edit") == 1);
                        us.setCanAdmin(rs.getInt("can_create_user") == 1);
                        return us;
                    }
                });
        ui.addAttribute("mas", mas);

        return "emp";
    }
}

