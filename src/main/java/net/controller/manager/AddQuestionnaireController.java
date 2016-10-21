package net.controller.manager;

import com.google.gson.Gson;
import net.entity.Connection;
import net.entity.Question;
import net.entity.Questionnaire;
import net.service.ConnectionService;
import net.service.QuestionService;
import net.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping(value = "/managerr")
public class AddQuestionnaireController {

    @Autowired
    private QuestionService questionService;

    public QuestionService getQuestionService() {
        return questionService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    @Autowired
    private QuestionnaireService questionnaireService;

    public QuestionnaireService getQuestionnaireService() {
        return questionnaireService;
    }

    public void setQuestionnaireService(QuestionnaireService questionnaireService) {
        this.questionnaireService = questionnaireService;
    }

    @Autowired
    private ConnectionService connectionService;

    public ConnectionService getConnectionService() {
        return connectionService;
    }

    public void setConnectionService(ConnectionService connectionService) {
        this.connectionService = connectionService;
    }

    @RequestMapping("/showAddQuestionnaire")
    public String showAddQuestionnaire(Model model) {
        model.addAttribute(questionService.selectAllQuestion());
        Questionnaire questionnaire = new Questionnaire();
        model.addAttribute(questionnaireService.selectQuestionnaireById(questionnaireService.insertQuestionnaire(questionnaire)));
        model.addAttribute("questions", questionService.selectQuestionById(questionnaire.getQuestionnaireId()));
        return "manager/addQuestionnaire";
    }

    @RequestMapping("/showChangeQuestionnaire/{questionnaireId}")
    public String showChangeQuestionnaire(@PathVariable("questionnaireId") int questionnaireId, Model model) {
        model.addAttribute(questionService.selectAllQuestion());
        System.out.println("aaa");
        model.addAttribute("questions", questionService.selectQuestionById(questionnaireId));
        model.addAttribute(questionnaireService.selectQuestionnaireById(questionnaireId));
        return "manager/addQuestionnaire";
    }

    @RequestMapping("/updateQuestionnaire")
    public void updateQuestionnaire(HttpServletRequest request, HttpServletResponse response) {

        System.out.println(request.getParameter("questionnaire"));
        Gson gson = new Gson();
        Questionnaire questionnaire = gson.fromJson(request.getParameter("questionnaire"), Questionnaire.class);

        try {
            PrintWriter printWriter = response.getWriter();
            if (questionnaireService.updateQuestionnaire(questionnaire)) {
                printWriter.print("保存成功!");
            } else {
                printWriter.print("保存失败!");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/addQuestionToQuestionnaire")
    public String addQuestionToQuestionnaire(HttpServletRequest request, HttpServletResponse response) {

//        System.out.println(request.getParameter("connection"));
//        Gson gson = new Gson();
//        Connection connection = gson.fromJson(request.getParameter("connection"), Connection.class);
        Connection connection = new Connection();
        connection.setQuestionnaireId(Integer.parseInt(request.getParameter("questionnaireId")));
        connection.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
        connectionService.insertCollection(connection);
        System.out.println(connection.getQuestionnaireId());
        return "redirect:/managerr/showChangeQuestionnaire/" + connection.getQuestionnaireId();
    }

}
