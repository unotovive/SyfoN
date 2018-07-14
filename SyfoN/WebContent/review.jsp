<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>評価を作成</title>
  <script src="https://unpkg.com/vue"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <meta http-equiv="content-type" charset="utf-8">
</head>

<body>
  <div id="app">
    <h1>評価を作成</h1>
    <h2>{{table.曜日}}{{table.時限}} {{table.講義名}}</h2>
    <table>
      <tr>
        <td>総合</td>
        <td>
            <input  type="text" v-model="table.総合">
        </td>
      </tr>
      <tr>
        <td>数学</td>
        <td>
            <input  type="text" v-model="table.数学">
        </td>
      </tr>
      <tr>
        <td>program</td>
        <td>
            <input  type="text" v-model="table.program">
        </td>
      </tr>
      <tr>
        <td>教授</td>
        <td>
            <input  type="text" v-model="table.教授">
        </td>
      </tr>
      <tr>
        <td>出席</td>
        <td>
            <input  type="text" v-model="table.出席">
        </td>
      </tr>
      <tr>
        <td>グループワーク</td>
        <td><input  type="text" v-model="table.グループワーク"></td>
      </tr>

    </table>

    <h2>コメント</h2>
    <span><textarea v-model="table.コメント" placeholder="add multiple lines"></textarea></span>
    <input type="submit" value = "評価する">
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
          .get('https://api.myjson.com/bins/tdezq')
          .then(function (res) {
            self.table = res.data.review;
            console.log(self.table)
          })
      }
    })
  </script>
  <style　scope>
  </style>
</body>

</html>