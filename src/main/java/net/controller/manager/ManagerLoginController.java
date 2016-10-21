package net.controller.manager;

import net.entity.Manager;
import net.entity.User;
import net.entity.mapper.ManagerMapper;
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
import net.service.ManagerService;
import net.service.UserService;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/managerr")
public class ManagerLoginController {
    @Autowired
    private SqlSessionFactory sessionFactory;

    public SqlSessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SqlSessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Autowired
    private ManagerMapper managerMapper;

    @Autowired
    private ManagerService managerService;

    public ManagerMapper getManagerMapper() {
        return managerMapper;
    }

    public void setManagerMapper(ManagerMapper managerMapper) {
        this.managerMapper = managerMapper;
    }

    public ManagerService getManagerService() {
        return managerService;
    }

    public void setManagerService(ManagerService managerService) {
        this.managerService = managerService;
    }

    @RequestMapping("/login")
    public String hello(Model model) {
        model.addAttribute(new Manager());
        return "manager/managerLoginForm";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Valid Manager manager, BindingResult result, Model model) {

        model.addAttribute(manager);
        if (result.hasErrors()) {
            return "manager/managerLoginForm";
        }

        if (managerService.managerLogin(manager.getManagerName(), manager.getPassword())) {
            return "redirect:/" + manager.getManagerName();
        }

        return "error";
    }

    @Transactional
    @RequestMapping(value = "/{managerName}", method = RequestMethod.GET)
    public String showUserProfile(@PathVariable("managerName") String managerName, Model model) {
        SqlSession sqlSession = sessionFactory.openSession();
        managerMapper = sqlSession.getMapper(ManagerMapper.class);
        Manager manager = managerMapper.selectByManagerName(managerName);
        model.addAttribute(manager);
        sqlSession.close();
        return "profile";
    }
}
