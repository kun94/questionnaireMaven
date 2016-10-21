package net.entity.mapper;


import net.entity.Question;
import net.entity.Questionnaire;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionMapper {

    List<Question> selectAllQuestion();

    List<Question> selectQuestionById(@Param("questionnaireId") int questionnaireId);

    boolean insertQuestion(Question question);

}
