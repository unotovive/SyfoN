<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <title>SyfoN</title>
        <link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
      crossorigin="anonymous">
        <script src="https://unpkg.com/vue"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <meta http-equiv="content-type" charset="utf-8">
    </head>

    <body>
        <div id="app">
            <div id="bar">
                <h1>SyfoN</h1>
            </div>
            <input type="checkbox" class="check" id="checked">
            <label class="menu-btn" for="checked">
                <span class="bar top"></span>
                <span class="bar middle"></span>
                <span class="bar bottom"></span>
            </label>
            <label class="close-menu" for="checked"></label>
            <nav class="drawer-menu">
                <ul>
                    <li>
                        <a href="#">トップページ</a>
                    </li>
                    <li>
                        <a href="#">講義一覧</a>
                    </li>
                    <li>
                        <a href="#">マイページ</a>
                    </li>
                    <li>
                        <a href="#">ログアウト</a>
                    </li>
                </ul>
            </nav>
            <div id="mcontent">
                <div id="sirabas">
                    <h2>シラバス情報</h2>
                    <div class="arl">
                    <i class="far fa-circle"></i>
                    <i class="far fa-check-circle"></i>
                    <p>履修済み</p>
                    </div>
                    <div class="datas">
                    <table class="data2">
                        <tbody>
                            <tr>
                                <th class="arrow_box">授業名
                                </th>
                                <td>{{clas.name}}</td>
                            </tr>


                            <tr>
                                <th class="arrow_box">開講学期
                                </th>
                                <td>{{clas.gaitogakki}}</td>
                            </tr>

                            <tr>
                                <th class="arrow_box">教室番号
                                </th>
                                <td>{{clas.room}}</td>
                            </tr>

                        </tbody>
                    </table>
                    <table class="data2">
                            <tbody>

                                <tr>
                                    <th class="arrow_box">担当教員
                                    </th>
                                    <td>{{clas.professorname}}</td>
                                </tr>


                                <tr>
                                    <th class="arrow_box">曜日時限
                                    </th>
                                    <td>{{clas.period}}</td>
                                </tr>

                                <tr>
                                    <th class="arrow_box">単位数
                                    </th>
                                    <td>{{clas.taninum}}</td>
                                </tr>
                            </tbody>
                        </table>
                    <table class="data">
                        <tbody>
                            <tr>
                                <th class="arrow_box">目的
                                </th>
                                <td>{{clas.purpose}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">達成目標
                                </th>
                                <td>{{clas.achieve}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">関連科目
                                </th>
                                <td>{{clas.relation}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">履修条件
                                </th>
                                <td>{{clas.term}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">教科書名
                                </th>
                                <td>{{clas.textbook}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">評価方法
                                </th>
                                <td>{{clas.hyokahoho}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">教育目標との対応
                                </th>
                                <td>{{clas.kyoikumokuhyo}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">事前・事後学習
                                </th>
                                <td>{{clas.yosyuhukusyu}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">E-mail
                                </th>
                                <td>{{clas.email}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">質問対応
                                </th>
                                <td>{{clas.support}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">履修注意事項
                                </th>
                                <td>{{clas.caution}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">学習上の助言
                                </th>
                                <td>{{clas.advice}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">該当ユニット
                                </th>
                                <td>{{clas.unit}}</td>
                            </tr>
                            <tr>
                                <th class="arrow_box">種別
                                </th>
                                <td>{{clas.type}}</td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                </div>

                <div id="hyoka">
                    <div class="h20">
                        <h2 class="wb">講義評価情報</h2>
                        <button>評価作成 / 編集</button>
                    </div>
                    <div class="h80">
                        <div class="box">
                            <h3>総合</h3>
                            <div class="star-rating">
                                <div class="star-rating-front" id="sogo">★★★★★</div>
                                <div class="star-rating-back">★★★★★</div>
                            </div>
                            <h3>数学</h3>
                            <div class="star-rating">
                                <div class="star-rating-front" id="math">★★★★★</div>
                                <div class="star-rating-back">★★★★★</div>
                            </div>
                            <h3>プログラミング</h3>
                            <div class="star-rating">
                                <div class="star-rating-front" id="prog">★★★★★</div>
                                <div class="star-rating-back">★★★★★</div>
                            </div>
                            <h3>教授</h3>
                            <div class="star-rating">
                                <div class="star-rating-front" id="pers">★★★★★</div>
                                <div class="star-rating-back">★★★★★</div>
                            </div>
                            <h3>出席</h3>
                            <div class="star-rating">
                                <div class="star-rating-front" id="atte">★★★★★</div>
                                <div class="star-rating-back">★★★★★</div>
                            </div>
                            <h3>グループワーク</h3>
                            <p>{{rev.group}}</p>
                        </div>
                        <div class="box">
                            <h3>みんなのコメント</h3>
                            <div class="coment">
                                <p v-for="coment in comments">{{coment.name}}:{{coment.coment}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var app = new Vue({
                el: '#app',
                data: {
                    clas: '',
                    rev: { group: "あり" },
                    comments:'',
//                     comments: {
//                         "come1": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come2": {
//                             "name": "奥西",
//                             coment: "８かいしました"
//                         },
//                         "come3": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come4": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come5": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come6": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come7": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come8": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come9": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come10": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come11": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come12": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come13": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come14": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come15": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come16": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come17": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come18": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come19": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come20": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         },
//                         "come21": {
//                             "coment": "うんこ",
//                             "name": "あやたか"
//                         }
//                     }

                },
                methods: {

                },
                mounted() {
                    var sogo = document.getElementById('sogo');
                    var math = document.getElementById('math');
                    var prog = document.getElementById('prog');
                    var pers = document.getElementById('pers');
                    var atte = document.getElementById('atte');
                    sogo.style.width = "100%";
                    math.style.width = "75%";
                    prog.style.width = "50%";
                    pers.style.width = "20%";
                    atte.style.width = "0%";

                    const self=this
                    console.log("hello")
                    this.clas= '<%= session.getAttribute("lectureInfo") %>'
                    console.log(this.clas)
                    this.clas=JSON.parse(this.clas)
                    this.clas=this.clas.lectureInfo
                    console.log(this.clas)

                    this.comments='<%= session.getAttribute("reviewJson") %>'
                    this.comments= JSON.parse(this.comments)
                    this.comments=this.comments.reviews
                    console.log(this.comments)

                },
//                created() {
//                     const self = this
//                     console.log("hello")
//                     axios
//                         .get('https://api.myjson.com/bins/1by2li')
//                         .then(function (res) {
//                             self.table = res.data.classes;
//                             self.units = res.data.units;
//                             self.needs = res.data.needs
//                             console.log(self.table)
//                         })

//                 }
            })
        </script>
        <style scoped>
            @import url('https://fonts.googleapis.com/css?family=Gruppo|Handlee|Itim|Jura|Life+Savers:700|Nothing+You+Could+Do|Short+Stack');
            /*デザインテンプレート的なもの、カードの追加は背景白とシャドウをいい感じに入れればあとは何でもOK説*/
            .datas{
                display: inline-block;
                margin:0;
                width: 100%;
                background: #FFF;
                vertical-align: top;
                height: 84%;
                overflow: auto;
            }
            table.data {
                width: 90%;
                margin: 0 auto;
                border-collapse: separate;
                border-spacing: 0px 5px;
                font-size: .9em;
            }

            table.data th,
            table.data td {
                padding: 10px;
            }

            table.data th {
                background: #295890;
                vertical-align: middle;
                text-align: left;
                width: 20%;
                overflow: visible;
                position: relative;
                color: #fff;
                font-weight: normal;
                font-size: 15px;
            }

            table.data th:after {
                left: 100%;
                top: 50%;
                border: solid transparent;
                content: "";
                height: 0;
                width: 0;
                position: absolute;
                pointer-events: none;
                border-color: rgba(136, 183, 213, 0);
                border-left-color: #295890;
                border-width: 10px;
                margin-top: -10px;
            }
            table.data td{
                background: #EEE;
                width: 360px;
                padding-left: 20px;
            }
            table.data2 {
                width: 42.3%;
                margin: 0 auto;
                border-collapse: separate;
                border-spacing: 0px 5px;
                font-size: .9em;
                display: inline-block;
                margin-left:5%;
            }
            table.data2 th,
            table.data2 td {
                padding: 10px;
            }

            table.data2 th {
                background: #295890;
                vertical-align: middle;
                text-align: left;
                width: 30%;
                overflow: visible;
                position: relative;
                color: #fff;
                font-weight: normal;
                font-size: 15px;
            }
            table.data2 td{
                background: #EEE;
                width: 360px;
                padding-left: 20px;
            }
            table.data2 th:after {
                left: 100%;
                top: 50%;
                border: solid transparent;
                content: " ";
                height: 0;
                width: 0;
                position: absolute;
                pointer-events: none;
                border-color: rgba(136, 183, 213, 0);
                border-left-color: #295890;
                border-width: 10px;
                margin-top: -10px;
            }

            /* firefox */

            @-moz-document url-prefix() {
                table.data th::after {
                    float: right;
                    padding: 0;
                    left: 30px;
                    top: 10px;
                    content: " ";
                    height: 0;
                    width: 0;
                    position: relative;
                    pointer-events: none;
                    border: 10px solid transparent;
                    border-left: #295890 10px solid;
                    margin-top: -10px;
                }
            }





            ::-webkit-scrollbar {
                width: 10px;
            }

            ::-webkit-scrollbar-track {
                background: #fff;
                border-left: solid 1px #ececec;
                border-radius: 10px;
            }

            ::-webkit-scrollbar-thumb {
                background: #ccc;
                border-radius: 10px;
                box-shadow: inset 0 0 0 2px #fff;
            }

            #app {
                width: 100vw;
                height: 100vh;
                background: #f3f3f3;
                margin: 0px;
                padding: 0;
                position: absolute;
                top: 0;
                left: 0;
                font-family: "Rounded Mplus 1c", sans-serif;

                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                -o-box-sizing: border-box;
                -ms-box-sizing: border-box;
                box-sizing: border-box;


            }

            #bar {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                margin: 0;
                padding: 0;
                background: #4568DC;
                background: -moz-linear-gradient(left, #4568DC, #B06AB3);
                background: -webkit-linear-gradient(left, #4568DC, #B06AB3);
                background: linear-gradient(to right, #4568DC, #B06AB3);
                height: 100px;
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, .9);
            }

            #mcontent {
                box-sizing: inherit;
                width: 100%;
                height: 100%;
                margin: 0;
                padding-top: 100px;
                background: #f3f3f3;
                display: block;
                -webkit-transition-property: all;
                transition-property: all;
                -webkit-transition-delay: .3s;
                transition-delay: .3s;
                -webkit-transition-duration: .5s;
                transition-duration: .5s;
                top: 0;

            }

            h1 {
                margin: 20px;
                font-size: 3em;
                color: #f3f3f3;
                font-family: 'Gruppo', cursive;
            }

            h2 {
                font-size: 2em;
                margin: 30px;
                display: inline-block;
            }
            .arl{
                display: inline-block;

            }
            h2.wb {
                display: inline-block;
                margin: 30px;
            }

            button {
                display: inline-block;
                width: 25%;
                height: 50%;
                border-radius: 50px;
                border: #4568DC 3px solid;
                background: #FFF;
                transition: .2;
                color: #4568DC;
                font-size: 1em;
            }

            button:hover {
                opacity: .8;
            }

            h3 {}

            h4 {}

            .h20 {
                display: block;
                height: 10%;
            }

            .h80 {
                display: block;
                height: 80%;
            }

            #sirabas {
                display: inline-block;
                margin: 3% 1% 0 4%;
                width: 43%;
                height: 90%;
                vertical-align: top;
                background: #fff;
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, .2);
            }

            #hyoka {
                display: inline-block;
                margin: 3% 3% 0 1%;
                width: 43%;
                height: 90%;
                vertical-align: top;
                background: #fff;
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, .2);
            }

            .coment {
                display: inline-block;
                margin: 3%;
                width: 94%;
                background: #e3e3e3;
                vertical-align: top;
                height: 84%;
                overflow: auto;
                border-radius: 10px;
            }

            .box {
                display: inline-block;
                margin: 3%;
                width: 43%;
                vertical-align: top;
                height: 100%;

            }

            .star-rating {
                position: relative;
                width: 5em;
                height: 1em;
                font-size: 25px;

            }

            .star-rating-front {
                position: absolute;
                top: 0;
                left: 0;
                overflow: hidden;
                color: #ffcc33;
            }

            .star-rating-back {
                color: #ccc;
            }

            /* drawer menu */

            .drawer-menu {
                box-sizing: border-box;
                position: fixed;
                top: 0;
                right: 0;
                width: 300px;
                height: 100%;
                padding: 120px 0;
                background: #222;
                -webkit-transition-property: all;
                transition-property: all;
                -webkit-transition-duration: .5s;
                transition-duration: .5s;
                -webkit-transition-delay: 0s;
                transition-delay: 0s;
                -webkit-transform-origin: right center;
                -ms-transform-origin: right center;
                transform-origin: right center;
                -webkit-transform: perspective(500px) rotateY(-90deg);
                transform: perspective(500px) rotateY(-90deg);
                opacity: 0;

            }

            .drawer-menu li {
                text-align: center;
            }

            .drawer-menu li a {
                display: block;
                height: 50px;
                line-height: 50px;
                font-size: 1.3em;
                color: #fff;
                -webkit-transition: all .8s;
                transition: all .8s;
                font-family: "Rounded Mplus 1c";
                text-decoration: none;
            }

            .drawer-menu li a:hover {
                color: #1a1e24;
                background: #fff;
            }

            /* checkbox */

            .check {
                display: none;
            }

            /* menu button - label tag */

            .menu-btn {
                position: fixed;
                display: block;
                top: 30px;
                right: 40px;
                display: block;
                width: 40px;
                height: 40px;
                font-size: 10px;
                text-align: center;
                cursor: pointer;
                z-index: 3;
            }

            .bar {
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                width: 40px;
                height: 3px;
                background: #f3f3f3;
                -webkit-transition: all .5s;
                transition: all .5s;
                -webkit-transform-origin: left top;
                -ms-transform-origin: left top;
                transform-origin: left top;
            }

            .bar.middle {
                top: 15px;
                opacity: 1;
            }

            .bar.bottom {
                top: 30px;
                -webkit-transform-origin: left bottom;
                -ms-transform-origin: left bottom;
                transform-origin: left bottom;
            }

            ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }


            .menu-btn:hover .bar {
                background: #999;
            }

            .menu-btn:hover .menu-btn__text {
                color: #999;
            }

            .close-menu {
                position: fixed;
                top: 0;
                right: 300px;
                width: 100%;
                height: 100vh;
                background: rgba(0, 0, 0, 0);
                -webkit-transition-property: all;
                transition-property: all;
                -webkit-transition-duration: .3s;
                transition-duration: .3s;
                -webkit-transition-delay: 0s;
                transition-delay: 0s;
                visibility: hidden;
                opacity: 0;
            }

            /* checked */

            .check:checked~.drawer-menu {
                -webkit-transition-delay: .3s;
                transition-delay: .3s;
                -webkit-transform: none;
                -ms-transform: none;
                transform: none;
                opacity: 1;
                z-index: 2;
            }

            .check:checked~.contents {
                -webkit-transition-delay: 0s;
                transition-delay: 0s;
                -webkit-transform: translateX(-300px);
                -ms-transform: translateX(-300px);
                transform: translateX(-300px);
            }

            .check:checked~.menu-btn .menu-btn__text {
                visibility: hidden;
                opacity: 0;
            }

            .check:checked~.menu-btn .bar.top {
                width: 56px;
                -webkit-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                transform: rotate(45deg);
                background: #EEE;
            }

            .check:checked~.menu-btn .bar.middle {
                opacity: 0;
                background: #EEE;
            }

            .check:checked~.menu-btn .bar.bottom {
                width: 56px;
                top: 40px;
                -webkit-transform: rotate(-45deg);
                -ms-transform: rotate(-45deg);
                transform: rotate(-45deg);
                background: #EEE;
            }

            .check:checked~.close-menu {
                -webkit-transition-duration: 1s;
                transition-duration: 1s;
                -webkit-transition-delay: .3s;
                transition-delay: .3s;
                background: rgba(0, 0, 0, .5);
                visibility: visible;
                opacity: 1;
                z-index: 3;
            }
        </style>
    </body>

    </html>