package net.service;

import net.entity.Connection;
import net.entity.mapper.ConnectionMapper;
import net.entity.mapper.QuestionMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


@Service
@Component
public class ConnectionService {

    @Autowired
    private SqlSessionFactory sessionFactory;

    public SqlSessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SqlSessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Autowired
    private ConnectionMapper connectionMapper;

    public ConnectionMapper getConnectionMapper() {
        return connectionMapper;
    }

    public void setConnectionMapper(ConnectionMapper connectionMapper) {
        this.connectionMapper = connectionMapper;
    }

    public boolean insertCollection(Connection connection) {
        SqlSession sqlSession = sessionFactory.openSession();
        connectionMapper = sqlSession.getMapper(ConnectionMapper.class);
        boolean b = connectionMapper.insertCollection(connection);
        sqlSession.commit();
        sqlSession.close();
        return b;
    }

}
