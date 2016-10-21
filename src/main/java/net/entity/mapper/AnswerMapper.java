package net.entity.mapper;

import net.entity.Answer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnswerMapper {

    boolean insertAnswer(Answer answer);
    List<Answer> selectAllAnswer();
    List<Answer> selectAllAnswerById(@Param("questionnaireId") int questionnaireId);
}