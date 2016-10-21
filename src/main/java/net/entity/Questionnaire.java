package net.entity;


import org.springframework.stereotype.Component;

@Component
public class Questionnaire {

    private int questionnaireId;
    private String introduction;
    private String questionnaireName;
    private String startData;
    private String overData;
    private String isRelease;

    public String getIsRelease() {
        return isRelease;
    }

    public void setIsRelease(String isRelease) {
        this.isRelease = isRelease;
    }

    public int getQuestionnaireId() {
        return questionnaireId;
    }

    public void setQuestionnaireId(int questionnaireId) {
        this.questionnaireId = questionnaireId;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getQuestionnaireName() {
        return questionnaireName;
    }

    public void setQuestionnaireName(String questionnaireName) {
        this.questionnaireName = questionnaireName;
    }

    public String getStartData() {
        return startData;
    }

    public void setStartData(String startData) {
        this.startData = startData;
    }

    public String getOverData() {
        return overData;
    }

    public void setOverData(String overData) {
        this.overData = overData;
    }
}
