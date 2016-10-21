package net.entity;

import org.springframework.stereotype.Component;

@Component
public class Connection {

    private int connectionId;
    private int questionId;
    private int questionnaireId;

    public int getConnectionId() {
        return connectionId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getQuestionnaireId() {
        return questionnaireId;
    }

    public void setQuestionnaireId(int questionnaireId) {
        this.questionnaireId = questionnaireId;
    }

    public void setConnectionId(int connectionId) {
        this.connectionId = connectionId;
    }
}
