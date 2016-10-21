package net.entity.mapper;

import net.entity.Question;
import net.entity.Questionnaire;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionnaireMapper {

    List<Questionnaire> selectAllQuestionnaire();
    List<Questionnaire> selectIssueQuestionnaire();
    List<Questionnaire> selectNoIssueQuestionnaire();
    Questionnaire selectQuestionnaireById(@Param("questionnaireId") int questionnaireId);
    boolean deleteQuestionnaire(@Param("questionnaireId") int questionnaireId);
    boolean updateQuestionnaireRelease(@Param("questionnaireId") int questionnaireId);
    boolean updateQuestionnaire(Questionnaire questionnaire);
    int insertQuestionnaire(Questionnaire questionnaire);
}
