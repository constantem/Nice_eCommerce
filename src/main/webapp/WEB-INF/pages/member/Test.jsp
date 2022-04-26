<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.graph {
	width: 500px;
	height: 400px;
	border: solid 2px;
	display: flex;
	align-items: flex-end;
}

.bar {
	width: 30px;
	border: solid 2px;
	margin-right: 10px;
	transition: 0.5s;
	position: relatice;
}

.text {
	position: absolute;
	buttom: -30px
}
</style>
</head>
<body>
	<script>
var datas = [];
var elements = [];
function generateData(){
  var temp = [];
  for( var i=0; i<10; i++){
    temp.push(Math.random()*10+5);
  }
  return temp;
}

for( var i=0; i<10; i++){
  datas.push(Math.random()*10+5);
}
datas = generateData(); //function初始化
console.log(datas);

datas.forEach((obj, index)=>{
  console.log(index, obj);
  var bar = '<div class="bar"></div>';
  var color_val = parseInt(obj)*15;
  var element = $(bar);
  element.css("height", obj*20+"px")
         .css("background-color", "rgb("+color_val+","+color_val+","+color_val+")")
  $(".graph").append(element);
  elements.push(element);
});

//更新
setInterval(()=>{
  datas = generateData();
  elements.forEach((element,index)=>{
    var color_val = parseInt(datas[index])*15;
    element.css("height", datas[index]*20+"px")
         .css("background-color", "rgb("+color_val+","+color_val+","+color_val+")")
  });
},500);
</script>
</body>
</html>