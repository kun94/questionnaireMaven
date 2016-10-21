package net.service;

import net.entity.User;
import net.entity.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
@Component
public class UserService {

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

    public boolean userLogin(String username, String password) {
        SqlSession sqlSession = sessionFactory.openSession();
        userMapper = sqlSession.getMapper(UserMapper.class);
        User user = userMapper.selectByUsername(username);
        sqlSession.close();

        if (Objects.equals(user.getUsername(), username) && user.getPassword().equals(password)) {
            return true;
        } else {
            return false;
        }
    }

    public List<User> selectAllUser() {
        SqlSession sqlSession = sessionFactory.openSession();
        userMapper = sqlSession.getMapper(UserMapper.class);
        List<User> userList = userMapper.selectAllUser();
        sqlSession.close();
        return userList;
    }

}
