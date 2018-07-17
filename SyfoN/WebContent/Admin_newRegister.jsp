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
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<meta http-equiv="content-type" charset="utf-8">
</head>
<body>
	<div id="app">
		<div id="pageBody">
			<h2>管理者用講義情報入力画面</h2>
			<h3>講義情報を入力してください</h3>
			<div id="cancel">
				<a href="Admin_LectureListServlet"> <span>キャンセル</span>
				</a>
			</div>
			<form action="AdminLectureRegisterServlet" method="post" name="Admin_LectureEditServlet">
				<div id="lectureTable">
					<table id="inputtable">
						<tr>
							<td width="100px">授業コード</td>
							<td width="100px"><input id="inputformSmall" type="text"
								v-model="table.授業コード"></td>
						</tr>
						<tr>
							<td>授業名</td>
							<td><input id="inputformSmall" type="text"
								v-model="table.授業名"></td>
						</tr>
						<tr>
							<td>担当教員</td>
							<td>
							<select id="inputformSmall" required name="teacher" v-model="table.教員">
									<option v-for="teacher in teacherTable" value="teacherTable[teacher]">{{teacher.名前}}</option>
							</select></td>
						</tr>
						<tr>
							<td>該当学期</td>
							<td>
								<select id="inputformSmall" name="kaikoki" v-model="table.該当学期">
										<option value="">学期を選択してください</option>
										<option value="1年生前期">1年生前期</option>
										<option value="1年生後期">1年生後期</option>
										<option value="2年生前期">2年生前期</option>
										<option value="2年生後期">2年生後期</option>
										<option value="3年生前期">3年生前期</option>
										<option value="3年生後期">3年生後期</option>
										<option value="4年生前期">4年生前期</option>
										<option value="4年生後期">4年生後期</option>
								</select>
							</label
							></td>
						</tr>
						<tr>
							<td>曜日</td>
							<td>
								<select id="inputformSmall" name="kaikoki" v-model="table.曜日">
										<option value="">曜日を選択してください</option>
										<option value="月">月</option>
										<option value="火">火</option>
										<option value="wednesday">水</option>
										<option value="thursday">木</option>
										<option value="fryday">金</option>
								</select>
							</label>

							</td>
						</tr>
						<tr>
							<td>時限</td>
							<td>
							<input id="inputformSmall" type="text"
								v-model="table.時限">
							</td>
						</tr>
						<tr>
							<td>教室番号</td>
							<td><input id="inputformSmall" type="text"
								v-model="table.教室番号"></td>
						</tr>
						<tr>
							<td>単位数</td>
							<td><input id="inputformSmall" type="text"
								v-model="table.単位数"></td>
						</tr>
						<tr>
							<td>目的概要</td>
							<td><textarea id="inputformLarge" v-model="table.目的概要"
									rows="3" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>達成目標</td>
							<td><textarea id="inputformLarge" v-model="table.達成目標"
									rows="3" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>関連科目</td>
							<td><textarea id="inputformLarge" v-model="table.関連科目"
									rows="3" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>履修条件</td>
							<td><textarea id="inputformLarge" v-model="table.履修条件"
									rows="3" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>教科書名</td>
							<td><input id="inputformSmall" type="text"
								v-model="table.教科書名"></td>
						</tr>
						<tr>
							<td>評価方法</td>
							<td><input id="inputformSmall" type="text"
								v-model="table.評価方法"></td>
						</tr>
						<tr>
							<td>学習・教育目標との対応</td>
							<td><textarea id="inputformLarge" v-model="table.教育目標との対応"
									rows="3" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>事前・事後学習</td>
							<td><textarea id="inputformLarge" v-model="table.事前事後学習"
									rows="3" cols="50"></textarea></td>
						</tr>

						<tr>
							<td>E-Mail address</td>
							<td><input id="inputformSmall" type="text"
								v-model="table.メール"></td>
						</tr>
						<tr>
							<td>質問への対応</td>
							<td><textarea id="inputformLarge" v-model="table.質問"
									rows="3" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>履修上での注意事項</td>
							<td><textarea id="inputformLarge" v-model="table.注意事項"
									rows="3" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>学習上の助言</td>
							<td><textarea id="inputformLarge" v-model="table.助言"
									rows="3" cols="50"></textarea></td>
						</tr>
						<tr>
							<td>該当ユニット</td>
							<td><select id="inputformSmall" name="unit"
								v-model="table.ユニット">
									<option v-for="unit in unitTable" value="unitTable[unit]">{{unit.name}}</option>
							</select></td>
						</tr>
						<tr>
							<td>種類</td>
							<td><select id="inputformSmall" name="type"
								v-model="table.種類">
							</select></td>
						</tr>
					</table>
					<p id="submitButton">
						<input type="submit" value="送信する">
					</p>

				</div>
			</form>
		</div>
	</div>



 //	<%
 // 	Map<String,ArrayList> map3=new HashMap<String,ArrayList>();
 // 	ArrayList<String> type = new ArrayList<String>();
 // 	type.add("必修");
 // 	type.add("英語");
 // 	type.add("人科");
 // 	//type.add("選択科目");
 // 	map3.put("種類",type);
 // 	JSONObject jsonTest3=new JSONObject(map3);
//	session.setAttribute("jsonTest3",jsonTest3);
  //%>



	<script>
        var app = new Vue({
                el: '#app',
                data: {
                    test: 'afo',
                    table: "",
                    teacherTable: '',
                    unitTable: ''
                    },
                methods: {
                },
                mounted() {
                    const self = this
                    console.log("afo")
                    this.table='<%= session.getAttribute("registLecture")%>'
                    this.table=JSON.parse(this.table)
                    console.log(this.table)

                    this.teacherTable='<%= session.getAttribute("professorList")%>'
                    this.teacherTable=JSON.parse(this.teacherTable)
                    console.log(this.teacherTable)

                    this.unitTable='<%= session.getAttribute("unitList")%>'
                    this.unitTable=JSON.parse(this.unitTable)
                    console.log(this.unitTable)
                }
            })
    </script>
	<style scoped>
h3 {
	margin-left: 20px;
	float: left;
}

#cancel {
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

#submitButton {
	text-align: center;
	/* width: 50px;
          height: 30px; */
}
</style>
</body>
</html>