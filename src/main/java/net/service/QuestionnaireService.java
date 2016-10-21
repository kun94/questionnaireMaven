package net.service;

import net.entity.Question;
import net.entity.Questionnaire;
import net.entity.User;
import net.entity.mapper.QuestionMapper;
import net.entity.mapper.QuestionnaireMapper;
import net.entity.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
public class QuestionnaireService {

    @Autowired
    private SqlSessionFactory sessionFactory;

    public SqlSessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SqlSessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Autowired
    private QuestionnaireMapper questionnaireMapper;

    public QuestionnaireMapper getQuestionnaireMapper() {
        return questionnaireMapper;
    }

    public void setQuestionnaireMapper(QuestionnaireMapper questionnaireMapper) {
        this.questionnaireMapper = questionnaireMapper;
    }

    public List<Questionnaire> selectAllQuestionnaire() {

        SqlSession sqlSession = sessionFactory.openSession();
        questionnaireMapper = sqlSession.getMapper(QuestionnaireMapper.class);
        List<Questionnaire> questionnaireList = questionnaireMapper.selectAllQuestionnaire();
        sqlSession.close();
        return questionnaireList;
    }

    public List<Questionnaire> selectIssueQuestionnaire() {

        SqlSession sqlSession = sessionFactory.openSession();
        questionnaireMapper = sqlSession.getMapper(QuestionnaireMapper.class);
        List<Questionnaire> questionnaireList = questionnaireMapper.selectIssueQuestionnaire();
        sqlSession.close();
        return questionnaireList;
    }

    public List<Questionnaire> selectNoIssueQuestionnaire() {

        SqlSession sqlSession = sessionFactory.openSession();
        questionnaireMapper = sqlSession.getMapper(QuestionnaireMapper.class);
        List<Questionnaire> questionnaireList = questionnaireMapper.selectNoIssueQuestionnaire();
        sqlSession.close();
        return questionnaireList;
    }

    public Questionnaire selectQuestionnaireById(int questionnaireId) {

        SqlSession sqlSession = sessionFactory.openSession();
        questionnaireMapper = sqlSession.getMapper(QuestionnaireMapper.class);
        Questionnaire questionnaire = questionnaireMapper.selectQuestionnaireById(questionnaireId);
        sqlSession.close();
        return questionnaire;
    }

    public boolean deleteQuestionnaire(int questionnaireId) {

        SqlSession sqlSession = sessionFactory.openSession();
        questionnaireMapper = sqlSession.getMapper(QuestionnaireMapper.class);
        boolean b = questionnaireMapper.deleteQuestionnaire(questionnaireId);
        sqlSession.commit();
        sqlSession.close();
        return b;
    }

    public boolean updateQuestionnaireRelease(int questionnaireId) {

        SqlSession sqlSession = sessionFactory.openSession();
        questionnaireMapper = sqlSession.getMapper(QuestionnaireMapper.class);
        boolean b = questionnaireMapper.updateQuestionnaireRelease(questionnaireId);
        sqlSession.close();
        return b;
    }

    public boolean updateQuestionnaire(Questionnaire questionnaire) {

        SqlSession sqlSession = sessionFactory.openSession();
        questionnaireMapper = sqlSession.getMapper(QuestionnaireMapper.class);
        boolean b = questionnaireMapper.updateQuestionnaire(questionnaire);
        sqlSession.close();
        return b;
    }


    public int insertQuestionnaire(Questionnaire questionnaire) {

        SqlSession sqlSession = sessionFactory.openSession();
        questionnaireMapper = sqlSession.getMapper(QuestionnaireMapper.class);
        questionnaireMapper.insertQuestionnaire(questionnaire);
        sqlSession.commit();
        sqlSession.close();
        return questionnaire.getQuestionnaireId();
    }

}
