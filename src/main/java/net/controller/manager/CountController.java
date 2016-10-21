package net.controller.manager;

import net.service.AnswerService;
import net.service.QuestionService;
import net.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/managerr")
public class CountController {

    @Autowired
    private QuestionnaireService questionnaireService;

    public QuestionnaireService getQuestionnaireService() {
        return questionnaireService;
    }

    public void setQuestionnaireService(QuestionnaireService questionnaireService) {
        this.questionnaireService = questionnaireService;
    }

    @Autowired
    private AnswerService answerService;

    public AnswerService getAnswerService() {
        return answerService;
    }

    public void setAnswerService(AnswerService answerService) {
        this.answerService = answerService;
    }

    @Autowired
    private QuestionService questionService;

    public QuestionService getQuestionService() {
        return questionService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    @RequestMapping("/countAnswer/{questionnaireId}")
    public String count(@PathVariable("questionnaireId") int questionnaireId, Model model) {
        model.addAttribute(questionnaireService.selectQuestionnaireById(questionnaireId));
        model.addAttribute(answerService.selectAllrAnswerById(questionnaireId));
        model.addAttribute(questionService.selectQuestionById(questionnaireId));
        return "manager/questionnaireCount";
    }


}
