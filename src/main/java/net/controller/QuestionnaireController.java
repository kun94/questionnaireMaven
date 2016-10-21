package net.controller;

import net.service.QuestionService;
import net.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class QuestionnaireController {

    private int questionnaireId;

    public int getQuestionnaireId() {
        return questionnaireId;
    }

    public void setQuestionnaireId(int questionnaireId) {
        this.questionnaireId = questionnaireId;
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
    private QuestionService questionService;

    public QuestionService getQuestionService() {
        return questionService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    @RequestMapping("/questionnaire")
    public String musicList(Model model) {
        model.addAttribute(questionnaireService.selectAllQuestionnaire());

        return "mainView";
    }

    @RequestMapping(value = "/questionnaire/{questionnaireId}", method = RequestMethod.GET)
    public String aa(@PathVariable("questionnaireId") int questionnaireId, Model model) {
        model.addAttribute(questionnaireService.selectQuestionnaireById(questionnaireId));
        model.addAttribute(questionService.selectQuestionById(questionnaireId));
        return "questionnaireView";
    }

    @RequestMapping("/musicAjax")
    public void musicAjax(HttpServletRequest request, HttpServletResponse response) {


        System.out.println(request.getParameter("musicName"));
        System.out.println(request.getAttribute("musicName"));
//        Music music = musicService.selectMusicByMusicName(request.getParameter("musicName"));

        try {
            PrintWriter printWriter = response.getWriter();
//            printWriter.print(music.getMusicDir() + music.getMusicName() + ".mp3");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
