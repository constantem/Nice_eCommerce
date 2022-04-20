<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>

<%-- <c:set var="contextRoot" value="${pageContext.request.contextPath}" /> --%>

<%-- <jsp:include page="layout/default.jsp" /> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->



<!-- <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button> -->
<!--         <h4 class="modal-title" id="myModalLabel">員工新增</h4> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<%--         <form class="form-horizontal"> --%>
<!--           <div class="form-group"> -->
<!--             <label class="col-sm-2 control-label">empName</label> -->
<!--             <div class="col-sm-10"> -->
<!--               <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName"> -->
<!--               <span class="help-block"></span> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="form-group"> -->
<!--             <label class="col-sm-2 control-label">email</label> -->
<!--             <div class="col-sm-10"> -->
<!--               <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atguigu.com"> -->
<!--               <span class="help-block"></span> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="form-group"> -->
<!--             <label class="col-sm-2 control-label">gender</label> -->
<!--             <div class="col-sm-10"> -->
<!--               <label class="radio-inline"> -->
<!--                 <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男 -->
<!--               </label> -->
<!--               <label class="radio-inline"> -->
<!--                 <input type="radio" name="gender" id="gender2_add_input" value="F"> 女 -->
<!--               </label> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="form-group"> -->
<!--             <label class="col-sm-2 control-label">deptName</label> -->
<!--             <div class="col-sm-4"> -->
<!--               部門提交部門id即可 -->
<!--               <select class="form-control" name="dId"> -->
<!--               </select> -->
<!--             </div> -->
<!--           </div> -->
<%--         </form> --%>
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button> -->
<!--         <button type="button" class="btn btn-primary" id="emp_save_btn">儲存</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- <script> -->
//  function reset_form(ele) {
//     $(ele)[0].reset();
//     //清空表單樣式
//     $(ele).find("*").removeClass("has-error has-success");
//     $(ele).find(".help-block").text("");
//   }

//   function getDepts(ele) {
//     // 清空之前下拉列表的值
//     $(ele).empty();
//     $.ajax({
//       url: "${contextRoot}/depts",
//       type: "get",
//       success: function (result) {
//         //{"code":100,"msg":"處理成功！",
//         //"extend":{"depts":[{"deptId":1,"deptName":"開發部"},{"deptId":2,"deptName":"測試部"}]}}
//         //console.log(result);
//         //顯示部門資訊在下拉列表中
//         //$("#empAddModal select").append("")
//         $.each(result.extend.depts, function () {
//           var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
//           optionEle.appendTo(ele);
//         });
//       }
//     });
//   }

// //   // 點選新增按鈕彈出模態框。
// //   $("#emp_add_modal_btn").click(function () {
// //     //清除表單資料（表單完整重置（表單的資料，表單的樣式））
// //     reset_form("#empAddModal form");
// //     //s$("")[0].reset();
// //     //傳送ajax請求，查出部門資訊，顯示在下拉列表中
// //     getDepts("#empAddModal select");
// //     //彈出模態框
// //     $("#empAddModal").modal({
// //       backdrop: "static"
// //     });
// //   });

<!-- </script> -->
<!-- </body> -->
<!-- </html> -->