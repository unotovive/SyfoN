package test;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JSON {
    public static void main(String[] args) throws JSONException {
        Element tanni = new Element(
                null,new Element("all",
                                new Element("name","総合"),
                                new Element("num",140)
                            ),
                        new Element("slelect",
                                new Element("name","選択"),
                                new Element("num",50),
                                new Elements("list",
                                        new Element("1","aa"),
                                        new Element("1","bb"),
                                        new Element("1","bb"),
                                        new Element("1","bb"),
                                        new Element("1","ba"),
                                        new Element("1","aab")
                                        )
                            ),
                        new Element("must",
                                new Element("name","選択"),
                                new Element("num",50),
                                new Elements("list",
                                        new Element("1","aa"),
                                        new Element("1","bb"),
                                        new Element("1","bb"),
                                        new Element("1","bb"),
                                        new Element("1","bb"),
                                        new Element("1","bb")
                                        )
                                        )
            );
        JSONObject object = getJSON(tanni);
        System.out.println(object);
    }


    public static JSONObject getJSON(Element data) throws JSONException {
        JSONObject object = new JSONObject();
        ArrayList<Object> e_list = data.getElem();
//        JSONObject subObject = new JSONObject();
        for(Object elem:e_list) {

            if(elem instanceof Elements){
                JSONArray array = new JSONArray();
                for(Element e : ((Elements) elem).getElemList()) {
                    JSONObject subObject = getJSON(e);
                    Object obj = null;
                    if(subObject.has(e.getName())) {
                        obj = subObject.get(e.getName());
                    }else {
                        obj = subObject;
                    }
                    subObject.put(e.getName(), obj);
                    array.put(subObject);
                }
                object.put(((Elements) elem).getName(), array);
            }else if(elem instanceof Element) {
                JSONObject subObject = getJSON((Element)elem);
                Object obj = null;
                if(subObject.has(((Element) elem).getName())) {
                    obj = subObject.get(((Element) elem).getName());
                }else {
                    obj = subObject;
                }
                object.put(((Element) elem).getName(),obj);
            }else{
                object.put(data.getName(), elem);
            }
        }
        return object;
    }
    public static class Elements{
        String name = null;
        ArrayList<Element> data = new ArrayList<Element>();
        public Elements(String name,Element...e_list) {
            this.name = name;
            for(Element e:e_list) {
                data.add(e);
            }
        }
        public String getName() {
            return name;
        }
        public ArrayList<Element> getElemList(){
            return data;
        }
    }

    public static class Element{
        String name =null;
        ArrayList<Object> elem =new ArrayList<Object>();
        public Element(String name,Object... elem) {
            this.name=name;
            for(Object e : elem) {
                this.elem.add(e);
            }
        }
        public String getName() {
            return name;
        }
        public ArrayList<Object> getElem() {
            return elem;
        }
    }


}