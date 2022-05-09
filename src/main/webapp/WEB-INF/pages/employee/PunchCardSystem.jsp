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
          <title>我頁標題(未更改)</title>

          <!-- Tailwind is included -->
          <!-- <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081"> -->
          <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css">
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
        
          <!-- 自訂 link, script -->
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
        <style>
          #punchIn{
            margin-top: 130px;
          }
        </style>
       

        <body>

          <div id="app">

            <!-- 插入上導覽列與左導覽列 -->
            <jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

            <!-- 章節層級 -->
            <section class="is-title-bar">
              <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
                <ul>
                  <li>Admin</li>
                  <li>Profile</li>
                </ul>
                <a href="https://justboil.me/" onclick="alert('Coming soon'); return false" target="_blank"
                  class="button blue">
                  <span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
                  <span>Premium Demo</span>
                </a>
              </div>
            </section>

            <!-- 核心內容標題 -->
            <section class="is-hero-bar">
              <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
                <h1 class="title">
                  打卡系統
                </h1>
                <button class="button light">Button</button>
              </div>
            </section>
          </div>

          <!-- 自訂-->

 <div class="modal fade" id="empInquireModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		data-target="#empInquireModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
					<h4 style="text-align:center" class="modal-title">打卡紀錄</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">	
				
						<div class="form-group">
              <table id="punchtable">
                <tr>
                  <td>
							<label class="col-sm-5 control-label">狀態</label>
						 
            </td>
            <td>             
                <label class="col-sm-4 control-label" >時間</label>        
            </td>
            </tr>
            <!-- <tr>
              <td>
              	<div class="col-sm-4 control-label">
                  <input type="text" style="outline:none;text-align:center;" name="Rpunchstatus" readonly class="form-control-static"
                    id="Rpunchstatus">
                  <span class="help-block"></span>
                </div>
              </td>
              <td>
              	<div class="col-sm-10">
                  <input type="text" style="outline:none;" name="Rpunchdatetime" readonly class="form-control-static"
                    id="Rpunchdatetime">
                  <span class="help-block"></span>
                </div>
              </td>
              </tr> -->
            </table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


          
          <section class="section main-section">
            <div class="card mb-6">
              <header class="card-header">
                <p class="card-header-title">
                  <span class="icon"><i class="mdi mdi-ballot"></i></span>
                  刷卡作業
                </p>
              </header>
              <div id="checkIn" class="card-content">
                <form method="post">

                  <div class="field">
                    <label class="label">刷卡作業</label>

                    <div class="form-group">
                      <label class="col-sm-2 control-label">員工姓名</label>
                      <div class="col-sm-10">
                        <input type="text" name="employeeid" id="employeeid" readonly value=${employeeid} class="form-control" >
                        <span class="help-block"></span>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label">當日班別</label>  
                      <div class="col-sm-10">
                        <input type="hidden" name="workid" value="workid" id="workid">
                        <input type="text" name="showSchedule" id="showSchedule" readonly  class="form-control" >
                        <span class="help-block"></span>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label">現在時段</label>  
                      <div class="col-sm-10" id="showbox">
                        <label onload="ShowTime()"></label>
                        <span class="help-block"></span>
                      </div>
                    </div>  
                    <div class="form-group" id="punchIn" >   
                      <label class="col-sm-2 control-label">上/下班</label>
                      <div class="col-sm-10">
                        <label class="radio-inline">
                          <input type="radio" name="punchstatus" id="punchStatusIn" value="in">上班
                        </label>
                        <label class="radio-inline">
                          <input type="radio" name="punchstatus" id="punchStatusOut" value="out">下班
                        </label>      
                      </div>
                    </div>
                 </div>
                </form>
              </div>
            </div>
            <div class="field grouped">
              <div class="control">
                <button id="savePunch" type="submit" class="button green">
                  確定送出
                </button>
              </div>
              <div class="control">
                <button type="reset" class="button red" onclick="findCard()">
                  查詢明細
                </button>
              </div>
            </div>
          </section>
          
      
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

            // <input type="hidden" id="employeeid" value="${employeeid}"/>

            ShowTime()
            function ShowTime(){
              var NowDate=new Date();
              var yy=NowDate.getFullYear();
              var mm=NowDate.getMonth()+1;
              var dd=NowDate.getDate();
              var h=NowDate.getHours();
              var m=NowDate.getMinutes();
              var s=NowDate.getSeconds();
              document.getElementById('showbox').innerHTML =yy+'年'+mm+'月'+dd+'日'+h+'時'+m+'分'+s+'秒';
              setTimeout('ShowTime()',1000);
            }
              var NowDate=new Date();
              var yy=NowDate.getFullYear();
              var mm=NowDate.getMonth()+1;
              var dd=NowDate.getDate();
              var employeeid = document.getElementById("employeeid").value;
            $.ajax({
              url:"${contextRoot}/punchCardFindWork?year="+yy+"&month="+mm+"&day="+dd+"&employeeid="+employeeid,
              type:"GET",
              contentType:'application/json',
              success:function(result){
              var schedule = result[0].scheduleType.schedule;
              var workid = result[0].scheduleType.workid;
              $("#showSchedule").val(schedule)
              $("#workid").val(workid) //藏起來並存到資料庫
              }
            })

            $("#savePunch").click(function(){
              //判斷是否已有資料
                $.ajax({
                url: "${contextRoot}/confirmPunch?year=" + yy + "&month=" + mm +"&day="+dd+"&employeeid="+employeeid,
                type: "get",
                contentType: 'application/json',
                success: function (result) {
                  var punchstatus = result[0].punchstatus
                  // let punchstatus = result.punchStatus;
                  // console.log("punchstatus:"+punchstatus)
                  if(punchstatus=='in'|| punchstatus=='out'){
                if(confirm('有重複打卡需要再次送出嗎?')){          
                  $.ajax({
                    url:"${contextRoot}/savePunchCard",
                    type:"POST",
                    data: $("form").serialize(),
                    success:function(result){
                }
              })
            }
          }
        }
      })

     })

            function findCard(){
				$("#empInquireModal").modal({
          
			});
              var NowDate=new Date();
              var yy=NowDate.getFullYear();
              var mm=NowDate.getMonth()+1;
              var employeeid = document.getElementById("employeeid").value;
              
			$.ajax({
				url: "${contextRoot}/findPunchRecord?year=" + yy + "&month=" + mm +"&employeeid="+employeeid,
				type: "get",
				contentType: 'application/json',
				success: function (result) {  
          
          $.each(result, (index, value) => {
            let punchstatus = value.punchstatus=='in'?'上班':'下班';

            let theInputh_time = document.createElement("input");

            let thePunchTable = document.getElementById("punchtable");
            
            let theDiv = document.createElement("div");
            theDiv.setAttribute("class","col-sm-4 control-label");
            let theTr_titel = document.createElement("tr");
            let theTd = document.createElement("td");
            let theInputh_status = document.createElement("input");
            theInputh_status.setAttribute("type", "text");
            theInputh_status.setAttribute("name", "Rpunchstatus");
            theInputh_status.setAttribute("style","outline:none;text-align:center;")
            theInputh_status.setAttribute("readonly",true);
            theInputh_status.setAttribute("class", "form-control-static");
            theInputh_status.setAttribute("value", punchstatus);
            
            theDiv.appendChild(theInputh_status);

            let theDivtime = document.createElement("div");
            theDivtime.setAttribute("class","col-sm-10");
            let theTdtime = document.createElement("td");
            theInputh_time.setAttribute("type", "text");
            theInputh_time.setAttribute("name", "Rpunchstatus");
            theInputh_time.setAttribute("style","outline:none;text-align:center;")
            theInputh_time.setAttribute("readonly",true);
            theInputh_time.setAttribute("class", "form-control-static");
            var tmp_time ="";
            if(value.punchstatus == "in"){ 
                tmp_time = value.punchin; 
              }else{
                tmp_time = value.punchout; 
              }
              if(tmp_time == null)  tmp_time ="未打卡";
            theInputh_time.setAttribute("value", tmp_time);
            theDivtime.appendChild(theInputh_time);
            
            theTd.appendChild(theDiv);
            theTdtime.appendChild(theDivtime);

            theTr_titel.appendChild(theTd);
            theTr_titel.appendChild(theTdtime);
            thePunchTable.appendChild(theTr_titel);
            // $("#punchtable").innerHTML+=theTr_titel;     
        })       
				}
			});
	};
          </script>
          <noscript><img height="1" width="1" style="display:none"
              src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" /></noscript>

          <!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
          <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
        </body>

        </html>