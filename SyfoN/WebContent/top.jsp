<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <title>SyfoN</title>
        <link href="https://fonts.googleapis.com/css?family=Nunito|Poor+Story" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <script src="https://unpkg.com/vue"></script>
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
                <div id="tables">
                    <h2>Timetable</h2>
                    <button class="edit">時間割作成・編集</button>
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
                                    <tr>
                                        <th></th>
                                        <th>月</th>
                                        <th>火</th>
                                        <th>水</th>
                                        <th>木</th>
                                        <th>金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.zenki1.monday.period1.name}} {{table.zenki1.monday.period1.教室}}
                                            <button v-if="!(table.zenki1.monday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period1.name}} {{table.zenki1.tuesday.period1.教室}}
                                            <button v-if="!(table.zenki1.tuesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period1.name}} {{table.zenki1.wednesday.period1.教室}}
                                            <button v-if="!(table.zenki1.wednesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period1.name}} {{table.zenki1.thursday.period1.教室}}
                                            <button v-if="!(table.zenki1.thursday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period1.name}} {{table.zenki1.fryday.period1.教室}}
                                            <button v-if="!(table.zenki1.fryday.period1.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.zenki1.monday.period2.name}} {{table.zenki1.monday.period2.教室}}
                                            <button v-if="!(table.zenki1.monday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period2.name}} {{table.zenki1.tuesday.period2.教室}}
                                            <button v-if="!(table.zenki1.tuesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period2.name}} {{table.zenki1.wednesday.period2.教室}}
                                            <button v-if="!(table.zenki1.wednesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period2.name}} {{table.zenki1.thursday.period2.教室}}
                                            <button v-if="!(table.zenki1.thursday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period2.name}} {{table.zenki1.fryday.period2.教室}}
                                            <button v-if="!(table.zenki1.fryday.period2.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.zenki1.monday.period3.name}} {{table.zenki1.monday.period3.教室}}
                                            <button v-if="!(table.zenki1.monday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period3.name}} {{table.zenki1.tuesday.period3.教室}}
                                            <button v-if="!(table.zenki1.tuesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period3.name}} {{table.zenki1.wednesday.period3.教室}}
                                            <button v-if="!(table.zenki1.wednesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period3.name}} {{table.zenki1.thursday.period3.教室}}
                                            <button v-if="!(table.zenki1.thursday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period3.name}} {{table.zenki1.fryday.period3.教室}}
                                            <button v-if="!(table.zenki1.fryday.period3.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.zenki1.monday.period4.name}} {{table.zenki1.monday.period4.教室}}
                                            <button v-if="!(table.zenki1.monday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period4.name}} {{table.zenki1.tuesday.period4.教室}}
                                            <button v-if="!(table.zenki1.tuesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period4.name}} {{table.zenki1.wednesday.period4.教室}}
                                            <button v-if="!(table.zenki1.wednesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period4.name}} {{table.zenki1.thursday.period4.教室}}
                                            <button v-if="!(table.zenki1.thursday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period4.name}} {{table.zenki1.fryday.period4.教室}}
                                            <button v-if="!(table.zenki1.fryday.period4.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.zenki1.monday.period5.name}} {{table.zenki1.monday.period5.教室}}
                                            <button v-if="!(table.zenki1.monday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.tuesday.period5.name}} {{table.zenki1.tuesday.period5.教室}}
                                            <button v-if="!(table.zenki1.tuesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.wednesday.period5.name}} {{table.zenki1.wednesday.period5.教室}}
                                            <button v-if="!(table.zenki1.wednesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.thursday.period5.name}} {{table.zenki1.thursday.period5.教室}}
                                            <button v-if="!(table.zenki1.thursday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki1.fryday.period5.name}} {{table.zenki1.fryday.period5.教室}}
                                            <button v-if="!(table.zenki1.fryday.period5.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="zen2_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr>
                                        <th></th>
                                        <th>月</th>
                                        <th>火</th>
                                        <th>水</th>
                                        <th>木</th>
                                        <th>金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.zenki2.monday.period1.name}} {{table.zenki2.monday.period1.教室}}
                                            <button v-if="!(table.zenki2.monday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period1.name}} {{table.zenki2.tuesday.period1.教室}}
                                            <button v-if="!(table.zenki2.tuesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period1.name}} {{table.zenki2.wednesday.period1.教室}}
                                            <button v-if="!(table.zenki2.wednesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period1.name}} {{table.zenki2.thursday.period1.教室}}
                                            <button v-if="!(table.zenki2.thursday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period1.name}} {{table.zenki2.fryday.period1.教室}}
                                            <button v-if="!(table.zenki2.fryday.period1.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.zenki2.monday.period2.name}} {{table.zenki2.monday.period2.教室}}
                                            <button v-if="!(table.zenki2.monday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period2.name}} {{table.zenki2.tuesday.period2.教室}}
                                            <button v-if="!(table.zenki2.tuesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period2.name}} {{table.zenki2.wednesday.period2.教室}}
                                            <button v-if="!(table.zenki2.wednesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period2.name}} {{table.zenki2.thursday.period2.教室}}
                                            <button v-if="!(table.zenki2.thursday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period2.name}} {{table.zenki2.fryday.period2.教室}}
                                            <button v-if="!(table.zenki2.fryday.period2.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.zenki2.monday.period3.name}} {{table.zenki2.monday.period3.教室}}
                                            <button v-if="!(table.zenki2.monday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period3.name}} {{table.zenki2.tuesday.period3.教室}}
                                            <button v-if="!(table.zenki2.tuesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period3.name}} {{table.zenki2.wednesday.period3.教室}}
                                            <button v-if="!(table.zenki2.wednesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period3.name}} {{table.zenki2.thursday.period3.教室}}
                                            <button v-if="!(table.zenki2.thursday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period3.name}} {{table.zenki2.fryday.period3.教室}}
                                            <button v-if="!(table.zenki2.fryday.period3.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.zenki2.monday.period4.name}} {{table.zenki2.monday.period4.教室}}
                                            <button v-if="!(table.zenki2.monday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period4.name}} {{table.zenki2.tuesday.period4.教室}}
                                            <button v-if="!(table.zenki2.tuesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period4.name}} {{table.zenki2.wednesday.period4.教室}}
                                            <button v-if="!(table.zenki2.wednesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period4.name}} {{table.zenki2.thursday.period4.教室}}
                                            <button v-if="!(table.zenki2.thursday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period4.name}} {{table.zenki2.fryday.period4.教室}}
                                            <button v-if="!(table.zenki2.fryday.period4.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.zenki2.monday.period5.name}} {{table.zenki2.monday.period5.教室}}
                                            <button v-if="!(table.zenki2.monday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.tuesday.period5.name}} {{table.zenki2.tuesday.period5.教室}}
                                            <button v-if="!(table.zenki2.tuesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.wednesday.period5.name}} {{table.zenki2.wednesday.period5.教室}}
                                            <button v-if="!(table.zenki2.wednesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.thursday.period5.name}} {{table.zenki2.thursday.period5.教室}}
                                            <button v-if="!(table.zenki2.thursday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki2.fryday.period5.name}} {{table.zenki2.fryday.period5.教室}}
                                            <button v-if="!(table.zenki2.fryday.period5.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="zen3_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr>
                                        <th></th>
                                        <th>月</th>
                                        <th>火</th>
                                        <th>水</th>
                                        <th>木</th>
                                        <th>金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.zenki3.monday.period1.name}} {{table.zenki3.monday.period1.教室}}
                                            <button v-if="!(table.zenki3.monday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period1.name}} {{table.zenki3.tuesday.period1.教室}}
                                            <button v-if="!(table.zenki3.tuesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period1.name}} {{table.zenki3.wednesday.period1.教室}}
                                            <button v-if="!(table.zenki3.wednesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period1.name}} {{table.zenki3.thursday.period1.教室}}
                                            <button v-if="!(table.zenki3.thursday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period1.name}} {{table.zenki3.fryday.period1.教室}}
                                            <button v-if="!(table.zenki3.fryday.period1.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.zenki3.monday.period2.name}} {{table.zenki3.monday.period2.教室}}
                                            <button v-if="!(table.zenki3.monday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period2.name}} {{table.zenki3.tuesday.period2.教室}}
                                            <button v-if="!(table.zenki3.tuesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period2.name}} {{table.zenki3.wednesday.period2.教室}}
                                            <button v-if="!(table.zenki3.wednesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period2.name}} {{table.zenki3.thursday.period2.教室}}
                                            <button v-if="!(table.zenki3.thursday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period2.name}} {{table.zenki3.fryday.period2.教室}}
                                            <button v-if="!(table.zenki3.fryday.period2.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.zenki3.monday.period3.name}} {{table.zenki3.monday.period3.教室}}
                                            <button v-if="!(table.zenki3.monday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period3.name}} {{table.zenki3.tuesday.period3.教室}}
                                            <button v-if="!(table.zenki3.tuesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period3.name}} {{table.zenki3.wednesday.period3.教室}}
                                            <button v-if="!(table.zenki3.wednesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period3.name}} {{table.zenki3.thursday.period3.教室}}
                                            <button v-if="!(table.zenki3.thursday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period3.name}} {{table.zenki3.fryday.period3.教室}}
                                            <button v-if="!(table.zenki3.fryday.period3.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.zenki3.monday.period4.name}} {{table.zenki3.monday.period4.教室}}
                                            <button v-if="!(table.zenki3.monday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period4.name}} {{table.zenki3.tuesday.period4.教室}}
                                            <button v-if="!(table.zenki3.tuesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period4.name}} {{table.zenki3.wednesday.period4.教室}}
                                            <button v-if="!(table.zenki3.wednesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period4.name}} {{table.zenki3.thursday.period4.教室}}
                                            <button v-if="!(table.zenki3.thursday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period4.name}} {{table.zenki3.fryday.period4.教室}}
                                            <button v-if="!(table.zenki3.fryday.period4.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.zenki3.monday.period5.name}} {{table.zenki3.monday.period5.教室}}
                                            <button v-if="!(table.zenki3.monday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.tuesday.period5.name}} {{table.zenki3.tuesday.period5.教室}}
                                            <button v-if="!(table.zenki3.tuesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.wednesday.period5.name}} {{table.zenki3.wednesday.period5.教室}}
                                            <button v-if="!(table.zenki3.wednesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.thursday.period5.name}} {{table.zenki3.thursday.period5.教室}}
                                            <button v-if="!(table.zenki3.thursday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki3.fryday.period5.name}} {{table.zenki3.fryday.period5.教室}}
                                            <button v-if="!(table.zenki3.fryday.period5.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="zen4_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr>
                                        <th></th>
                                        <th>月</th>
                                        <th>火</th>
                                        <th>水</th>
                                        <th>木</th>
                                        <th>金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.zenki4.monday.period1.name}} {{table.zenki4.monday.period1.教室}}
                                            <button v-if="!(table.zenki4.monday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period1.name}} {{table.zenki4.tuesday.period1.教室}}
                                            <button v-if="!(table.zenki4.tuesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period1.name}} {{table.zenki4.wednesday.period1.教室}}
                                            <button v-if="!(table.zenki4.wednesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period1.name}} {{table.zenki4.thursday.period1.教室}}
                                            <button v-if="!(table.zenki4.thursday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period1.name}} {{table.zenki4.fryday.period1.教室}}
                                            <button v-if="!(table.zenki4.fryday.period1.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.zenki4.monday.period2.name}} {{table.zenki4.monday.period2.教室}}
                                            <button v-if="!(table.zenki4.monday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period2.name}} {{table.zenki4.tuesday.period2.教室}}
                                            <button v-if="!(table.zenki4.tuesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period2.name}} {{table.zenki4.wednesday.period2.教室}}
                                            <button v-if="!(table.zenki4.wednesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period2.name}} {{table.zenki4.thursday.period2.教室}}
                                            <button v-if="!(table.zenki4.thursday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period2.name}} {{table.zenki4.fryday.period2.教室}}
                                            <button v-if="!(table.zenki4.fryday.period2.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.zenki4.monday.period3.name}} {{table.zenki4.monday.period3.教室}}
                                            <button v-if="!(table.zenki4.monday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period3.name}} {{table.zenki4.tuesday.period3.教室}}
                                            <button v-if="!(table.zenki4.tuesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period3.name}} {{table.zenki4.wednesday.period3.教室}}
                                            <button v-if="!(table.zenki4.wednesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period3.name}} {{table.zenki4.thursday.period3.教室}}
                                            <button v-if="!(table.zenki4.thursday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period3.name}} {{table.zenki4.fryday.period3.教室}}
                                            <button v-if="!(table.zenki4.fryday.period3.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.zenki4.monday.period4.name}} {{table.zenki4.monday.period4.教室}}
                                            <button v-if="!(table.zenki4.monday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period4.name}} {{table.zenki4.tuesday.period4.教室}}
                                            <button v-if="!(table.zenki4.tuesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period4.name}} {{table.zenki4.wednesday.period4.教室}}
                                            <button v-if="!(table.zenki4.wednesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period4.name}} {{table.zenki4.thursday.period4.教室}}
                                            <button v-if="!(table.zenki4.thursday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period4.name}} {{table.zenki4.fryday.period4.教室}}
                                            <button v-if="!(table.zenki4.fryday.period4.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.zenki4.monday.period5.name}} {{table.zenki4.monday.period5.教室}}
                                            <button v-if="!(table.zenki4.monday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.tuesday.period5.name}} {{table.zenki4.tuesday.period5.教室}}
                                            <button v-if="!(table.zenki4.tuesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.wednesday.period5.name}} {{table.zenki4.wednesday.period5.教室}}
                                            <button v-if="!(table.zenki4.wednesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.thursday.period5.name}} {{table.zenki4.thursday.period5.教室}}
                                            <button v-if="!(table.zenki4.thursday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.zenki4.fryday.period5.name}} {{table.zenki4.fryday.period5.教室}}
                                            <button v-if="!(table.zenki4.fryday.period5.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="kou1_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr>
                                        <th></th>
                                        <th>月</th>
                                        <th>火</th>
                                        <th>水</th>
                                        <th>木</th>
                                        <th>金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.kouki1.monday.period1.name}} {{table.kouki1.monday.period1.教室}}
                                            <button v-if="!(table.kouki1.monday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period1.name}} {{table.kouki1.tuesday.period1.教室}}
                                            <button v-if="!(table.kouki1.tuesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period1.name}} {{table.kouki1.wednesday.period1.教室}}
                                            <button v-if="!(table.kouki1.wednesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period1.name}} {{table.kouki1.thursday.period1.教室}}
                                            <button v-if="!(table.kouki1.thursday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period1.name}} {{table.kouki1.fryday.period1.教室}}
                                            <button v-if="!(table.kouki1.fryday.period1.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.kouki1.monday.period2.name}} {{table.kouki1.monday.period2.教室}}
                                            <button v-if="!(table.kouki1.monday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period2.name}} {{table.kouki1.tuesday.period2.教室}}
                                            <button v-if="!(table.kouki1.tuesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period2.name}} {{table.kouki1.wednesday.period2.教室}}
                                            <button v-if="!(table.kouki1.wednesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period2.name}} {{table.kouki1.thursday.period2.教室}}
                                            <button v-if="!(table.kouki1.thursday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period2.name}} {{table.kouki1.fryday.period2.教室}}
                                            <button v-if="!(table.kouki1.fryday.period2.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.kouki1.monday.period3.name}} {{table.kouki1.monday.period3.教室}}
                                            <button v-if="!(table.kouki1.monday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period3.name}} {{table.kouki1.tuesday.period3.教室}}
                                            <button v-if="!(table.kouki1.tuesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period3.name}} {{table.kouki1.wednesday.period3.教室}}
                                            <button v-if="!(table.kouki1.wednesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period3.name}} {{table.kouki1.thursday.period3.教室}}
                                            <button v-if="!(table.kouki1.thursday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period3.name}} {{table.kouki1.fryday.period3.教室}}
                                            <button v-if="!(table.kouki1.fryday.period3.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.kouki1.monday.period4.name}} {{table.kouki1.monday.period4.教室}}
                                            <button v-if="!(table.kouki1.monday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period4.name}} {{table.kouki1.tuesday.period4.教室}}
                                            <button v-if="!(table.kouki1.tuesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period4.name}} {{table.kouki1.wednesday.period4.教室}}
                                            <button v-if="!(table.kouki1.wednesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period4.name}} {{table.kouki1.thursday.period4.教室}}
                                            <button v-if="!(table.kouki1.thursday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period4.name}} {{table.kouki1.fryday.period4.教室}}
                                            <button v-if="!(table.kouki1.fryday.period4.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.kouki1.monday.period5.name}} {{table.kouki1.monday.period5.教室}}
                                            <button v-if="!(table.kouki1.monday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.tuesday.period5.name}} {{table.kouki1.tuesday.period5.教室}}
                                            <button v-if="!(table.kouki1.tuesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.wednesday.period5.name}} {{table.kouki1.wednesday.period5.教室}}
                                            <button v-if="!(table.kouki1.wednesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.thursday.period5.name}} {{table.kouki1.thursday.period5.教室}}
                                            <button v-if="!(table.kouki1.thursday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki1.fryday.period5.name}} {{table.kouki1.fryday.period5.教室}}
                                            <button v-if="!(table.kouki1.fryday.period5.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="kou2_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr>
                                        <th></th>
                                        <th>月</th>
                                        <th>火</th>
                                        <th>水</th>
                                        <th>木</th>
                                        <th>金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.kouki2.monday.period1.name}} {{table.kouki2.monday.period1.教室}}
                                            <button v-if="!(table.kouki2.monday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period1.name}} {{table.kouki2.tuesday.period1.教室}}
                                            <button v-if="!(table.kouki2.tuesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period1.name}} {{table.kouki2.wednesday.period1.教室}}
                                            <button v-if="!(table.kouki2.wednesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period1.name}} {{table.kouki2.thursday.period1.教室}}
                                            <button v-if="!(table.kouki2.thursday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period1.name}} {{table.kouki2.fryday.period1.教室}}
                                            <button v-if="!(table.kouki2.fryday.period1.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.kouki2.monday.period2.name}} {{table.kouki2.monday.period2.教室}}
                                            <button v-if="!(table.kouki2.monday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period2.name}} {{table.kouki2.tuesday.period2.教室}}
                                            <button v-if="!(table.kouki2.tuesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period2.name}} {{table.kouki2.wednesday.period2.教室}}
                                            <button v-if="!(table.kouki2.wednesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period2.name}} {{table.kouki2.thursday.period2.教室}}
                                            <button v-if="!(table.kouki2.thursday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period2.name}} {{table.kouki2.fryday.period2.教室}}
                                            <button v-if="!(table.kouki2.fryday.period2.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.kouki2.monday.period3.name}} {{table.kouki2.monday.period3.教室}}
                                            <button v-if="!(table.kouki2.monday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period3.name}} {{table.kouki2.tuesday.period3.教室}}
                                            <button v-if="!(table.kouki2.tuesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period3.name}} {{table.kouki2.wednesday.period3.教室}}
                                            <button v-if="!(table.kouki2.wednesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period3.name}} {{table.kouki2.thursday.period3.教室}}
                                            <button v-if="!(table.kouki2.thursday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period3.name}} {{table.kouki2.fryday.period3.教室}}
                                            <button v-if="!(table.kouki2.fryday.period3.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.kouki2.monday.period4.name}} {{table.kouki2.monday.period4.教室}}
                                            <button v-if="!(table.kouki2.monday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period4.name}} {{table.kouki2.tuesday.period4.教室}}
                                            <button v-if="!(table.kouki2.tuesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period4.name}} {{table.kouki2.wednesday.period4.教室}}
                                            <button v-if="!(table.kouki2.wednesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period4.name}} {{table.kouki2.thursday.period4.教室}}
                                            <button v-if="!(table.kouki2.thursday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period4.name}} {{table.kouki2.fryday.period4.教室}}
                                            <button v-if="!(table.kouki2.fryday.period4.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.kouki2.monday.period5.name}} {{table.kouki2.monday.period5.教室}}
                                            <button v-if="!(table.kouki2.monday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.tuesday.period5.name}} {{table.kouki2.tuesday.period5.教室}}
                                            <button v-if="!(table.kouki2.tuesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.wednesday.period5.name}} {{table.kouki2.wednesday.period5.教室}}
                                            <button v-if="!(table.kouki2.wednesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.thursday.period5.name}} {{table.kouki2.thursday.period5.教室}}
                                            <button v-if="!(table.kouki2.thursday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki2.fryday.period5.name}} {{table.kouki2.fryday.period5.教室}}
                                            <button v-if="!(table.kouki2.fryday.period5.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="kou3_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr>
                                        <th></th>
                                        <th>月</th>
                                        <th>火</th>
                                        <th>水</th>
                                        <th>木</th>
                                        <th>金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.kouki3.monday.period1.name}} {{table.kouki3.monday.period1.教室}}
                                            <button v-if="!(table.kouki3.monday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period1.name}} {{table.kouki3.tuesday.period1.教室}}
                                            <button v-if="!(table.kouki3.tuesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period1.name}} {{table.kouki3.wednesday.period1.教室}}
                                            <button v-if="!(table.kouki3.wednesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period1.name}} {{table.kouki3.thursday.period1.教室}}
                                            <button v-if="!(table.kouki3.thursday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period1.name}} {{table.kouki3.fryday.period1.教室}}
                                            <button v-if="!(table.kouki3.fryday.period1.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.kouki3.monday.period2.name}} {{table.kouki3.monday.period2.教室}}
                                            <button v-if="!(table.kouki3.monday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period2.name}} {{table.kouki3.tuesday.period2.教室}}
                                            <button v-if="!(table.kouki3.tuesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period2.name}} {{table.kouki3.wednesday.period2.教室}}
                                            <button v-if="!(table.kouki3.wednesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period2.name}} {{table.kouki3.thursday.period2.教室}}
                                            <button v-if="!(table.kouki3.thursday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period2.name}} {{table.kouki3.fryday.period2.教室}}
                                            <button v-if="!(table.kouki3.fryday.period2.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.kouki3.monday.period3.name}} {{table.kouki3.monday.period3.教室}}
                                            <button v-if="!(table.kouki3.monday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period3.name}} {{table.kouki3.tuesday.period3.教室}}
                                            <button v-if="!(table.kouki3.tuesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period3.name}} {{table.kouki3.wednesday.period3.教室}}
                                            <button v-if="!(table.kouki3.wednesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period3.name}} {{table.kouki3.thursday.period3.教室}}
                                            <button v-if="!(table.kouki3.thursday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period3.name}} {{table.kouki3.fryday.period3.教室}}
                                            <button v-if="!(table.kouki3.fryday.period3.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.kouki3.monday.period4.name}} {{table.kouki3.monday.period4.教室}}
                                            <button v-if="!(table.kouki3.monday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period4.name}} {{table.kouki3.tuesday.period4.教室}}
                                            <button v-if="!(table.kouki3.tuesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period4.name}} {{table.kouki3.wednesday.period4.教室}}
                                            <button v-if="!(table.kouki3.wednesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period4.name}} {{table.kouki3.thursday.period4.教室}}
                                            <button v-if="!(table.kouki3.thursday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period4.name}} {{table.kouki3.fryday.period4.教室}}
                                            <button v-if="!(table.kouki3.fryday.period4.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.kouki3.monday.period5.name}} {{table.kouki3.monday.period5.教室}}
                                            <button v-if="!(table.kouki3.monday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.tuesday.period5.name}} {{table.kouki3.tuesday.period5.教室}}
                                            <button v-if="!(table.kouki3.tuesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.wednesday.period5.name}} {{table.kouki3.wednesday.period5.教室}}
                                            <button v-if="!(table.kouki3.wednesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.thursday.period5.name}} {{table.kouki3.thursday.period5.教室}}
                                            <button v-if="!(table.kouki3.thursday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki3.fryday.period5.name}} {{table.kouki3.fryday.period5.教室}}
                                            <button v-if="!(table.kouki3.fryday.period5.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="tab_content" id="kou4_content">
                            <div class="tab_content_description">
                                <table border="1">
                                    <tr>
                                        <th></th>
                                        <th>月</th>
                                        <th>火</th>
                                        <th>水</th>
                                        <th>木</th>
                                        <th>金</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>

                                        <td>
                                            {{table.kouki4.monday.period1.name}} {{table.kouki4.monday.period1.教室}}
                                            <button v-if="!(table.kouki4.monday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period1.name}} {{table.kouki4.tuesday.period1.教室}}
                                            <button v-if="!(table.kouki4.tuesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period1.name}} {{table.kouki4.wednesday.period1.教室}}
                                            <button v-if="!(table.kouki4.wednesday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period1.name}} {{table.kouki4.thursday.period1.教室}}
                                            <button v-if="!(table.kouki4.thursday.period1.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period1.name}} {{table.kouki4.fryday.period1.教室}}
                                            <button v-if="!(table.kouki4.fryday.period1.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            {{table.kouki4.monday.period2.name}} {{table.kouki4.monday.period2.教室}}
                                            <button v-if="!(table.kouki4.monday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period2.name}} {{table.kouki4.tuesday.period2.教室}}
                                            <button v-if="!(table.kouki4.tuesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period2.name}} {{table.kouki4.wednesday.period2.教室}}
                                            <button v-if="!(table.kouki4.wednesday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period2.name}} {{table.kouki4.thursday.period2.教室}}
                                            <button v-if="!(table.kouki4.thursday.period2.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period2.name}} {{table.kouki4.fryday.period2.教室}}
                                            <button v-if="!(table.kouki4.fryday.period2.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>
                                            {{table.kouki4.monday.period3.name}} {{table.kouki4.monday.period3.教室}}
                                            <button v-if="!(table.kouki4.monday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period3.name}} {{table.kouki4.tuesday.period3.教室}}
                                            <button v-if="!(table.kouki4.tuesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period3.name}} {{table.kouki4.wednesday.period3.教室}}
                                            <button v-if="!(table.kouki4.wednesday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period3.name}} {{table.kouki4.thursday.period3.教室}}
                                            <button v-if="!(table.kouki4.thursday.period3.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period3.name}} {{table.kouki4.fryday.period3.教室}}
                                            <button v-if="!(table.kouki4.fryday.period3.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>
                                            {{table.kouki4.monday.period4.name}} {{table.kouki4.monday.period4.教室}}
                                            <button v-if="!(table.kouki4.monday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period4.name}} {{table.kouki4.tuesday.period4.教室}}
                                            <button v-if="!(table.kouki4.tuesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period4.name}} {{table.kouki4.wednesday.period4.教室}}
                                            <button v-if="!(table.kouki4.wednesday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period4.name}} {{table.kouki4.thursday.period4.教室}}
                                            <button v-if="!(table.kouki4.thursday.period4.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period4.name}} {{table.kouki4.fryday.period4.教室}}
                                            <button v-if="!(table.kouki4.fryday.period4.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>
                                            {{table.kouki4.monday.period5.name}} {{table.kouki4.monday.period5.教室}}
                                            <button v-if="!(table.kouki4.monday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.tuesday.period5.name}} {{table.kouki4.tuesday.period5.教室}}
                                            <button v-if="!(table.kouki4.tuesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.wednesday.period5.name}} {{table.kouki4.wednesday.period5.教室}}
                                            <button v-if="!(table.kouki4.wednesday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.thursday.period5.name}} {{table.kouki4.thursday.period5.教室}}
                                            <button v-if="!(table.kouki4.thursday.period5.id==null)">詳細</button>
                                        </td>
                                        <td>
                                            {{table.kouki4.fryday.period5.name}} {{table.kouki4.fryday.period5.教室}}
                                            <button v-if="!(table.kouki4.fryday.period5.id==null)">詳細</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="panel">
                    <div id="progres1">
                        <h3>進級まで</h3>
                        <div id="probar1"></div>
                        <p>70/108</p>
                        <p>英語：あと1単位　人科：あと0単位　必修：あと2単位</p>
                    </div>
                    <div id="progres2">
                        <h3>卒業まで</h3>
                        <div id="probar2"></div>
                        <p>5/124</p>
                        <p>英語：あと5単位　人科：あと16単位　必修：あと2単位</p>
                        <h4>ユニット取得状況</h4>
                        <p>プログラミング：0/6</p>
                        <p>プログラミング：0/6</p>
                        <p>プログラミング：0/6</p>
                        <p>プログラミング：0/6</p>
                        <p>プログラミング：0/6</p>
                        <p>プログラミング：0/6</p>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var app = new Vue({
                el: '#app',
                data: {
                    table: '',
                    units: '',
                    needs: '',
                    test: 'unko'
                },
                methods: {

                },
                mounted(){
                    const self = this
                    console.log("hello")
                    this.table='<%= session.getAttribute("lectureList")%>'
                    this.table=JSON.parse(this.table);
                    console.log(this.table)
                }
            })
        </script>
        <style scoped>
            #app {
                width: 100vw;
                height: 100vh;
                background: #FFEFBA;
                margin: 0px;
                position: absolute;
                top: 0;
                left: 0;
                font-family: "Rounded Mplus 1c",'Nunito', sans-serif;
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
                box-shadow: 6px 6px 6px rgba(0,0,0,0.4);
            }

            #mcontent {
                width: 100vw;
                height: 100vh;
                margin: 0;
                padding: 0px;
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
                width: 60%;
                height: 100%;
                padding-top: 100px;
                margin: 0;
                float: left;
            }

            #panel {
                padding-top: 100px;
                right: 0;
                width: 40%;
                height: 100%;
                margin: 0;

                float: right;
            }

            #progres1 {
                margin-top: 5%;
                display: block;
                height: 30%;
                width: 100%;
                clear: both;
            }

            #progres2 {
                display: block;
                height: 60%;
                width: 100%;
                clear: both;
            }

            #unit {
                display: block;
                height: 30%;
                width: 100%;
            }
            h1{
                margin:20px;
                font-size: 3em;
                font-family: 'Poor Story', cursive;
                color: #EEE;
            }
            h2{
                font-size: 2em;
                float: left;
                margin :30px;
            }
            h3{

            }
            h4{

            }
            .edit{
                clear: both;
            }

            /*タブ切り替え全体のスタイル*/

            .tabs {
                margin-top: 50px;
                padding-bottom: 40px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                width: 90%;
                height: 70%;
                margin: 50 auto;
                clear: both;
            }

            /*タブのスタイル*/

            .tab_item {
                width: calc(100%/8);
                height: 50px;
                border-bottom: 3px solid #5ab4bd;
                background-color: #d9d9d9;
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
                background-color: #5ab4bd;
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
                font-size: 14px;
                color: #fff;
                -webkit-transition: all .8s;
                transition: all .8s;
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
                background: #555555;
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