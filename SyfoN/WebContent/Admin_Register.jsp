<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登録講義一覧</title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
<div id="app">
      <div id="pageBody">
          <h2>管理者用講義情報入力画面</h2>
          <h3>講義情報を入力してください</h3>
          <div id="cancel">
              <a href="https://www.ayataka.jp/">
                  <span>キャンセル</span>
              </a>
          </div>
          <form action="adminRegister" method="post" name="adminRegister">
              <div id="lectureTable">
                  <table id="inputtable">
                      <tr>
                          <td width="100px">授業コード</td>
                          <td width="100px">
                              <input id="inputformSmall" type="text" name="" value="">
                          </td>
                      </tr>
                      <tr>
                          <td>授業名</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>担当教員</td>
                          <td>
                              <select id="inputformSmall" required name="teacher">
                                  <option value=""></option>
                              </select>

                          </td>
                      </tr>
                      <tr>
                          <td>該当学期</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>曜日</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>時限</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>教室番号</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>単位数</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>目的概要</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>

                          </td>
                      </tr>
                      <tr>
                          <td>達成目標</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>関連科目</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>履修条件</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>教科書名</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>評価方法</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>学習・教育目標との対応</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>事前・事後学習</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>
                          </td>
                      </tr>

                      <tr>
                          <td>E-Mail address</td>
                          <td>
                              <input id="inputformSmall" type="text" name="" value="">

                          </td>
                      </tr>
                      <tr>
                          <td>質問への対応</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>履修上での注意事項</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>学習上の助言</td>
                          <td>
                              <textarea id="inputformLarge" name="" value="" rows="3" cols="50"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>該当ユニット</td>
                          <td>
                              <select id="inputformSmall" required name="unit">
                                  <option value=""></option>
                              </select>

                          </td>
                      </tr>
                      <tr>
                          <td>種類</td>
                          <td>
                              <select id="inputformSmall" required name="type">
                                  <option value=""></option>
                              </select>

                          </td>
                      </tr>
                  </table>
                  <p id="submitButton"><input  type="submit"  value="送信する"></p>

              </div>
          </form>
      </div>
  </div>

  <%
  	Map<String,ArrayList> map=new HashMap<String,ArrayList>();
  	ArrayList<String> teachers = new ArrayList<String>();
  	teachers.add("柿崎");
  	teachers.add("中島");
  	teachers.add("増田");
  	map.put("教員",teachers);
  	JSONObject jsonTest=new JSONObject(map);
	session.setAttribute("jsonTest",jsonTest);
  %>

  <%
  	Map<String,ArrayList> map2=new HashMap<String,ArrayList>();
  	ArrayList<String> unit = new ArrayList<String>();
  	unit.add("CG");
  	unit.add("VS");
  	unit.add("MI");
  	unit.add("WI");
  	unit.add("SN");
  	unit.add("ST");
  	map2.put("ユニット",unit);
  	JSONObject jsonTest2=new JSONObject(map2);
	session.setAttribute("jsonTest2",jsonTest2);
  %>

  <%
  	Map<String,ArrayList> map3=new HashMap<String,ArrayList>();
  	ArrayList<String> type = new ArrayList<String>();
  	type.add("必修");
  	type.add("英語");
  	type.add("人間科目");
  	type.add("選択科目");
  	map3.put("種類",type);
  	JSONObject jsonTest3=new JSONObject(map3);
	session.setAttribute("jsonTest3",jsonTest3);
  %>

  <script>
  //var selectTeacher = document.forms.adominRegister.teacher;
  //selectTeacher.options.lenght = 0;
  	var jsonTest='<%= session.getAttribute("jsonTest")%>';
  	jsonTest=JSON.parse(jsonTest);
  	var keys = Object.keys(jsonTest);
	console.log(Object.keys(jsonTest));
	document.forms.adminRegister.teacher.options[0] = new Option("");
	for(var i = 0; i < Object.keys(jsonTest.教員).length; i++){
		document.forms.adminRegister.teacher.options[i+1] = new Option(jsonTest.教員[i]);
	}
  </script>

  <script>
  //var selectTeacher = document.forms.adominRegister.teacher;
  //selectTeacher.options.lenght = 0;
  	var jsonTest2='<%= session.getAttribute("jsonTest2")%>';
  	jsonTest2=JSON.parse(jsonTest2);
  	var keys = Object.keys(jsonTest2);
	console.log(Object.keys(jsonTest2));
	document.forms.adminRegister.unit.options[0] = new Option("");
	for(var i = 0; i < Object.keys(jsonTest2.ユニット).length; i++){
		document.forms.adminRegister.unit.options[i+1] = new Option(jsonTest2.ユニット[i]);
	}
  </script>

  <script>
  //var selectTeacher = document.forms.adominRegister.teacher;
  //selectTeacher.options.lenght = 0;
  	var jsonTest3='<%= session.getAttribute("jsonTest3")%>';
  	jsonTest3=JSON.parse(jsonTest3);
  	var keys = Object.keys(jsonTest3);
	console.log(Object.keys(jsonTest3));
	document.forms.adminRegister.type.options[0] = new Option("");
	for(var i = 0; i < Object.keys(jsonTest3.種類).length; i++){
		document.forms.adminRegister.type.options[i+1] = new Option(jsonTest3.種類[i]);
	}
  </script>

  <script>
    var app = new Vue({
      el: '#app',
      data: {
        greeting: 'Welcome to your Vue.js app!',
        docsURL: 'http://vuejs.org/guide/',
        discordURL: 'https://chat.vuejs.org',
        forumURL: 'http://forum.vuejs.org/'
      },
      methods: {
        humanizeURL: function (url) {
          return url
            .replace(/^https?:\/\//, '')
            .replace(/\/$/, '')
        }
      }
    })
  </script>
  <style scoped>
      h3{
            margin-left: 20px;
            float: left;
        }
        #cancel{
            margin-top: 20px;
            margin-right: 20px;
            float: right;
        }

      #inputtable {
          margin: auto;
      }

      #pageBody {
          width: 600px;
          border-radius: 15px 15px 15px 15px;
          margin: auto;
          background: #fff5e5;
      }

      h2 {
          border-radius: 15px 15px 0px 0px;
          text-align: center;
          background: #BDBDBD;

      }

      #inputformSmall {
          width: 355px;
          border-radius: 5px 5px 5px 5px;
          border: 0.5px #BDBDBD inset;
          /* outline: 1; */
          /* border: 2px; */
          /* border-bottom:1px dotted #333;  */
          /* background: #fff5e5; */
      }

      #inputformLarge {
          width: 350px;
          border: 0.5px #BDBDBD inset;
          /* word-break: break-word; */
          border-radius: 5px 5px 5px 5px;
      }
      #submitButton{
          text-align: center;
          /* width: 50px;
          height: 30px; */
      }
  </style>
</body>
</html>