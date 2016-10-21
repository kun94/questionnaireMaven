import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import net.entity.Manager;

import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

public class GsonTest {


    public static void main(String[] args) {

        String[] a = {"a", "cdd", "de"};
        String b = "{ \"name\" : \"zhao\", \"ming\" : \"kun\" }";
        //ArrayList
        String c = "[ { \"name\" : \"zhao\", \"ming\" : \"kun\" }, { \"name\" : \"zhao\", \"ming\" : \"kun\" } ]";
        //Map
        String d = "[ [ \"people1\", { \"name\" : \"zhao\", \"ming\" : \"kun\" }], [ \"people2\", { \"name\" : \"zhao\", \"ming\" : \"kun\" }] ]";
        String e = "[ { \"people\": { \"name\" : \"zhao\", \"ming\" : \"kun\" }}, { \"people\": { \"name\" : \"zhao\", \"ming\" : \"kun\" }} ]";
        String f = "{ \"peopleq\": { \"name\" : \"zhao\", \"ming\" : \"kun\" }";
//        Gson gson = new Gson();
//        Gson gson = new GsonBuilder().enableComplexMapKeySerialization().create();
//        System.out.println(gson.toJson(a));
//        People people = gson.fromJson(b, People.class);
//        String str = gson.toJson(people);
////        System.out.println(str);
//        Type type = new TypeToken<Map<String, People>>() {
//        }.getType();
////        Type type = new TypeToken<List<People>>() {
////        }.getType();
//        Map<String, People> peopleMap = gson.fromJson(d, type);
////        List<People> peopleList = gson.fromJson(c, type);
////        System.out.println(peopleList.get(0).getName());
//        System.out.println(peopleMap.get("people1").getName());
////        System.out.println(people.name);
//        System.out.println(gson.toJson(b));

        Gson gson = new Gson();

        Type type = new TypeToken<List<Peopleq>>() {
                    }.getType();
        Peopleq peopleq = gson.fromJson(e, Peopleq.class);
//        List<Peopleq> peopleqList = gson.fromJson(e, type);
        System.out.println(peopleq.toString());

    }


    private static class Peopleq implements java.lang.reflect.Type {

        private People people;

        public People getPeople() {
            return people;
        }

        public void setPeople(People people) {
            this.people = people;
        }
    }
    private static class People implements java.lang.reflect.Type {

        private String name;
        private String ming;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getMing() {
            return ming;
        }

        public void setMing(String ming) {
            this.ming = ming;
        }
    }
}
