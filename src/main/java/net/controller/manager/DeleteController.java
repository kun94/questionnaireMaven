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
public class DeleteController {

    @Autowired
    private QuestionnaireService questionnaireService;

    public QuestionnaireService getQuestionnaireService() {
        return questionnaireService;
    }

    public void setQuestionnaireService(QuestionnaireService questionnaireService) {
        this.questionnaireService = questionnaireService;
    }


    @RequestMapping("/delete/{questionnaireId}")
    public String deleteQuestionnaire(@PathVariable("questionnaireId") int questionnaireId) {

        questionnaireService.deleteQuestionnaire(questionnaireId);
        return "forward:/managerr/showQuestionnaire/all";

    }

}
