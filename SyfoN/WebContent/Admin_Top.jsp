<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<title>管理者機能</title>
</head>
<body>
  <div id="app">
    <div id="pageBody">
      <div class="head">
        <p>管理者機能</p>
      </div>
      <div class="logout">
        <p>ログアウト</p>
      </div>
      <div class="list">
        <p>講義一覧</p>
      </div>
    </div>
  </div>

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
    #pageBody {
      width: 400px;
      height: 400px;
      border-radius: 15px 15px 15px 15px;
      margin: auto;
      background: #fff5e5;
      display: block;
    }
    .head{
      float: left;
      padding: 30px;
    }
    .logout{
      float:right;
      padding: 30px;
    }
    .list{
      clear: both;
      padding: 30px;
      text-align: center;
    }
  </style>
</body>

</html>