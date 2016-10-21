import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import net.entity.Answer;

import java.util.List;

public class Test {

    public static void main(String[] args) {

        String a = "[{\"answer1\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\",\"undefined\":\"1\"},{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\",\"undefined\":\"1\"},{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\"},{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\",\"undefined\":\"1\"},{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\",\"undefined\":\"1\"},{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\",\"undefined\":\"1\"},{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\"},{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\",\"undefined\":\"1\"},{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\"}]";

        Gson gson = new Gson();
        List<Answer> answerList = gson.fromJson(a, new TypeToken<List<Answer>>() {
        }.getType());
        System.out.println(answerList.get(0).getAnswer1());

    }

}
