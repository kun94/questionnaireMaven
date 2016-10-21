package net.service;

import net.entity.Answer;
import net.entity.User;
import net.entity.mapper.AnswerMapper;
import net.entity.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@Component
public class AnswerService {

    @Autowired
    private SqlSessionFactory sessionFactory;

    public SqlSessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SqlSessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Autowired
    private AnswerMapper answerMapper;

    public AnswerMapper getAnswerMapper() {
        return answerMapper;
    }

    public void setAnswerMapper(AnswerMapper answerMapper) {
        this.answerMapper = answerMapper;
    }

    public boolean insertAnswer(Answer answer) {
        SqlSession sqlSession = sessionFactory.openSession();
        AnswerMapper answerMapper = sqlSession.getMapper(AnswerMapper.class);
        answerMapper.insertAnswer(answer);
        sqlSession.commit();
        sqlSession.close();
        return true;
    }

    public List<Answer> selectAllrAnswer() {
        SqlSession sqlSession = sessionFactory.openSession();
        answerMapper = sqlSession.getMapper(AnswerMapper.class);
        List<Answer> answerList = answerMapper.selectAllAnswer();
        sqlSession.close();
        return answerList;
    }

    public List<Answer> selectAllrAnswerById(int questionnaireId) {
        SqlSession sqlSession = sessionFactory.openSession();
        answerMapper = sqlSession.getMapper(AnswerMapper.class);
        List<Answer> answerList = answerMapper.selectAllAnswerById(questionnaireId);
        sqlSession.close();
        return answerList;
    }
}
