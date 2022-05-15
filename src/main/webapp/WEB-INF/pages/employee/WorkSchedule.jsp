<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <c:set var="contextRoot" value="${pageContext.request.contextPath}" />



        <!-- 這個檔案是給你給你複製貼上用的, 請創一個 jsp 檔, 將此檔全部內容複製貼在該 jsp 檔 -->



        <!DOCTYPE html>
        <html lang="en" class="">

        <head>
          <meta charset="utf-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <title>排班系統</title>

          <!-- Tailwind is included -->
          <!-- <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081"> -->
          <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css">
          <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/cssr.css">
          <link rel="apple-touch-icon" sizes="180x180" href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
          <link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png" />
          <link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png" />
          <link rel="mask-icon" href="${contextRoot}/resources/backstage/safari-pinned-tab.svg" color="#00b4b6" />

          <meta name="description" content="Admin One - free Tailwind dashboard">

          <meta property="og:url" content="https://justboil.github.io/admin-one-tailwind/">
          <meta property="og:site_name" content="JustBoil.me">
          <meta property="og:title" content="Admin One HTML">
          <meta property="og:description" content="Admin One - free Tailwind dashboard">
          <meta property="og:image" content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
          <meta property="og:image:type" content="image/png">
          <meta property="og:image:width" content="1920">
          <meta property="og:image:height" content="960">

          <meta property="twitter:card" content="summary_large_image">
          <meta property="twitter:title" content="Admin One HTML">
          <meta property="twitter:description" content="Admin One - free Tailwind dashboard">
          <meta property="twitter:image:src"
            content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
          <meta property="twitter:image:width" content="1920">
          <meta property="twitter:image:height" content="960">
          <style>
            table {
              border: solid 2px rgb(117, 15, 20);
              border-radius: 10px;
              margin-bottom: 0px;
            }

            td {
              border: solid 2px rgb(117, 15, 20);
            }
          </style>
          <!-- 自訂 link, script -->
          <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
          <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

          <!-- Global site tag (gtag.js) - Google Analytics -->
          <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
          <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());
            gtag('config', 'UA-130795909-1');
          </script>

        </head>

        <body>

          <div id="app">

            <!-- 插入上導覽列與左導覽列 -->
            <jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

            <!-- 章節層級 -->
            <section class="is-title-bar">
              <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
                <ul>
                  <li>後台</li>
                  <li>排班</li>
                </ul>
              
              </div>
            </section>

            <!-- 核心內容標題 -->
            <section class="is-hero-bar">
              <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
                <h1 class="title">
                  排班系統
                </h1>
              
              </div>
            </section>
          </div>
          <div style="text-align:center" id="divHidden">
            <h2>選擇排班日期</h1><br>
            <select id="idSelectYear" name="Theyear"></select> <span>年</span>
            <select id="idSelectMonth" name="Themonth"></select> <span>月</span>
            <input type="submit" id="setDate" value="確定" />
            <input type="submit" id="returnDate" value="返回查詢" hidden/>
            <input type="submit" id="newDate" value="新增" hidden />
          </div>

          <div id="divText">

          </div>


          <!-- 插入頁腳 -->
          <jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

          <div id="sample-modal" class="modal">
            <div class="modal-background --jb-modal-close"></div>
            <div class="modal-card">
              <header class="modal-card-head">
                <p class="modal-card-title">Sample modal</p>
              </header>
              <section class="modal-card-body">
                <p>Lorem ipsum dolor sit amet <b>adipiscing elit</b></p>
                <p>This is sample modal</p>
              </section>
              <footer class="modal-card-foot">
                <button class="button --jb-modal-close">Cancel</button>
                <button class="button red --jb-modal-close">Confirm</button>
              </footer>
            </div>
          </div>

          <div id="sample-modal-2" class="modal">
            <div class="modal-background --jb-modal-close"></div>
            <div class="modal-card">
              <header class="modal-card-head">
                <p class="modal-card-title">Sample modal</p>
              </header>
              <section class="modal-card-body">
                <p>Lorem ipsum dolor sit amet <b>adipiscing elit</b></p>
                <p>This is sample modal</p>
              </section>
              <footer class="modal-card-foot">
                <button class="button --jb-modal-close">Cancel</button>
                <button class="button blue --jb-modal-close">Confirm</button>
              </footer>
            </div>
          </div>

          <!-- Scripts below are for demo only -->
          <script type="text/javascript"
            src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>

          <script>
            !function (f, b, e, v, n, t, s) {
              if (f.fbq) return; n = f.fbq = function () {
                n.callMethod ?
                  n.callMethod.apply(n, arguments) : n.queue.push(arguments)
              };
              if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0';
              n.queue = []; t = b.createElement(e); t.async = !0;
              t.src = v; s = b.getElementsByTagName(e)[0];
              s.parentNode.insertBefore(t, s)
            }(window, document, 'script',
              'https://connect.facebook.net/en_US/fbevents.js');
            fbq('init', '658339141622648');
            fbq('track', 'PageView');
          </script>

          <!-- 自訂 JS -->

          <script>
            let h3 = document.querySelector("#h3"); //<h3 id="h3">20</h3>
            let theYear = document.querySelector("#idSelectYear"); // <select id="idSelectYear"></select>
            let theMonth = document.querySelector("#idSelectMonth");
            // let theDate = document.querySelector("#idSelectDate");
            //theYear.addEventListener("change", addDate);
            //theMonth.addEventListener("change", addDate);
            // theDate.addEventListener("change", showDate);
            let yy, mm, d, dno, dd;

            let docFrag = document.createDocumentFragment();
            for (let i = 2022; i <= 2100; i++) { //新增年
              let opt = document.createElement("option");//  <option>13221345</option>
              opt.value = i; // <option value="2010"></option>
              opt.innerHTML = i; // <option value="2010"> 2010 </option>
              docFrag.appendChild(opt);
              //docFrag >>   <option value="2010"> 2010 </option><option value="2011"> 2011 </option>
            }
            theYear.appendChild(docFrag);
            //<select id="idSelectYear"> <option value="2010"> 2010 </option><option value="2011"> 2011 </option> </select>
            //  console.log(`年${theYear.value}`);

            docFrag = document.createDocumentFragment();
            for (let i = 1; i <= 12; i++) { //新增月 
              let opt = document.createElement("option");
              opt.value = i;
              opt.innerHTML = i;
              docFrag.appendChild(opt);
            }
            theMonth.appendChild(docFrag);

            function addDate() {
              yy = theYear.value;
              mm = theMonth.value;

              d = new Date(yy, mm, 0); //當月最後一天
              dno = d.getDate();

              w = new Date(yy, mm, 1);
              wno = w.getDate();
            }


            function showDate(result_work) {
              let d = new Date(yy, mm, 0); //當月最後一天
              let dno = d.getDate();
              let w = new Date(yy, mm, 1);
              let wno = w.getDate();
              var theTable = document.createElement("table");

              //將年月隱藏在TABLE 裡面
              let theInput_yyyy = document.createElement("input");

              theInput_yyyy.setAttribute("type", "text");
              theInput_yyyy.setAttribute("name", "year");
              theInput_yyyy.setAttribute("value", yy);
              theInput_yyyy.setAttribute("hidden", true);
              theTable.appendChild(theInput_yyyy);

              let theInputh_mm = document.createElement("input");

              theInputh_mm.setAttribute("type", "text");
              theInputh_mm.setAttribute("name", "month");
              theInputh_mm.setAttribute("value", mm);
              theInputh_mm.setAttribute("hidden", true);
              theTable.appendChild(theInputh_mm);

              theTable.setAttribute("id", "empAddModal");

              divText.innerHTML = ""; //清空
              docFrag = document.createDocumentFragment();

              let theTr_titel = document.createElement("tr");

              //title 取星期
              let week = w.getDay();
              for (let i = 0; i <= dno; i++) {
                let theTd = document.createElement("td");
                if (i == 0) {
                  theTd.innerHTML = " ";
                  theTr_titel.appendChild(theTd);
                  continue;
                }
                theTd.innerHTML = week;
                switch (week) {
                  case 0:
                    theTd.innerHTML = "日";
                    break;
                  case 1:
                    theTd.innerHTML = "一";
                    break;
                  case 2:
                    theTd.innerHTML = "二";
                    break;
                  case 3:
                    theTd.innerHTML = "三";
                    break;
                  case 4:
                    theTd.innerHTML = "四";
                    break;
                  case 5:
                    theTd.innerHTML = "五";
                    break;
                  case 6:
                    theTd.innerHTML = "六";
                    break;
                }
                week++;
                theTr_titel.appendChild(theTd);
                //docFrag.appendChild(theTd);
                if (week == 7) {
                  week = 0;
                }
              }

              //明細
              let theTr_detail = document.createElement("tr");
              for (let i = 0; i <= dno; i++) {
                let theInput = document.createElement("input");
                theInput.setAttribute("type", "hidden")
                // theInput.setAttribute("hidden", true);
                theInput.setAttribute("name", "day")
                theInput.setAttribute("value", i)

                let theTd = document.createElement("td");
                if (i == 0) {
                  theTd.innerHTML = " ";

                  theTr_detail.appendChild(theTd);

                  continue;
                }
                theTd.innerHTML = i;
                theTd.appendChild(theInput)
                // docFrag.appendChild(theTd);
                theTr_detail.appendChild(theTd);
              }
              theTable.appendChild(theTr_titel);
              theTable.appendChild(theTr_detail);

              if (result_work.length > 0) {  //有排班資料
                GetScheduleWork(result_work, theTable);
              }
              else { //無排班資料
                NewScheduleWork(theTable); 
              }

              let form_ = document.createElement("form");
              form_.appendChild(theTable);

              docFrag.appendChild(form_);
              divText.appendChild(docFrag)
            }

            $("#returnDate").click(function(){

              if(confirm("確定要返回查詢嗎")){
                $("#divText").hide();
               
                $("#returnDate").hide();
                $("#newDate").hide();    
              }
              $("#idSelectYear").attr('disabled',false);
              $("#idSelectMonth").attr('disabled',false);
              $("#setDate").show();
            })

            $("#setDate").click(function () {
              $("#newDate").show();
              $("#setDate").hide();
              $("#returnDate").show();
              $("#divText").show();
              $("#idSelectYear").attr('disabled',true);
              $("#idSelectMonth").attr('disabled',true);
              addDate(); //年 月 確定
              // document.getElementById("divText").innerHTML = "";
              // document.getElementById("divHidden").style.visibility="hidden";
              // showDate() // showDate() 顯示日
              $.ajax({
                url: "${contextRoot}/WorkSchedule?year=" + yy + "&month=" + mm,
                type: "GET",
                contenType: 'application/json',
                success: function (result) {
                  console.log()
                  
                  showDate(result);

                }
              }

              )

            })


            function GetScheduleWork(result, theTable) {
              console.log(result);
              $.ajax({
                type: "GET",
                url: "${contextRoot}/ScheduleType",
                contentType: 'application/json',
                success: function (resultType) {

                  let old_empid = "";
                  let new_empid = "";
                  let theTr3;
                  $.each(result, (index, value) => {
                    new_empid = value.employee_id;

                    
                    if (value.day == ""){
                    let emp_name = value.lastName + value.firstName; 

                    let theTr3 = document.createElement("tr");
                    let theTd = document.createElement("td");
                    let theInput = document.createElement("input");
                    let theBr = document.createElement("br");

                    theInput.setAttribute("type", "text");
                    theInput.setAttribute("readonly","ture");
                    theInput.setAttribute("name", "employee_id");
                    theInput.setAttribute("id", "employee_id");
                    theInput.setAttribute("value", value.employee_id, theBr);

                    theTd.appendChild(theInput);
                    theTd.appendChild(theBr);

                    theInput = document.createElement("input");
                    theInput.setAttribute("type", "text");
                    theInput.setAttribute("name", "emp_name");
                    theInput.setAttribute("value", emp_name);
                    theInput.setAttribute("disabled", "true");
                    theTd.appendChild(theInput);

                    theTr3.appendChild(theTd);

                    $.ajax({
                      type: "GET",
                      url: "${contextRoot}/ScheduleType",
                      contentType: 'application/json',
                      success: function (resultType) {

                        for (let i = 1; i <= dno; i++) {
                          let theTd1 = document.createElement("td");
                          let theSelect = document.createElement("select");
                          theSelect.setAttribute("name", "work_id")
                          theSelect.setAttribute("id", "work_id" + value.employee_id + "_" + i)
                          //	theSelect.innerHTML += "<option value='0'>  </option>";

                          $.each(resultType, (index, value) => {

                            theSelect.innerHTML += "<option value='" + value.workid + "'>" + value.schedule + "</option>";

                            theTd1.appendChild(theSelect);
                            theTr3.appendChild(theTd1);
                          })

                        }

                        theTable.appendChild(theTr3);
                      }
                    })

                  }















                    //
                    if (new_empid != old_empid) { //前一筆的EMPID 與 下一筆不同(人不一樣),代表要換下一行 

                      old_empid = value.employee_id;
                      let emp_name = value.employee.lastName + value.employee.firstName;
                      theTr3 = document.createElement("tr");
                      let theTd = document.createElement("td");
                      let theInput = document.createElement("input");
                      let theBr = document.createElement("br");

                      theInput.setAttribute("type", "text");
                      theInput.setAttribute("name", "employee_id");
                      theInput.setAttribute("id", "employee_id");
                      theInput.setAttribute("value", value.employee_id, theBr);

                      theTd.appendChild(theInput);
                      theTd.appendChild(theBr);

                      theInput = document.createElement("input");
                      theInput.setAttribute("type", "text");
                      theInput.setAttribute("name", "emp_name");
                      theInput.setAttribute("value", emp_name);
                      theInput.setAttribute("disabled", "true");
                      theTd.appendChild(theInput);

                      theTr3.appendChild(theTd);

                      theTable.appendChild(theTr3);

                    }

                    let theTd1 = document.createElement("td");
                    let theSelect = document.createElement("select");
                    theSelect.setAttribute("name", "work_id")
                    theSelect.setAttribute("id", "work_id" + value.employee_id + "_" + value.day)
                    var tmpWorkId_Sel = value.work_id;
                    $.each(resultType, (index, valueType) => {

                      if (valueType.workid == tmpWorkId_Sel) {
                        theSelect.innerHTML += "<option selected value='" + valueType.workid + "'>" + valueType.schedule + "</option>";
                      } else {
                        theSelect.innerHTML += "<option value='" + valueType.workid + "'>" + valueType.schedule + "</option>";
                      }
                      theTd1.appendChild(theSelect);

                    })
                    theTr3.appendChild(theTd1);


                  })


                }
              })


            }


            function NewScheduleWork(theTable) {
              
              var cnt = 0;

              $.ajax({
                type: "GET",
                url: "${contextRoot}/empname",
                contentType: 'application/json',
                success: function (result) {
                  let i = 1;
                  $.each(result, (index, value) => {
                    console.log("id=====>"+value.employee_id);
                    let emp_name = value.lastName + value.firstName;


                    let theTr3 = document.createElement("tr");
                    let theTd = document.createElement("td");
                    let theInput = document.createElement("input");
                    let theBr = document.createElement("br");

                    theInput.setAttribute("type", "text");
                    theInput.setAttribute("readonly","ture");
                    theInput.setAttribute("name", "employee_id");
                    theInput.setAttribute("id", "employee_id");
                    theInput.setAttribute("value", value.employee_id, theBr);

                    theTd.appendChild(theInput);
                    theTd.appendChild(theBr);

                    theInput = document.createElement("input");
                    theInput.setAttribute("type", "text");
                    theInput.setAttribute("name", "emp_name");
                    theInput.setAttribute("value", emp_name);
                    theInput.setAttribute("disabled", "true");
                    theTd.appendChild(theInput);

                    theTr3.appendChild(theTd);

                    $.ajax({
                      type: "GET",
                      url: "${contextRoot}/ScheduleType",
                      contentType: 'application/json',
                      success: function (resultType) {

                        for (let i = 1; i <= dno; i++) {
                          let theTd1 = document.createElement("td");
                          let theSelect = document.createElement("select");
                          theSelect.setAttribute("name", "work_id")
                          theSelect.setAttribute("id", "work_id" + value.employee_id + "_" + i)
                          //	theSelect.innerHTML += "<option value='0'>  </option>";

                          $.each(resultType, (index, value) => {

                            theSelect.innerHTML += "<option value='" + value.workid + "'>" + value.schedule + "</option>";

                            theTd1.appendChild(theSelect);
                            theTr3.appendChild(theTd1);
                          })

                        }

                        theTable.appendChild(theTr3);
                      }
                    })
                  })

                }
              });
            }

            


            $("#newDate").click(function () {
              /////??
              $("#setDate").hide();
              console.log($("form").serialize());
              $.ajax({
                url: "${contextRoot}/saveAll",
                type: "POST",
                //可以直接把empAddModal form裏的值構成json格式
                data: $("form").serialize(),
                success: function (message) {
                  alert("新增成功!")
                  //  					 alert(message);
                  //   Swal.fire({
                  //   icon: 'success',
                  //   title: 'Your work has been saved',
                  //   showConfirmButton: false,
                  //   timer: 2000
                  // })
                }
              });
            })
          </script>

          <noscript><img height="1" width="1" style="display:none"
              src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" /></noscript>

          <!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
          <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
        </body>

        </html>