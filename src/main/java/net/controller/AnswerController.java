package net.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import jdk.nashorn.internal.parser.JSONParser;
import net.entity.Answer;
import net.service.AnswerService;
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
import java.util.List;

@Controller
public class AnswerController {

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
    private AnswerService answerService;

    public AnswerService getAnswerService() {
        return answerService;
    }

    public void setAnswerService(AnswerService answerService) {
        this.answerService = answerService;
    }

    @RequestMapping("/answer")
    public void answer(HttpServletRequest request, HttpServletResponse response) {

        System.out.println(request.getParameter("answers"));
        String answers = request.getParameter("answers");
        String questionnaireId = request.getParameter("questionnaireId");
        Gson gson = new Gson();
        List<Answer> answerList = gson.fromJson(answers, new TypeToken<List<Answer>>() {
        }.getType());

        for (Answer answer : answerList) {
            answerService.insertAnswer(answer);
        }

        try {
            PrintWriter printWriter = response.getWriter();
            printWriter.print("提交成功");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

//    @RequestMapping("/answer")
//    public String musicList(Model model) {
//        model.addAttribute(questionnaireService.selectAllQuestionnaire());
//
//        return "mainView";
//    }

//    @RequestMapping(value = "/questionnaire/{questionnaireId}", method = RequestMethod.GET)
//    public String aa(@PathVariable("questionnaireId") int questionnaireId, Model model) {
//        model.addAttribute(questionnaireService.selectQuestionnaireById(questionnaireId));
//        model.addAttribute(questionService.selectQuestionById(questionnaireId));
//        return "questionnaireView";
//    }
//
//    @RequestMapping("/musicAjax")
//    public void musicAjax(HttpServletRequest request, HttpServletResponse response) {
//
//
//        System.out.println(request.getParameter("musicName"));
//        System.out.println(request.getAttribute("musicName"));
////        Music music = musicService.selectMusicByMusicName(request.getParameter("musicName"));
//
//        try {
//            PrintWriter printWriter = response.getWriter();
////            printWriter.print(music.getMusicDir() + music.getMusicName() + ".mp3");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//    }

}
