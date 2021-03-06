<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <title>SyfoN</title>
        <link href="https://fonts.googleapis.com/css?family=Nunito|Poor+Story" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
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
                        <a href="TimeTableServ">トップページ</a>
                    </li>
                    <li>
                        <a href="Search_Lecture.jsp">講義一覧</a>
                    </li>
                    <li>
                        <a href="Mypagesev">マイページ</a>
                    </li>
                    <li>
                        <a href="Logout">ログアウト</a>
                    </li>
                </ul>
            </nav>
            <div id="mcontent">
                <div id="tables">
                    <h2>Timetable</h2>
                    <a href="CreateTable">
                        <button class="edit">時間割作成・編集</button>
                    </a>
                    <div class="tabs">
                        <input id="zen1" type="radio" name="tab_item" checked>
                        <label class="tab_item" for="zen1">1年前期</label>

                        <input id="kou1" type="radio" name="tab_item">
                        <label class="tab_item" for="kou1">1年後期</label>

                        <input id="zen2" type="radio" name="tab_item">
                        <label class="tab_item" for="zen2">2年前期</label>

                        <input id="kou2" type="radio" name="tab_item">
                        <label class="tab_item" for="kou2">2年後期</label>

                        <input id="zen3" type="radio" name="tab_item">
                        <label class="tab_item" for="zen3">3年前期</label>

                        <input id="kou3" type="radio" name="tab_item">
                        <label class="tab_item" for="kou3">3年後期</label>

                        <input id="zen4" type="radio" name="tab_item">
                        <label class="tab_item" for="zen4">4年前期</label>

                        <input id="kou4" type="radio" name="tab_item">
                        <label class="tab_item" for="kou4">4年後期</label>


                        <div class="tab_content" id="zen1_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr class="top">
                                        <th class="top"></th>
                                        <th class="top">月</th>
                                        <th class="top">火</th>
                                        <th class="top">水</th>
                                        <th class="top">木</th>
                                        <th class="top">金</th>
                                    </tr>
                                    <tr class="top">
                                        <td>1</td>

                                        <td>
                                            {{table.zenki1.monday.period1.name}}
                                            <br/> {{table.zenki1.monday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.monday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.monday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period1.name}}
                                            <br/> {{table.zenki1.tuesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.tuesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.tuesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>

                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period1.name}}
                                            <br/> {{table.zenki1.wednesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.wednesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.wednesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period1.name}}
                                            <br/> {{table.zenki1.thursday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.thursday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.thursday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period1.name}}
                                            <br/> {{table.zenki1.fryday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.fryday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.fryday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.zenki1.monday.period2.name}}
                                            <br/> {{table.zenki1.monday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.monday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.monday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period2.name}}
                                            <br/> {{table.zenki1.tuesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.tuesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.tuesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period2.name}}
                                            <br/> {{table.zenki1.wednesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.wednesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.wednesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period2.name}}
                                            <br/> {{table.zenki1.thursday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.thursday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.thursday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period2.name}}
                                            <br/> {{table.zenki1.fryday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.fryday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.fryday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.zenki1.monday.period3.name}}
                                            <br/> {{table.zenki1.monday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.monday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.monday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period3.name}}
                                            <br/> {{table.zenki1.tuesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.tuesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.tuesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period3.name}}
                                            <br/> {{table.zenki1.wednesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.wednesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.wednesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period3.name}}
                                            <br/> {{table.zenki1.thursday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.thursday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.thursday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period3.name}}
                                            <br/> {{table.zenki1.fryday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.fryday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.fryday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.zenki1.monday.period4.name}}
                                            <br/> {{table.zenki1.monday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.monday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.monday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period4.name}}
                                            <br/> {{table.zenki1.tuesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.tuesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.tuesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period4.name}}
                                            <br/> {{table.zenki1.wednesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.wednesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.wednesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period4.name}}
                                            <br/> {{table.zenki1.thursday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.thursday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.thursday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period4.name}}
                                            <br/> {{table.zenki1.fryday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.fryday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.fryday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.zenki1.monday.period5.name}}
                                            <br/> {{table.zenki1.monday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.monday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.monday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period5.name}}
                                            <br/> {{table.zenki1.tuesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.tuesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.tuesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period5.name}}
                                            <br/> {{table.zenki1.wednesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.wednesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.wednesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period5.name}}
                                            <br/> {{table.zenki1.thursday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.thursday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.thursday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period5.name}}
                                            <br/> {{table.zenki1.fryday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki1.fryday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki1.fryday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="zen2_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr class="top">
                                        <th class="top"></th>
                                        <th class="top">月</th>
                                        <th class="top">火</th>
                                        <th class="top">水</th>
                                        <th class="top">木</th>
                                        <th class="top">金</th>
                                    </tr>
                                    <td>1</td>

                                    <td>
                                        {{table.zenki2.monday.period1.name}}
                                        <br/> {{table.zenki2.monday.period1.room}}
                                        <form action="ToLecInfo" method="POST">
                                            <input v-model="table.zenki2.monday.period1.lectureid" name="id" style="display: none;" />
                                            <button v-if="!(table.zenki2.monday.period1.lectureid==0)" @click="submit">詳細</button>
                                        </form>
                                    </td>
                                    <td>
                                        {{table.zenki2.tuesday.period1.name}}
                                        <br/> {{table.zenki2.tuesday.period1.room}}
                                        <form action="ToLecInfo" method="POST">
                                            <input v-model="table.zenki2.tuesday.period1.lectureid" name="id" style="display: none;" />
                                            <button v-if="!(table.zenki2.tuesday.period1.lectureid==0)" @click="submit">詳細</button>
                                        </form>
                                    </td>
                                    <td>
                                        {{table.zenki2.wednesday.period1.name}}
                                        <br/> {{table.zenki2.wednesday.period1.room}}
                                        <form action="ToLecInfo" method="POST">
                                            <input v-model="table.zenki2.wednesday.period1.lectureid" name="id" style="display: none;" />
                                            <button v-if="!(table.zenki2.wednesday.period1.lectureid==0)" @click="submit">詳細</button>
                                        </form>
                                    </td>
                                    <td>
                                        {{table.zenki2.thursday.period1.name}}
                                        <br/> {{table.zenki2.thursday.period1.room}}
                                        <form action="ToLecInfo" method="POST">
                                            <input v-model="table.zenki2.thursday.period1.lectureid" name="id" style="display: none;" />
                                            <button v-if="!(table.zenki2.thursday.period1.lectureid==0)" @click="submit">詳細</button>
                                        </form>
                                    </td>
                                    <td>
                                        {{table.zenki2.fryday.period1.name}}
                                        <br/> {{table.zenki2.fryday.period1.room}}
                                        <form action="ToLecInfo" method="POST">
                                            <input v-model="table.zenki2.fryday.period1.lectureid" name="id" style="display: none;" />
                                            <button v-if="!(table.zenki2.fryday.period1.lectureid==0)" @click="submit">詳細</button>
                                        </form>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.zenki2.monday.period2.name}}
                                            <br/> {{table.zenki2.monday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.monday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.monday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period2.name}}
                                            <br/> {{table.zenki2.tuesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.tuesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.tuesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period2.name}}
                                            <br/> {{table.zenki2.wednesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.wednesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.wednesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period2.name}}
                                            <br/> {{table.zenki2.thursday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.thursday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.thursday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period2.name}}
                                            <br/> {{table.zenki2.fryday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.fryday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.fryday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.zenki2.monday.period3.name}}
                                            <br/> {{table.zenki2.monday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.monday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.monday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period3.name}}
                                            <br/> {{table.zenki2.tuesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.tuesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.tuesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period3.name}}
                                            <br/> {{table.zenki2.wednesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.wednesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.wednesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period3.name}}
                                            <br/> {{table.zenki2.thursday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.thursday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.thursday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period3.name}}
                                            <br/> {{table.zenki2.fryday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.fryday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.fryday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.zenki2.monday.period4.name}}
                                            <br/> {{table.zenki2.monday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.monday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.monday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period4.name}}
                                            <br/> {{table.zenki2.tuesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.tuesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.tuesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period4.name}}
                                            <br/> {{table.zenki2.wednesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.wednesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.wednesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period4.name}}
                                            <br/> {{table.zenki2.thursday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.thursday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.thursday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period4.name}}
                                            <br/> {{table.zenki2.fryday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.fryday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.fryday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.zenki2.monday.period5.name}}
                                            <br/> {{table.zenki2.monday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.monday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.monday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period5.name}}
                                            <br/> {{table.zenki2.tuesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.tuesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.tuesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period5.name}}
                                            <br/> {{table.zenki2.wednesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.wednesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.wednesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period5.name}}
                                            <br/> {{table.zenki2.thursday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.thursday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.thursday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period5.name}}
                                            <br/> {{table.zenki2.fryday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki2.fryday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki2.fryday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="zen3_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr class="top">
                                        <th class="top"></th>
                                        <th class="top">月</th>
                                        <th class="top">火</th>
                                        <th class="top">水</th>
                                        <th class="top">木</th>
                                        <th class="top">金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.zenki3.monday.period1.name}}
                                            <br/> {{table.zenki3.monday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.monday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.monday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period1.name}}
                                            <br/> {{table.zenki3.tuesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.tuesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.tuesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period1.name}}
                                            <br/> {{table.zenki3.wednesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.wednesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.wednesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period1.name}}
                                            <br/> {{table.zenki3.thursday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.thursday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.thursday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period1.name}}
                                            <br/> {{table.zenki3.fryday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.fryday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.fryday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.zenki3.monday.period2.name}}
                                            <br/> {{table.zenki3.monday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.monday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.monday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period2.name}}
                                            <br/> {{table.zenki3.tuesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.tuesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.tuesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period2.name}}
                                            <br/> {{table.zenki3.wednesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.wednesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.wednesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period2.name}}
                                            <br/> {{table.zenki3.thursday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.thursday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.thursday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period2.name}}
                                            <br/> {{table.zenki3.fryday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.fryday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.fryday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.zenki3.monday.period3.name}}
                                            <br/> {{table.zenki3.monday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.monday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.monday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period3.name}}
                                            <br/> {{table.zenki3.tuesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.tuesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.tuesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period3.name}}
                                            <br/> {{table.zenki3.wednesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.wednesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.wednesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period3.name}}
                                            <br/> {{table.zenki3.thursday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.thursday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.thursday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period3.name}}
                                            <br/> {{table.zenki3.fryday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.fryday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.fryday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.zenki3.monday.period4.name}}
                                            <br/> {{table.zenki3.monday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.monday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.monday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period4.name}}
                                            <br/> {{table.zenki3.tuesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.tuesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.tuesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period4.name}}
                                            <br/> {{table.zenki3.wednesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.wednesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.wednesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period4.name}}
                                            <br/> {{table.zenki3.thursday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.thursday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.thursday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period4.name}}
                                            <br/> {{table.zenki3.fryday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.fryday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.fryday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.zenki3.monday.period5.name}}
                                            <br/> {{table.zenki3.monday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.monday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.monday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period5.name}}
                                            <br/> {{table.zenki3.tuesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.tuesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.tuesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period5.name}}
                                            <br/> {{table.zenki3.wednesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.wednesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.wednesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period5.name}}
                                            <br/> {{table.zenki3.thursday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.thursday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.thursday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period5.name}}
                                            <br/> {{table.zenki3.fryday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki3.fryday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki3.fryday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="zen4_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr class="top">
                                        <th class="top"></th>
                                        <th class="top">月</th>
                                        <th class="top">火</th>
                                        <th class="top">水</th>
                                        <th class="top">木</th>
                                        <th class="top">金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.zenki4.monday.period1.name}}
                                            <br/> {{table.zenki4.monday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.monday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.monday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period1.name}}
                                            <br/> {{table.zenki4.tuesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.tuesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.tuesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period1.name}}
                                            <br/> {{table.zenki4.wednesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.wednesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.wednesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period1.name}}
                                            <br/> {{table.zenki4.thursday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.thursday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.thursday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period1.name}}
                                            <br/> {{table.zenki4.fryday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.fryday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.fryday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.zenki4.monday.period2.name}}
                                            <br/> {{table.zenki4.monday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.monday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.monday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period2.name}}
                                            <br/> {{table.zenki4.tuesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.tuesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.tuesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period2.name}}
                                            <br/> {{table.zenki4.wednesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.wednesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.wednesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period2.name}}
                                            <br/> {{table.zenki4.thursday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.thursday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.thursday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period2.name}}
                                            <br/> {{table.zenki4.fryday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.fryday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.fryday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.zenki4.monday.period3.name}}
                                            <br/> {{table.zenki4.monday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.monday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.monday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period3.name}}
                                            <br/> {{table.zenki4.tuesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.tuesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.tuesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period3.name}}
                                            <br/> {{table.zenki4.wednesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.wednesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.wednesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period3.name}}
                                            <br/> {{table.zenki4.thursday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.thursday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.thursday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period3.name}}
                                            <br/> {{table.zenki4.fryday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.fryday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.fryday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.zenki4.monday.period4.name}}
                                            <br/> {{table.zenki4.monday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.monday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.monday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period4.name}}
                                            <br/> {{table.zenki4.tuesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.tuesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.tuesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period4.name}}
                                            <br/> {{table.zenki4.wednesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.wednesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.wednesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period4.name}}
                                            <br/> {{table.zenki4.thursday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.thursday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.thursday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period4.name}}
                                            <br/> {{table.zenki4.fryday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.fryday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.fryday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.zenki4.monday.period5.name}}
                                            <br/> {{table.zenki4.monday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.monday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.monday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period5.name}}
                                            <br/> {{table.zenki4.tuesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.tuesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.tuesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period5.name}}
                                            <br/> {{table.zenki4.wednesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.wednesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.wednesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period5.name}}
                                            <br/> {{table.zenki4.thursday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.thursday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.thursday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period5.name}}
                                            <br/> {{table.zenki4.fryday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.zenki4.fryday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.zenki4.fryday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="kou1_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr class="top">
                                        <th class="top"></th>
                                        <th class="top">月</th>
                                        <th class="top">火</th>
                                        <th class="top">水</th>
                                        <th class="top">木</th>
                                        <th class="top">金</th>
                                    </tr>

                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.kouki1.monday.period1.name}}
                                            <br/> {{table.kouki1.monday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.monday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.monday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period1.name}}
                                            <br/> {{table.kouki1.tuesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.tuesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.tuesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period1.name}}
                                            <br/> {{table.kouki1.wednesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.wednesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.wednesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period1.name}}
                                            <br/> {{table.kouki1.thursday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.thursday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.thursday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period1.name}}
                                            <br/> {{table.kouki1.fryday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.fryday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.fryday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.kouki1.monday.period2.name}}
                                            <br/> {{table.kouki1.monday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.monday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.monday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period2.name}}
                                            <br/> {{table.kouki1.tuesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.tuesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.tuesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period2.name}}
                                            <br/> {{table.kouki1.wednesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.wednesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.wednesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period2.name}}
                                            <br/> {{table.kouki1.thursday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.thursday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.thursday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period2.name}}
                                            <br/> {{table.kouki1.fryday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.fryday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.fryday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.kouki1.monday.period3.name}}
                                            <br/> {{table.kouki1.monday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.monday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.monday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period3.name}}
                                            <br/> {{table.kouki1.tuesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.tuesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.tuesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period3.name}}
                                            <br/> {{table.kouki1.wednesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.wednesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.wednesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period3.name}}
                                            <br/> {{table.kouki1.thursday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.thursday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.thursday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period3.name}}
                                            <br/> {{table.kouki1.fryday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.fryday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.fryday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.kouki1.monday.period4.name}}
                                            <br/> {{table.kouki1.monday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.monday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.monday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period4.name}}
                                            <br/> {{table.kouki1.tuesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.tuesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.tuesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period4.name}}
                                            <br/> {{table.kouki1.wednesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.wednesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.wednesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period4.name}}
                                            <br/> {{table.kouki1.thursday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.thursday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.thursday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period4.name}}
                                            <br/> {{table.kouki1.fryday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.fryday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.fryday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.kouki1.monday.period5.name}}
                                            <br/> {{table.kouki1.monday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.monday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.monday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period5.name}}
                                            <br/> {{table.kouki1.tuesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.tuesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.tuesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period5.name}}
                                            <br/> {{table.kouki1.wednesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.wednesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.wednesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period5.name}}
                                            <br/> {{table.kouki1.thursday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.thursday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.thursday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period5.name}}
                                            <br/> {{table.kouki1.fryday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki1.fryday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki1.fryday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="kou2_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr class="top">
                                        <th class="top"></th>
                                        <th class="top">月</th>
                                        <th class="top">火</th>
                                        <th class="top">水</th>
                                        <th class="top">木</th>
                                        <th class="top">金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.kouki2.monday.period1.name}}
                                            <br/> {{table.kouki2.monday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.monday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.monday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period1.name}}
                                            <br/> {{table.kouki2.tuesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.tuesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.tuesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period1.name}}
                                            <br/> {{table.kouki2.wednesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.wednesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.wednesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period1.name}}
                                            <br/> {{table.kouki2.thursday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.thursday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.thursday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period1.name}}
                                            <br/> {{table.kouki2.fryday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.fryday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.fryday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.kouki2.monday.period2.name}}
                                            <br/> {{table.kouki2.monday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.monday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.monday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period2.name}}
                                            <br/> {{table.kouki2.tuesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.tuesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.tuesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period2.name}}
                                            <br/> {{table.kouki2.wednesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.wednesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.wednesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period2.name}}
                                            <br/> {{table.kouki2.thursday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.thursday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.thursday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period2.name}}
                                            <br/> {{table.kouki2.fryday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.fryday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.fryday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.kouki2.monday.period3.name}}
                                            <br/> {{table.kouki2.monday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.monday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.monday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period3.name}}
                                            <br/> {{table.kouki2.tuesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.tuesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.tuesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period3.name}}
                                            <br/> {{table.kouki2.wednesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.wednesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.wednesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period3.name}}
                                            <br/> {{table.kouki2.thursday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.thursday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.thursday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period3.name}}
                                            <br/> {{table.kouki2.fryday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.fryday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.fryday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.kouki2.monday.period4.name}}
                                            <br/> {{table.kouki2.monday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.monday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.monday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period4.name}}
                                            <br/> {{table.kouki2.tuesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.tuesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.tuesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period4.name}}
                                            <br/> {{table.kouki2.wednesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.wednesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.wednesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period4.name}}
                                            <br/> {{table.kouki2.thursday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.thursday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.thursday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period4.name}}
                                            <br/> {{table.kouki2.fryday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.fryday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.fryday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.kouki2.monday.period5.name}}
                                            <br/> {{table.kouki2.monday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.monday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.monday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period5.name}}
                                            <br/> {{table.kouki2.tuesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.tuesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.tuesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period5.name}}
                                            <br/> {{table.kouki2.wednesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.wednesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.wednesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period5.name}}
                                            <br/> {{table.kouki2.thursday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.thursday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.thursday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period5.name}}
                                            <br/> {{table.kouki2.fryday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki2.fryday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki2.fryday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="kou3_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr class="top">
                                        <th class="top"></th>
                                        <th class="top">月</th>
                                        <th class="top">火</th>
                                        <th class="top">水</th>
                                        <th class="top">木</th>
                                        <th class="top">金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.kouki3.monday.period1.name}}
                                            <br/> {{table.kouki3.monday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.monday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.monday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period1.name}}
                                            <br/> {{table.kouki3.tuesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.tuesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.tuesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period1.name}}
                                            <br/> {{table.kouki3.wednesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.wednesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.wednesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period1.name}}
                                            <br/> {{table.kouki3.thursday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.thursday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.thursday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period1.name}}
                                            <br/> {{table.kouki3.fryday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.fryday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.fryday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.kouki3.monday.period2.name}}
                                            <br/> {{table.kouki3.monday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.monday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.monday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period2.name}}
                                            <br/> {{table.kouki3.tuesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.tuesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.tuesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period2.name}}
                                            <br/> {{table.kouki3.wednesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.wednesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.wednesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period2.name}}
                                            <br/> {{table.kouki3.thursday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.thursday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.thursday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period2.name}}
                                            <br/> {{table.kouki3.fryday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.fryday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.fryday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.kouki3.monday.period3.name}}
                                            <br/> {{table.kouki3.monday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.monday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.monday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period3.name}}
                                            <br/> {{table.kouki3.tuesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.tuesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.tuesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period3.name}}
                                            <br/> {{table.kouki3.wednesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.wednesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.wednesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period3.name}}
                                            <br/> {{table.kouki3.thursday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.thursday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.thursday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period3.name}}
                                            <br/> {{table.kouki3.fryday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.fryday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.fryday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.kouki3.monday.period4.name}}
                                            <br/> {{table.kouki3.monday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.monday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.monday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period4.name}}
                                            <br/> {{table.kouki3.tuesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.tuesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.tuesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period4.name}}
                                            <br/> {{table.kouki3.wednesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.wednesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.wednesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period4.name}}
                                            <br/> {{table.kouki3.thursday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.thursday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.thursday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period4.name}}
                                            <br/> {{table.kouki3.fryday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.fryday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.fryday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.kouki3.monday.period5.name}}
                                            <br/> {{table.kouki3.monday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.monday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.monday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period5.name}}
                                            <br/> {{table.kouki3.tuesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.tuesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.tuesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period5.name}}
                                            <br/> {{table.kouki3.wednesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.wednesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.wednesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period5.name}}
                                            <br/> {{table.kouki3.thursday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.thursday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.thursday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period5.name}}
                                            <br/> {{table.kouki3.fryday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki3.fryday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki3.fryday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="kou4_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr class="top">
                                        <th class="top"></th>
                                        <th class="top">月</th>
                                        <th class="top">火</th>
                                        <th class="top">水</th>
                                        <th class="top">木</th>
                                        <th class="top">金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.kouki4.monday.period1.name}}
                                            <br/> {{table.kouki4.monday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.monday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.monday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period1.name}}
                                            <br/> {{table.kouki4.tuesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.tuesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.tuesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period1.name}}
                                            <br/> {{table.kouki4.wednesday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.wednesday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.wednesday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period1.name}}
                                            <br/> {{table.kouki4.thursday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.thursday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.thursday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period1.name}}
                                            <br/> {{table.kouki4.fryday.period1.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.fryday.period1.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.fryday.period1.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.kouki4.monday.period2.name}}
                                            <br/> {{table.kouki4.monday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.monday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.monday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period2.name}}
                                            <br/> {{table.kouki4.tuesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.tuesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.tuesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period2.name}}
                                            <br/> {{table.kouki4.wednesday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.wednesday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.wednesday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period2.name}}
                                            <br/> {{table.kouki4.thursday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.thursday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.thursday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period2.name}}
                                            <br/> {{table.kouki4.fryday.period2.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.fryday.period2.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.fryday.period2.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.kouki4.monday.period3.name}}
                                            <br/> {{table.kouki4.monday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.monday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.monday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period3.name}}
                                            <br/> {{table.kouki4.tuesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.tuesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.tuesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period3.name}}
                                            <br/> {{table.kouki4.wednesday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.wednesday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.wednesday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period3.name}}
                                            <br/> {{table.kouki4.thursday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.thursday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.thursday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period3.name}}
                                            <br/> {{table.kouki4.fryday.period3.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.fryday.period3.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.fryday.period3.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.kouki4.monday.period4.name}}
                                            <br/> {{table.kouki4.monday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.monday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.monday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period4.name}}
                                            <br/> {{table.kouki4.tuesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.tuesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.tuesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period4.name}}
                                            <br/> {{table.kouki4.wednesday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.wednesday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.wednesday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period4.name}}
                                            <br/> {{table.kouki4.thursday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.thursday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.thursday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period4.name}}
                                            <br/> {{table.kouki4.fryday.period4.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.fryday.period4.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.fryday.period4.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.kouki4.monday.period5.name}}
                                            <br/> {{table.kouki4.monday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.monday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.monday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period5.name}}
                                            <br/> {{table.kouki4.tuesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.tuesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.tuesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period5.name}}
                                            <br/> {{table.kouki4.wednesday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.wednesday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.wednesday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period5.name}}
                                            <br/> {{table.kouki4.thursday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.thursday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.thursday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period5.name}}
                                            <br/> {{table.kouki4.fryday.period5.room}}
                                            <form action="ToLecInfo" method="POST">
                                                <input v-model="table.kouki4.fryday.period5.lectureid" name="id" style="display: none;" />
                                                <button v-if="!(table.kouki4.fryday.period5.lectureid==0)" @click="submit">詳細</button>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="panel">
                    <div id="progres1">
                        <h3>1→２進級まで</h3>
                        <div id="probar1">
                            <div id="probar1n">
                                <p>{{numTwoSum}}/24</p>
                            </div>
                        </div>
                        <p style="color:#FFFFFF;">_</p>
                        <h3>3→4進級まで</h3>
                        <div id="probar2">
                            <div id="probar2n">
                                <p>{{numForSum}}/108</p>
                            </div>
                        </div>
                        <p>英語：あと{{numEngForSum}}単位　人科：あと{{numHumForSum}}単位</p>
                    </div>
                    <div id="progres2">
                        <h3>卒業まで</h3>
                        <div id="probar3">
                            <div id="probar3n">
                                <p>{{numAllSum}}/124</p>
                            </div>
                        </div>
                        <p>英語：あと{{numEngAllSum}}単位　人科：あと{{numHumAllSum}}単位　必修：あと{{numMusAllSum}}単位</p>
                        <h4>ユニット取得状況</h4>
                        <p v-for="unit in units" style="display: inline-block; width: 40% ;">{{unit.name}}:{{unit.sum}}/{{unit.taninum}}</p>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var app = new Vue({
                el: '#app',
                data: {
                    strnull: "",
                    table: '',
                    units: '',
                    needs: '',
                    test: 'unko'
                },
                methods: {
                },
                updated: function () {
                    var br1 = document.getElementById('probar1n');
                    console.log(br1)
                    var br2 = document.getElementById('probar2n');
                    var br3 = document.getElementById('probar3n');
                    var brr1 = this.numTwoSum / 24 * 100;
                    var brr2 = this.numForSum / 108 * 100;
                    var brr3 = this.numAllSum / 124 * 100;
                    br1.style.width = brr1 + "%";
                    br2.style.width = brr2 + "%";
                    br3.style.width = brr3 + "%";
                },
                mounted() {

                    const self = this
                    console.log("hello")
                    this.table = '<%= session.getAttribute("lectureList")%>'
                    this.table = JSON.parse(this.table)
                    this.table = this.table.table
                    console.log("mounted");
                    console.log(this.table);
                    this.units = '<%= session.getAttribute("unit")%>'
                    this.units = JSON.parse(this.units)
                    this.units = this.units.units
                    console.log(this.units)
                    console.log("↑unit")
                    this.needs = '<%= session.getAttribute("mustTani")%>'
                    this.needs = JSON.parse(this.needs)
                    this.needs = this.needs.mustTani
                    console.log(this.needs)
                    let numAllSum = 0;
                    let numEngAllSum = 0;
                    let numHumAllSum = 0;
                    let numMusAllSum = 0;
                    let numTwoSum = 0;
                    let numEngTwoSum = 0;
                    let numHumTwoSum = 0;
                    let numMusTwoSum = 0;
                    let numForSum = 0;
                    let numEngForSum = 0;
                    let numHumForSum = 0;
                    let numMusForSum = 0;
                    for (let term in this.table) {
                        console.log(term)
                        console.log(this.table)
                        console.log(this.table[term])
                        for (let yobi in this.table[term]) {
                            console.log(yobi)
                            for (clas in this.table[term][yobi]) {
                                numAllSum += Number(this.table[term][yobi][clas].taninum)
                                if(this.table[term][yobi][clas].name==0){
                                    this.table[term][yobi][clas].name="";
                                }
                                if(this.table[term][yobi][clas].room==0){
                                    this.table[term][yobi][clas].room="";
                                }
                                if ((term == "zenki1") || (term == "kouki1")) {
                                    numTwoSum += Number(this.table[term][yobi][clas].taninum)
                                }
                                if (!(term == "zenki4") && !(term == "kouki4")) {
                                    numForSum += Number(this.table[term][yobi][clas].taninum)
                                }

                                if (this.table[term][yobi][clas].type == "eng") {
                                    numEngAllSum += Number(this.table[term][yobi][clas].taninum)
                                    if ((term == "zenki1") || (term == "kouki1")) {
                                        numEngTwoSum += Number(this.table[term][yobi][clas].taninum)
                                    }
                                    if (!(term == "zenki4") || !(term == "kouki4")) {
                                        numEngForSum += Number(this.table[term][yobi][clas].taninum)
                                    }
                                }
                                if (this.table[term][yobi][clas].type == "mus") {
                                    numMusAllSum += Number(this.table[term][yobi][clas].taninum)
                                }
                                if (this.table[term][yobi][clas].type == "hum") {
                                    numHumAllSum += Number(this.table[term][yobi][clas].taninum)
                                    if ((term == "zenki1") || (term == "kouki1")) {
                                        numHumTwoSum += Number(this.table[term][yobi][clas].taninum)
                                    }
                                    if (!(term == "zenki4") || !(term == "kouki4")) {
                                        numHumForSum += Number(this.table[term][yobi][clas].taninum)
                                    }
                                }
                            }
                        }
                    }
                    this.numAllSum = numAllSum;
                    this.numEngAllSum = this.needs.English.num - numEngAllSum;
                    this.numHumAllSum = this.needs.Jinka.num - numHumAllSum;
                    this.numMusAllSum = this.needs.Hissyu.num - numMusAllSum;
                    if (this.numEngAllSum < 0) {
                        this.numEngAllSum = 0
                    }
                    if (this.numHumAllSum < 0) {
                        this.numHumAllSum = 0
                    }
                    if (this.numMusAllSum < 0) {
                        this.numMusAllSum = 0
                    }
                    this.numTwoSum = numTwoSum;
                    this.numEngTwoSum = 0;
                    this.numHumTwoSum = 0;

                    this.numForSum = numForSum;
                    this.numEngForSum = 4 - numEngForSum;
                    this.numHumForSum = 10 - numHumForSum;
                    if (this.numEngForSum < 0) {
                        this.numEngForSum = 0
                    }
                    if (this.numHumForSum < 0) {
                        this.numHumForSum = 0
                    }

                    for (unit in this.units) {
                        this.units[unit].sum = 0;
                    }
                    for (let term in this.table) {
                        for (let yobi in this.table[term]) {
                            for (clas in this.table[term][yobi]) {
                                for (unit in this.units) {
                                    if (this.table[term][yobi][clas].unit == this.units[unit].id)
                                        this.units[unit].sum += Number(this.table[term][yobi][clas].taninum)
                                }
                            }
                        }
                    }
                }
            })
        </script>
        <style scoped>
            @import url('https://fonts.googleapis.com/css?family=Gruppo|Handlee|Itim|Jura|Life+Savers:700|Nothing+You+Could+Do|Short+Stack');
            #app {
                width: 100vw;
                height: 100vh;
                background: #FFEFBA;
                margin: 0px;
                position: absolute;
                top: 0;
                left: 0;
                font-family: "Rounded Mplus 1c", 'Nunito', sans-serif;
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
                display: table;
                box-shadow: 0 0 50px 0 rgba(0, 0, 0, .8);
                -webkit-transition-property: all;
                transition-property: all;
                -webkit-transition-delay: .3s;
                transition-delay: .3s;
                -webkit-transition-duration: .5s;
                transition-duration: .5s;
                top: 0;
            }

            #tables {
                width: 54%;
                height: 80%;
                margin: 3%;
                float: left;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                background: #FFF;
            }

            #panel {
                right: 0;
                width: 40%;
                height: 100%;
                margin: 0;
                box-sizing: inherit;
                float: right;
            }

            #probar1 {
                width: 90%;
                height: 30px;
                border-radius: 100px;
                border: #555555 3px solid;
            }

            #probar1n {
                width: 0%;
                height: 30px;
                max-width: 100%;
                border-radius: 100px;
                border: none;
                background: #00c3ff;
                background: -moz-linear-gradient(left, #00c3ff, #ffff1c);
                background: -webkit-linear-gradient(left, #00c3ff, #ffff1c);
                background: linear-gradient(to right, #00c3ff, #ffff1c);
            }

            #probar1n p {
                margin: 0 auto;
                padding: 0;
                color: #FFF;
                font-size: 1.1em;
                margin-left: 5%;
            }

            #probar2 {
                width: 90%;
                height: 30px;
                border-radius: 100px;
                border: #555555 3px solid;
            }

            #probar2n {
                width: 30%;
                max-width: 100%;
                height: 30px;
                border-radius: 100px;
                border: none;
                background: #00c3ff;
                background: -moz-linear-gradient(left, #00c3ff, #ffff1c);
                background: -webkit-linear-gradient(left, #00c3ff, #ffff1c);
                background: linear-gradient(to right, #00c3ff, #ffff1c);
            }

            #probar2n p {
                margin: 0 auto;
                padding: 0;
                color: #FFF;
                font-size: 1.1em;
                margin-left: 5%;
            }

            #probar3 {
                width: 90%;
                height: 30px;
                border-radius: 100px;
                border: #555555 3px solid;
            }

            #probar3n {
                width: 110%;
                max-width: 100%;
                height: 30px;
                border-radius: 100px;
                border: none;
                background: #00c3ff;
                background: -moz-linear-gradient(left, #00c3ff, #ffff1c);
                background: -webkit-linear-gradient(left, #00c3ff, #ffff1c);
                background: linear-gradient(to right, #00c3ff, #ffff1c);
            }

            #probar3n p {
                margin: 0 auto;
                padding: 0;
                color: #FFF;
                font-size: 1.1em;
                margin-left: 5%;
            }

            #unit {
                display: block;
                height: 30%;
                width: 100%;
            }
            .edit {
                display: inline-block;
                height: 6%;
                margin-left: 10%;
                margin-right: 10%;
                margin-top: 2%;
                margin-bottom: 0;
                border-radius: 50px;
                border: #4568DC 3px solid;
                background: #FFF;
                transition: .2;
                color: #4568DC;
                font-size: 1em;
                clear: both;
            }
            .edit:hover{
                opacity: .8;
            }
            #progres1 {
                display: block;
                height: 34%;
                width: 80%;
                margin-top: 8%;
                clear: both;
                padding: 10px;
                background: #FFF;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                box-sizing: inherit;
            }

            #progres2 {
                display: block;
                height: 44%;
                width: 80%;
                clear: both;
                margin-top: 3%;
                padding: 10px;
                background: #FFF;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                box-sizing: inherit;
            }
            p {
                margin:10px;
            }
            h1 {
                margin: 20px;
                font-size: 3em;
                color: #f3f3f3;
                font-family: 'Gruppo', cursive;
            }

            h2 {
                font-size: 2em;
                float: left;
                margin: 30px;
            }

            h3 {
                font-size: 1.5em;
                margin: 10px;
                color: #555555;
            }

            h4 {
                font-size: 1.2em;
                margin: 10px;
                color: #555555;
                margin-bottom: 3px;
            }



            table {
                width: 100%;
                height: 100%;
                border: none;
                padding: 0;
                margin: 0;
                border-collapse: collapse;
                border-spacing: 0;
            }

            tr:nth-child(1) td {
                font-size: 200;
            }

            td {
                width: calc(100%/6);
                border: solid 1px #aaaaaa;
                margin: auto;
                padding: 0;
            }

            td button {
                background: #FFF;
                width: 80%;
                margin: 0 auto;
                border-radius: 10px;
                border: solid 2px #7369CB;
            }

            th.top {
                border: none;
                font-size: 1.7em;
                border-bottom: solid 3px #7369CB;
                font-family: "Rounded Mplus 1c";
            }

            th {
                border-bottom: solid 3px #7369CB;
            }

            th:nth-child(1) {
                border: none;
                border-right: solid 3px #7369CB;
                border-bottom: solid 3px #7369CB;
            }

            tr td:nth-of-type(1) {
                padding: 20px;
                font-size: 2.1em;
                border: none;
                border-right: solid 3px #7369CB;
                text-align: right;
            }

            /*タブ切り替え全体のスタイル*/

            .tabs {
                margin-top: 50px;
                padding-bottom: 40px;
                background-color: #fff;
                width: 90%;
                height: 70%;
                margin: 50 auto;
                clear: both;
            }

            /*タブのスタイル*/

            .tab_item {
                width: calc(100%/9);
                height: 50px;
                border-radius: 50px;
                border: 3px solid #7369CB;
                background-color: #FFF;
                line-height: 50px;
                font-size: 16px;
                text-align: center;
                color: #565656;
                display: block;
                float: left;
                text-align: center;
                font-weight: bold;
                transition: all 0.2s ease;
            }

            .tab_item:hover {
                opacity: 0.75;
            }

            /*ラジオボタンを全て消す*/

            input[name="tab_item"] {
                display: none;
            }

            /*タブ切り替えの中身のスタイル*/

            .tab_content {
                display: none;
                padding: 20px 20px 0;
                clear: both;
                overflow: hidden;
            }

            /*選択されているタブのコンテンツのみを表示*/

            #zen1:checked~#zen1_content,
            #zen2:checked~#zen2_content,
            #zen3:checked~#zen3_content,
            #zen4:checked~#zen4_content,
            #kou1:checked~#kou1_content,
            #kou2:checked~#kou2_content,
            #kou3:checked~#kou3_content,
            #kou4:checked~#kou4_content {
                display: block;
            }

            /*選択されているタブのスタイルを変える*/

            .tabs input:checked+.tab_item {
                background-color: #7369CB;
                color: #fff;
            }

            ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .contents__inner {
                display: table-cell;
                vertical-align: middle;
                text-align: center;
            }

            .contents__inner h1 {
                margin: 0;
                padding: 0;
                color: #fff;
                font-size: 40px;
                font-family: Futura, "Century Gothic", "helvetica neue", arial, sans-serif !important;
                font-style: italic;
            }

            .contents__inner p {
                margin-top: 20px;
                color: #fff;
                font-size: 20px;
            }

            .contents__inner p span {
                border-bottom: 1px solid #fff;
            }

            /* drawer menu */

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