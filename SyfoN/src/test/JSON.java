package test;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JSON {
    public static void main(String[] args) throws JSONException {
        Element tanni = new Element(
                "elem",new Elements(
                        new Element("all",new Elements(
                                new Element("name","総合"),
                                new Element("num",140)
                            )
                        ),
                        new Element("slelect",new Elements(
                                new Element("name","選択"),
                                new Element("num",50)
                        )
                    )
                )
            );
        JSONObject object = getSubJSON(tanni);
        System.out.println(object);
    }


    public static JSONObject getSubJSON(Element data) throws JSONException {
        JSONObject object = new JSONObject();
        if(data.getElem() instanceof Elements ) {
            JSONArray array = new JSONArray();
            for(Element e : ((Elements)(data.getElem())).getElemList()) {
                array.put(getSubJSON(e));
            }
            object.put(data.getName(),array);
        }else {
            System.out.println(data.getName());
            object.put(data.getName(), data.getElem());
        }
        return object;
    }
    public static class Elements{
        ArrayList<Element> data = new ArrayList<Element>();
        public Elements(Element...e_list) {
            for(Element e:e_list) {
                data.add(e);
            }
        }
        public ArrayList<Element> getElemList(){
            return data;
        }
    }

    public static class Element{
        String name =null;
        Object elem =null;
        public Element(String name,Object elem) {
            this.name=name;
            this.elem=elem;
        }
        public String getName() {
            return name;
        }
        public void setName(String name) {
            this.name = name;
        }
        public Object getElem() {
            return elem;
        }
        public void setElem(Object elem) {
            this.elem = elem;
        }
    }
}