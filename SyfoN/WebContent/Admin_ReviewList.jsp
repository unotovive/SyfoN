<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Vue</title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <div id="pageBody">
      <h1>評価一覧</h1>
      <div id="backTop">
        <a href="https://www.ayataka.jp/">
          <span>講義一覧へ戻る</span>
        </a>
      </div>
      <form action="adominLectureList" method="post">
        <div id="bar">
          <p>講義名：{{ lectureName }}</p>
        </div>
        <div id="lectureTable">
          <table border="1">
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
          </table>
        </div>
      </form>
    </div>
  </div>

  <script>
    var app = new Vue({
      el: '#app',
      data: {
        lectureName: 'aaa'
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