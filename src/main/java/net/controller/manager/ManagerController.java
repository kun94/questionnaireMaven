package net.controller.manager;

import net.service.QuestionService;
import net.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/managerr")
public class ManagerController {

    @Autowired
    private QuestionnaireService questionnaireService;

    public QuestionnaireService getQuestionnaireService() {
        return questionnaireService;
    }

    public void setQuestionnaireService(QuestionnaireService questionnaireService) {
        this.questionnaireService = questionnaireService;
    }

    @Autowired
    private QuestionService questionService;

    public QuestionService getQuestionService() {
        return questionService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    @RequestMapping("/showQuestionnaire/issued")
    public String showIssueQuestionnaire(Model model) {
        model.addAttribute(questionnaireService.selectIssueQuestionnaire());
        return "/manager/managerView";
    }

    @RequestMapping("/showQuestionnaire/noIssued")
    public String showNoIssueQuestionnaire(Model model) {
        model.addAttribute(questionnaireService.selectNoIssueQuestionnaire());
        return "/manager/managerView";
    }

    @RequestMapping("/showQuestionnaire/all")
    public String showAllIssueQuestionnaire(Model model) {
        model.addAttribute(questionnaireService.selectAllQuestionnaire());
        return "/manager/managerView";
    }

    @RequestMapping(value = "/preview/{questionnaireId}", method = RequestMethod.GET)
    public String aa(@PathVariable("questionnaireId") int questionnaireId, Model model) {
        model.addAttribute(questionnaireService.selectQuestionnaireById(questionnaireId));
        model.addAttribute(questionService.selectQuestionById(questionnaireId));
        return "manager/questionnaireView";
    }

    @RequestMapping(value = "/isRelease/{questionnaireId}", method = RequestMethod.GET)
    public String questionnaireRelease(@PathVariable("questionnaireId") int questionnaireId, Model model) {

        if (questionnaireService.updateQuestionnaireRelease(questionnaireId)) {
            return "forward:/managerr/showQuestionnaire/all";
        }
        return "manager/questionnaireView";
    }

}
