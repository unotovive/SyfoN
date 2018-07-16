<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <h1>登録講義一覧</h1>
      <div id="backTop">
            <span>TOPへ戻る</span>
          </a>
        </div>
      <div id="bar">
        <p>管理者さんの登録している講義一覧</p>
      </div>

      <div id="createLecture">
          <span>講義の新規登録</span>
        </a>
      </div>
      <form action="adominLectureList" method="post">
        <div id="lectureTable">
          <table border="1">
            <tr>
              <th width="100px">開講曜日</th>
              <th width="100px">授業コード</th>
              <th width="150px">講義名（評価一覧）</th>
              <th width="100px">教員氏名</th>
              <th width="100px">教室</th>
              <th width="50px"></th>
              <th width="50px"></th>
            </tr>
            <tr v-for="item in table">
              <td>{{item.開講曜日}}</td>
              <td>{{item.授業コード}}</td>
              <td>{{item.講義名}}</td>
              <td>{{item.教員名}}</td>
              <td>{{item.教室}}</td>
              <td>
                  <span>変更</span>
              </td>
              <td>
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
        table: '',
        test: 'aaa'
      },
      methods: {

      },
      mounted(){
    	  const self=this
    	  this.table='<%= session.getAttribute("lectureList")%>'
    	  console.log(this.table)
    	  this.table=JSON.parse(this.table)
    	  this.table=this.table.lectureList
    	  console.log(this.table)
      }
//       created() {
//         const self = this
//         console.log("afo")
//         axios
//           .get('https://api.myjson.com/bins/19mbbi')
//           .then(function (res) {
//             self.table = res.data.lectureList;
//             console.log(self.table)
//           })
//       }
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
    #createLecture{
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