package net.controller;

import net.entity.User;
import net.entity.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
public class RegisterController {

    @Autowired
    private SqlSessionFactory sessionFactory;

    public SqlSessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SqlSessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Autowired
    private UserMapper userMapper;

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @RequestMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute(new User());
        return "registerForm";
    }

    @Transactional
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid User user, BindingResult result, Model model) {
        model.addAttribute(user);
        if (result.hasErrors()) {
            return "registerForm";
        }
        System.out.println(user.getUsername());
        System.out.println(user.getPassword());
        SqlSession sqlSession = sessionFactory.openSession();
        userMapper = sqlSession.getMapper(UserMapper.class);
        if (userMapper.insertUser(user)) {
            System.out.println("success!!!");
        }
        sqlSession.commit();
        sqlSession.close();
        return "redirect:/" + user.getUsername();
    }

    @Transactional
    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    public String showUserProfile(@PathVariable("username") String username, Model model) {
        SqlSession sqlSession = sessionFactory.openSession();
        userMapper = sqlSession.getMapper(UserMapper.class);
        User user = userMapper.selectByUsername(username);
        model.addAttribute(user);
        sqlSession.close();
        return "user/profile";
    }
}
