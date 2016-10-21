package net.controller.manager;

import com.google.gson.Gson;
import net.entity.Question;
import net.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/managerr")
public class AddQuestionController {

    @Autowired
    private QuestionService questionService;

    public QuestionService getQuestionService() {
        return questionService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }


    @RequestMapping("/showAddQuestion")
    public String showAddQuestion(Model model) {
        model.addAttribute(questionService.selectAllQuestion());
        return "/manager/addQuestion";
    }

    @RequestMapping("/addQuestion")
    public void addQuestion(HttpServletRequest request, HttpServletResponse response) {

        System.out.println(request.getParameter("question"));
        Gson gson = new Gson();
        Question question = gson.fromJson(request.getParameter("question"), Question.class);
        questionService.insertQuestion(question);

    }

}
