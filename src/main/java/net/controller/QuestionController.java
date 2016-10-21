//package net.controller;
//
//import com.sun.deploy.net.HttpResponse;
//import entity.Music;
//import net.service.QuestionService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import service.MusicService;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@Controller
//public class QuestionController {
//
//    @Autowired
//    private QuestionService questionService;
//
//    public QuestionService getQuestionService() {
//        return questionService;
//    }
//
//    public void setQuestionService(QuestionService questionService) {
//        this.questionService = questionService;
//    }
//
//    @RequestMapping("/music")
//    public String musicList(Model model) {
//        model.addAttribute(musicService.selectAllMusic());
//
//        return "music";
//    }
//
//    @RequestMapping("/musicAjax")
//    public void musicAjax(HttpServletRequest request, HttpServletResponse response) {
//
//
//        System.out.println(request.getParameter("musicName"));
//        System.out.println(request.getAttribute("musicName"));
//        Music music = musicService.selectMusicByMusicName(request.getParameter("musicName"));
//
//        try {
//            PrintWriter printWriter = response.getWriter();
//            printWriter.print(music.getMusicDir() + music.getMusicName() + ".mp3");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//}
