package net.service;


import net.entity.Question;
import net.entity.Questionnaire;
import net.entity.mapper.QuestionMapper;
import net.entity.mapper.QuestionnaireMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Component
@Service
public class QuestionService {
    @Autowired
    private SqlSessionFactory sessionFactory;

    public SqlSessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SqlSessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Autowired
    private QuestionMapper questionMapper;

    public QuestionMapper getQuestionMapper() {
        return questionMapper;
    }

    public void setQuestionMapper(QuestionMapper questionMapper) {
        this.questionMapper = questionMapper;
    }

    public List<Question> selectAllQuestion() {

        SqlSession sqlSession = sessionFactory.openSession();
        questionMapper = sqlSession.getMapper(QuestionMapper.class);
        List<Question> questionList = questionMapper.selectAllQuestion();
        sqlSession.close();
        return questionList;
    }

    public List<Question> selectQuestionById(int questionnaireId) {

        SqlSession sqlSession = sessionFactory.openSession();
        questionMapper = sqlSession.getMapper(QuestionMapper.class);
        List<Question> questionList = questionMapper.selectQuestionById(questionnaireId);
        sqlSession.close();
        return questionList;
    }

    public boolean insertQuestion(Question question) {
        SqlSession sqlSession = sessionFactory.openSession();
        questionMapper = sqlSession.getMapper(QuestionMapper.class);
        boolean b = questionMapper.insertQuestion(question);
        sqlSession.commit();
        sqlSession.close();
        return b;
    }
}
