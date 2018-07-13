<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="test.*" %>
    <%@ page import= "org.json.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>SyfoN</title>
  <script src="https://unpkg.com/vue"></script>
  <meta http-equiv="content-type" charset="utf-8">
</head>
<body>
  <div id="app">
    <div class="bodya">
      <div class="wrapper">
          <div class="container">
          <%
          System.out.println(session.getAttribute("jsonTest"));
          %>
          <script>

	        var jsonTest='<%= session.getAttribute("jsonTest") %>';

	        if(jsonTest != null){
				jsonTest=JSON.parse(jsonTest);
          		document.write(jsonTest.elem.all);
          	}
          </script>
              <h1>Welcome</h1>
              <h2>SyfoN-ログイン</h2>

              <form class="form" action="Login" method="POST" >
                  <input type="text"  name="studentID" placeholder="学籍番号" v-model="studentNo">
                  <input type="password" name="pass" placeholder="パスワード" v-model="pass">
                  <button type="submit" id="login-button" >ログイン</button>
                  <a @click="">新規登録</a>
              </form>
          </div>
          <ul class="bg-bubbles">
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
              <li></li>
          </ul>
      </div>
    </div>
  </div>

  <script>
    var app = new Vue({
      el: '#app',
      data: {
        studentNo: '',
        pass: '',
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
    @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-weight: 300;
    }
    h2{
        font-size: 1.3em;
    }
    .bodya {
      font-family: 'Source Sans Pro','Rounded Mplus 1c', sans-serif;
      color: white;
      font-weight: 300;
    }
    .bodya ::-webkit-input-placeholder {
      /* WebKit browsers */
      font-family: 'Source Sans Pro','Rounded Mplus 1c',sans-serif;
      color: white;
      font-weight: 300;
    }
    .bodya :-moz-placeholder {
      /* Mozilla Firefox 4 to 18 */
      font-family: 'Source Sans Pro','Rounded Mplus 1c', sans-serif;
      color: white;
      opacity: 1;
      font-weight: 300;
    }
    .bodya ::-moz-placeholder {
      /* Mozilla Firefox 19+ */
      font-family: 'Source Sans Pro','Rounded Mplus 1c', sans-serif;
      color: white;
      opacity: 1;
      font-weight: 300;
    }
    .bodya :-ms-input-placeholder {
      /* Internet Explorer 10+ */
      font-family: 'Source Sans Pro','Rounded Mplus 1c', sans-serif;
      color: white;
      font-weight: 300;
    }
    .wrapper {
      background: #86A8E7;
      background: linear-gradient(to bottom right, #7F7FD5 0%,#86A8E7 50%, #91EAE4 100%);
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100vh;
      overflow: hidden;
    }
    .wrapper.form-success .container h1 {
      -webkit-transform: translateY(85px);
              transform: translateY(85px);
    }
    .container {
      max-width: 600px;
      margin: 100px auto;
      padding: 80px 0;
      height: 400px;
      text-align: center;
    }
    .container h1 {
      font-size: 40px;
      transition-duration: 1s;
      transition-timing-function: ease-in-put;
      font-weight: 200;
    }
    a{
        font-size:1.1em;
        text-decoration: underline;
        cursor: pointer;
        transition: 0.1s;
    }
    a:hover{
        color:#ffa751;
    }
    form {
      padding: 20px 0;
      position: relative;
      z-index: 2;
    }
    form input {
      -webkit-appearance: none;
         -moz-appearance: none;
              appearance: none;
      outline: 0;
      border: 1px solid rgba(255, 255, 255, 0.4);
      background-color: rgba(255, 255, 255, 0.2);
      width: 250px;
      border-radius: 3px;
      padding: 10px 15px;
      margin: 0 auto 10px auto;
      display: block;
      text-align: center;
      font-size: 18px;
      color: white;
      transition-duration: 0.25s;
      font-weight: 300;
    }
    form input:hover {
      background-color: rgba(255, 255, 255, 0.4);
    }
    form input:focus {
      background-color: white;
      width: 300px;
      color: #7F7FD5;
    }
    form button {
      -webkit-appearance: none;
         -moz-appearance: none;
              appearance: none;
      outline: 0;
      background-color: white;
      border: 0;
      padding: 10px 15px;
      color: #7F7FD5;
      border-radius: 3px;
      width: 250px;
      cursor: pointer;
      font-size: 18px;
      transition-duration: 0.25s;
      display: block;
      margin: 0 auto 10px auto;
    }
    form button:hover {
      background-color: #f0f2f4;
    }
    .bg-bubbles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 1;
    }
    .bg-bubbles li {
      position: absolute;
      list-style: none;
      display: block;
      width: 40px;
      height: 40px;
      background-color: rgba(255, 255, 255, 0.15);
      bottom: -160px;
      -webkit-animation: square 25s infinite;
      animation: square 25s infinite;
      transition-timing-function: linear;
    }
    .bg-bubbles li:nth-child(1) {
      left: 10%;
    }
    .bg-bubbles li:nth-child(2) {
      left: 20%;
      width: 80px;
      height: 80px;
      -webkit-animation-delay: 2s;
              animation-delay: 2s;
      -webkit-animation-duration: 17s;
              animation-duration: 17s;
    }
    .bg-bubbles li:nth-child(3) {
      left: 25%;
      -webkit-animation-delay: 4s;
              animation-delay: 4s;
    }
    .bg-bubbles li:nth-child(4) {
      left: 40%;
      width: 60px;
      height: 60px;
      -webkit-animation-duration: 22s;
              animation-duration: 22s;
      background-color: rgba(255, 255, 255, 0.25);
    }
    .bg-bubbles li:nth-child(5) {
      left: 70%;
    }
    .bg-bubbles li:nth-child(6) {
      left: 80%;
      width: 120px;
      height: 120px;
      -webkit-animation-delay: 3s;
              animation-delay: 3s;
      background-color: rgba(255, 255, 255, 0.2);
    }
    .bg-bubbles li:nth-child(7) {
      left: 32%;
      width: 160px;
      height: 160px;
      -webkit-animation-delay: 7s;
              animation-delay: 7s;
    }
    .bg-bubbles li:nth-child(8) {
      left: 55%;
      width: 20px;
      height: 20px;
      -webkit-animation-delay: 15s;
              animation-delay: 15s;
      -webkit-animation-duration: 40s;
              animation-duration: 40s;
    }
    .bg-bubbles li:nth-child(9) {
      left: 25%;
      width: 10px;
      height: 10px;
      -webkit-animation-delay: 2s;
              animation-delay: 2s;
      -webkit-animation-duration: 40s;
              animation-duration: 40s;
      background-color: rgba(255, 255, 255, 0.3);
    }
    .bg-bubbles li:nth-child(10) {
      left: 90%;
      width: 160px;
      height: 160px;
      -webkit-animation-delay: 11s;
              animation-delay: 11s;
    }
    @-webkit-keyframes square {
      0% {
        -webkit-transform: translateY(0);
                transform: translateY(0);
      }
      100% {
        -webkit-transform: translateY(-700px) rotate(600deg);
                transform: translateY(-700px) rotate(600deg);
      }
    }
    @keyframes square {
      0% {
        -webkit-transform: translateY(0);
                transform: translateY(0);
      }
      100% {
        -webkit-transform: translateY(-700px) rotate(600deg);
                transform: translateY(-700px) rotate(600deg);
      }
    }
    </style>
</body>
</html>
