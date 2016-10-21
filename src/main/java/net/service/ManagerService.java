package net.service;

import net.entity.Manager;
import net.entity.User;
import net.entity.mapper.ManagerMapper;
import net.entity.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@Component
public class ManagerService {

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

    public ManagerMapper getManagerMapper() {
        return managerMapper;
    }

    public void setManagerMapper(ManagerMapper managerMapper) {
        this.managerMapper = managerMapper;
    }

    public boolean managerLogin(String managerName, String password) {
        SqlSession sqlSession = sessionFactory.openSession();
        managerMapper = sqlSession.getMapper(ManagerMapper.class);
        Manager manager = managerMapper.selectByManagerName(managerName);
        sqlSession.close();

        if (Objects.equals(manager.getManagerName(), managerName) && manager.getPassword().equals(password)) {
            return true;
        } else {
            return false;
        }

    }
}
