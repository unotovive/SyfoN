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
                            <span class="five">月</span>
                            <span class="five">火</span>
                            <span class="five">水</span>
                            <span class="five">木</span>
                            <span class="five">金</span>
                            <div class="tab_content_description">
                                <div class="row" v-for="yobi in table.zenki1">
                                    <div class="data" v-for="clas in yobi">
                                        <box :clas="clas" @setting="set(clas,$event)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab_content" id="zen2_content">
                            <span class="five">月</span>
                            <span class="five">火</span>
                            <span class="five">水</span>
                            <span class="five">木</span>
                            <span class="five">金</span>
                            <div class="tab_content_description">
                                <div class="row" v-for="yobi in table.zenki1">
                                    <div class="data" v-for="clas in yobi">
                                        <box :clas="clas" @setting="set(clas,$event)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab_content" id="zen3_content">
                            <span class="five">月</span>
                            <span class="five">火</span>
                            <span class="five">水</span>
                            <span class="five">木</span>
                            <span class="five">金</span>
                            <div class="tab_content_description">
                                <div class="row" v-for="yobi in table.zenki1">
                                    <div class="data" v-for="clas in yobi">
                                        <box :clas="clas" @setting="set(clas,$event)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab_content" id="zen4_content">
                            <span class="five">月</span>
                            <span class="five">火</span>
                            <span class="five">水</span>
                            <span class="five">木</span>
                            <span class="five">金</span>
                            <div class="tab_content_description">
                                <div class="row" v-for="yobi in table.zenki1">
                                    <div class="data" v-for="clas in yobi">
                                        <box :clas="clas" @setting="set(clas,$event)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab_content" id="kou1_content">
                            <span class="five">月</span>
                            <span class="five">火</span>
                            <span class="five">水</span>
                            <span class="five">木</span>
                            <span class="five">金</span>
                            <div class="tab_content_description">
                                <div class="row" v-for="yobi in table.zenki1">
                                    <div class="data" v-for="clas in yobi">
                                        <box :clas="clas" @setting="set(clas,$event)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab_content" id="kou2_content">
                            <span class="five">月</span>
                            <span class="five">火</span>
                            <span class="five">水</span>
                            <span class="five">木</span>
                            <span class="five">金</span>
                            <div class="tab_content_description">
                                <div class="row" v-for="yobi in table.zenki1">
                                    <div class="data" v-for="clas in yobi">
                                        <box :clas="clas" @setting="set(clas,$event)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab_content" id="kou3_content">
                            <span class="five">月</span>
                            <span class="five">火</span>
                            <span class="five">水</span>
                            <span class="five">木</span>
                            <span class="five">金</span>
                            <div class="tab_content_description">
                                <div class="row" v-for="yobi in table.zenki1">
                                    <div class="data" v-for="clas in yobi">
                                        <box :clas="clas" @setting="set(clas,$event)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab_content" id="kou4_content">
                            <span class="five">月</span>
                            <span class="five">火</span>
                            <span class="five">水</span>
                            <span class="five">木</span>
                            <span class="five">金</span>
                            <div class="tab_content_description">
                                <div class="row" v-for="yobi in table.zenki1">
                                    <div class="data" v-for="clas in yobi">
                                        <box :clas="clas" @setting="set(clas,$event)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="panel">
                    <div id="progres1">
                        <h3>進級まで</h3>
                        <div id="probar1"></div>
                        <p>{{numTwoSum}}/24</p>
                        <p>英語：あと{{numEngTwoSum}}単位　人科：あと{{numHumTwoSum}}単位　必修：あと{{numMusTwoSum}}単位</p>
                        <h3>進級まで</h3>
                        <div id="probar1"></div>
                        <p>{{numForSum}}/108</p>
                        <p>英語：あと{{numEngForSum}}単位　人科：あと{{numHumForSum}}単位　必修：あと{{numMusForSum}}単位</p>
                    </div>
                    <div id="progres2">
                        <h3>卒業まで</h3>
                        <div id="probar2"></div>
                        <p>{{numAllSum}}/124</p>
                        <p>英語：あと{{numEngAllSum}}単位　人科：あと{{numHumAllSum}}単位　必修：あと{{numMusAllSum}}単位</p>
                        <h4>ユニット取得状況</h4>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const Selector = {
                template:
                    '<div><select v-model="selected"><option v-for="csc in clas.csc" v-bind:value="csc">{{csc.name}}</option></select><button @click="set(selected)">選択</button></div>'
                ,
                props: ['clas'],
                data: function () {
                    return {
                        selected: ''
                    }
                },
                methods: {
                    set(nclas) {
                        console.log(nclas)
                        this.$emit('setting', nclas)
                    }
                }
            }
            const Box = {
                template:
                    '<div>{{clas.name}}<br>{{clas.taninum}}<span>単位</span><br><selector :clas="clas" @setting="set"/></div>'
                ,
                components: {
                    Selector
                },
                props: ['clas'],
                data: function () {
                    return {
                    }
                },
                methods: {
                    set(nclas) {
                        console.log(nclas)
                        this.$emit('setting', nclas, this.clas)
                    }
                }
            }
            var app = new Vue({
                el: '#app',
                components: {
                    Box,
                },
                data: {
                    selected: '',
                    strnull: "",
                    table: '',
                    units: '',
                    needs: '',
                    csc: '',
                    cd: '',
                    items: '',
                    test: 'unko',
                    numAllSum: 0,
                    numEngAllSum: 0,
                    numHumAllSum: 0,
                    numMusAllSum: 0,
                    numTwoSum: 0,
                    numEngTwoSum: 0,
                    numHumTwoSum: 0,
                    numMusTwoSum: 0,
                    numForSum: 0,
                    numEngForSum: 0,
                    numHumForSum: 0,
                    numMusForSum: 0
                },
                methods: {
                    itemset(clas) {
                        this.items = clas.csc;
                    },
                    setItem(item) {
                        clas = item
                    },
                    set(clas, nclas) {
                        console.log(clas)
                        console.log(nclas)
                        clas.name = nclas.name
                        clas.id = nclas.id
                        clas.room = nclas.room
                        clas.taninum = nclas.taninum
                        this.rerun()
                    },
                    rerun() {
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
                        for (term in this.table) {
                                for (yobi in this.table[`${term}`]) {
                                    for (clas in this.table[`${term}`][`${yobi}`]) {
                                        numAllSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                        console.log(term)
                                        if ((term == "zenki1") || (term == "kouki1")) {
                                                numTwoSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                        if (!(term == "zenki4") && !(term == "kouki4")) {
                                            numForSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                        }

                                        if (this.table[`${term}`][`${yobi}`][`${clas}`].type == "eng") {
                                            numEngAllSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            if ((term == "zenki1") || (term == "kouki1")) {
                                                numEngTwoSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                            if (!(term == "zenki4") || !(term == "kouki4")) {
                                                numEngForSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                        }
                                        if (this.table[`${term}`][`${yobi}`][`${clas}`].type == "must") {
                                            numHumAllSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            if ((term == "zenki1") || (term == "kouki1")) {
                                                numHumTwoSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                            if (!(term == "zenki4") || !(term == "kouki4")) {
                                                numHumForSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                        }
                                        if (this.table[`${term}`][`${yobi}`][`${clas}`].type == "human") {
                                            numMusAllSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            if ((term == "zenki1") || (term == "kouki1")) {
                                                numMusTwoSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                            if (!(term == "zenki4") || !(term == "kouki4")) {
                                                numMusForSum += this.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                        }
                                    }
                                }
                            }
                            this.numAllSum = numAllSum;
                            this.numEngAllSum = numEngAllSum;
                            this.numHumAllSum = numHumAllSum;
                            this.numMusAllSum = numMusAllSum;

                            this.numTwoSum = numTwoSum;
                            this.numEngTwoSum = numEngTwoSum;
                            this.numHumTwoSum = numHumTwoSum;
                            this.numMusTwoSum = numMusTwoSum;

                            this.numForSum = numForSum;
                            this.numEngForSum = numEngForSum;
                            this.numHumForSum = numHumForSum;
                            this.numMusForSum = numMusForSum;
                    }
                },

                mounted() {
                    const self = this
                    console.log("hello")
                    this.table = '<%= session.getAttribute("lectureList")%>'
                    this.table = JSON.parse(this.table)
                    this.table = this.table.tableconsole.log(this.table)
                    console.log(this.table)

                    this.units = '<%= session.getAttribute("unit")%>'
                    this.units = JSON.parse(this.units)
                    this.units = this.units.units
                    console.log(this.units)

                    this.needs = '<%= session.getAttribute("mustTani")%>'
                    this.needs = JSON.parse(this.needs)
                    this.needs = this.needs.mustTani
                    console.log(this.needs)
                }

                    axios
                        .get('https://api.myjson.com/bins/17nmke')
                        .then(function (res) {
                            self.table = res.data.table;
                            console.log(res.data.table)
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


                            for (term in res.data.table) {
                                for (yobi in res.data.table[`${term}`]) {
                                    for (clas in res.data.table[`${term}`][`${yobi}`]) {
                                        numAllSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                        console.log(term)
                                        if ((term == "zenki1") || (term == "kouki1")) {
                                                numTwoSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                        if (!((term == "zenki4") && (term == "kouki4"))) {
                                            numForSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                        }

                                        if (res.data.table[`${term}`][`${yobi}`][`${clas}`].type == "eng") {
                                            numEngAllSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            if ((term == "zenki1") || (term == "kouki1")) {
                                                numEngTwoSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                            if (!(term == "zenki4") || !(term == "kouki4")) {
                                                numEngForSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                        }
                                        if (res.data.table[`${term}`][`${yobi}`][`${clas}`].type == "must") {
                                            numHumAllSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            if ((term == "zenki1") || (term == "kouki1")) {
                                                numHumTwoSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                            if (!(term == "zenki4") || !(term == "kouki4")) {
                                                numHumForSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                        }
                                        if (res.data.table[`${term}`][`${yobi}`][`${clas}`].type == "human") {
                                            numMusAllSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            if ((term == "zenki1") || (term == "kouki1")) {
                                                numMusTwoSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                            if (!(term == "zenki4") || !(term == "kouki4")) {
                                                numMusForSum += res.data.table[`${term}`][`${yobi}`][`${clas}`].taninum
                                            }
                                        }
                                    }
                                }
                            }
                            self.numAllSum = numAllSum;
                            self.numEngAllSum = numEngAllSum;
                            self.numHumAllSum = numHumAllSum;
                            self.numMusAllSum = numMusAllSum;

                            self.numTwoSum = numTwoSum;
                            self.numEngTwoSum = numEngTwoSum;
                            self.numHumTwoSum = numHumTwoSum;
                            self.numMusTwoSum = numMusTwoSum;

                            self.numForSum = numForSum;
                            self.numEngForSum = numEngForSum;
                            self.numHumForSum = numHumForSum;
                            self.numMusForSum = numMusForSum;
                        })
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
                box-shadow: 6px 6px 6px rgba(0, 0, 0, 0.4);
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

            #progres1 {
                display: block;
                height: 41%;
                width: 80%;
                margin-top: 8%;
                clear: both;
                padding :10px;
                background: #FFF;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                box-sizing: inherit;
            }

            #progres2 {
                display: block;
                height: 38%;
                width: 80%;
                clear: both;
                margin-top: 3%;
                padding :10px;
                background: #FFF;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                box-sizing: inherit;
            }

            #unit {
                display: block;
                height: 30%;
                width: 100%;
            }

            h1 {
                margin: 20px;
                font-size: 3em;
                font-family: 'Poor Story', cursive;
                color: #EEE;
            }

            h2 {
                font-size: 2em;
                float: left;
                margin: 30px;
            }

            h3 {
                font-size:1.5em;
                margin: 10px;
                color: #555555;
            }

            h4 {
                font-size:1.2em;
                margin: 10px;
                color: #555555;
            }
            p{
                margin: 10px;
            }
            .edit {
                clear: both;
            }

            .raw {
                height: calc(100%/5);
            }

            .data {
                width: calc(100%/6);
                float: left;
                border: #7369CB 1px solid;
                box-sizing: inherit;
            }

            .five {
                width: calc(100%/6);
                float: left;
                border: #7369CB 1px solid;
                box-sizing: inherit;
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