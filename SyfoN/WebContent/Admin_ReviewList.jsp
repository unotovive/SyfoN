<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>評価一覧</title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <meta http-equiv="content-type" charset="utf-8">
</head>
<body>
  <div id="app">
    <div id="pageBody">
      <h1>評価一覧</h1>
      <div id="backTop">
        <a href="Admin_LectureListServlet">
          <span>講義一覧へ戻る</span>
        </a>
      </div>
      <form action="adominLectureList" method="post">
        <div id="bar">
          <p>講義名：{{ lecture.講義名 }}</p>
        </div>
        <div id="lectureTable">
          <!-- <table border="1">
            <tr>
              <th width="100px">投稿者</th>
              <th width="500px">投稿内容</th>
              <th width="50px"></th>
            </tr>
            <tr>
              <td>てすと</td>
              <td>334</td>
              <td>
                <a href="https://www.ayataka.jp/">
                  <span>削除</span>
              </td>
            </tr>
            <tr>
              <td></td>
              <td></td>
              <td>
                <a href="https://www.ayataka.jp/">
                  <span>削除</span>
              </td>
            </tr>
          </table> -->
          <table border="1">
            <tr>
              <th width="100px">投稿者</th>
              <th width="500px">投稿内容</th>
              <th width="50px"></th>
            </tr>
            <tr v-for="item in table">
              <td>{{item.投稿者}}</td>
              <td>{{item.投稿内容}}</td>
              <td>
                <a href="https://www.ayataka.jp/">
                  <span>削除</span>
              </td>
            </tr>
          </table>
        </div>
      </form>
    </div>
  </div>

  <script>
    var app = new Vue({
      el: '#app',
      data: {
        lecture: "",
        table: '',
        test: 'aaa'
      },
      methods: {

      },
      created() {
        const self = this
        console.log("afo")
        this.lecture='<%= session.getAttribute("lectureList")%>'
		this.lecture=JSON.parse(this.lecture)
		this.table=this.lecture.投稿
		this.lecture=this.lecture.講義
		console.log(this.lecture)


//         axios
//           .get('https://api.myjson.com/bins/twgy6')
//           .then(function (res) {
//             self.table = res.data.講義.投稿;
//             console.log(self.table)
//           })
//         axios
//           .get('https://api.myjson.com/bins/twgy6')
//           .then(function (res) {
//             self.lecture = res.data.講義;
//             console.log(self.lecture)
//           })
      }
    })
  </script>
  <style>
    table th {
      color: #FF9800;
      background: #fff5e5;
    }

    h3 {
      margin-left: 20px;
      float: left;
    }

    #backTop {
      /* margin-top: 20px; */
      margin-right: 20px;
      float: right;
    }

    #createLecture {
      margin-left: 480px;
    }

    #inputtable {
      margin: auto;
    }

    #pageBody {
      width: 600px;
      border-radius: 15px 15px 15px 15px;
      margin: auto;
      /* background: #fff5e5; */
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