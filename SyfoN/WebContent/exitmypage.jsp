<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>マイページ・設定</title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <meta http-equiv="content-type" charset="utf-8">
</head>

<body>
  <div id="app">
    <h1>マイページ・設定</h1>
    <h2>学籍番号　{{table.学籍番号}}</h2>
    <table>
      <tr>
        <td>ニックネーム</td>
        <td>
            <input  type="text" v-model="table.ニックネーム">
        </td>
      </tr>
      <tr>
        <td>性別</td>
        <td>
            <input  type="text" v-model="table.現在の学年">
        </td>
      </tr>
      <tr>
        <td>メールアドレス</td>
        <td>
            <input  type="text" v-model="table.メールアドレス">
        </td>
      </tr>
      <tr>
        <td>パスワード</td>
        <td>
            <input  type="password" v-model="table.パスワード">
        </td>
      </tr>


    </table>

    <input type="submit" value = "確定する">
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
      created() {
        const self = this
        console.log("afo")
        axios
          .get('https://api.myjson.com/bins/19kn4u')
          .then(function (res) {
            self.table = res.data.student;
            console.log(self.table)
          })
      }
    })
  </script>
  <style　scope>
  </style>
</body>

</html>