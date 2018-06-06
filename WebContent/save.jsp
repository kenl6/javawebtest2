<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <!-- include:只能引入项目内部文件,因此不需要添加工程名称 -->
   <%@ include file="/WEB-INF/public.jspf" %>
<script type="text/javascript">
    // 页面加载的时候发送ajax请求
    $(document).ready(function(){
    	alert('---------');
    	// 发送一个ajax请求完成类别信息的获取
    	$.post('/javawebtest2/category/queryAll.mvc',{id:1001,name:'数码产品'},function(result){
			for(var item in result){
				$("#cid").append("<option value=" + result[item].id + ">" + result[item].name + "</option>");
			}			
    	},'json');
    });
</script>
<title>添加商品</title>
</head>
<!-- 侵入性 -->
<body>
	<div class="container" style="padding-top: 10px">
		<!-- action:就是配置提交到后台的地址,请注意在web项目中,所有的请求都需要添加工程名 -->
		<!-- *.mvc是在web.xml中已经配置,只有mvc后缀的请求才会交给spring mvc处理 -->
		<!-- request.getContextPath() 动态获取当前项目的工程名 -->
		<form action="${shop}/product/save.mvc" method="get" class="form-horizontal">
			<!-- form-group:代表的表单元素组(包括提示文字 + 表单元素) -->
			<div class="form-group">
			    <!-- lable:代表提示文字 
			         class="col-sm-2 代表所占的列宽(总共有12列)
			         placeholder:文本框的提示
			     -->
				<label for="pname" class="col-sm-2 control-label">商品名称:</label>
				<div class="col-sm-6">
					<input type="text" name="name" class="form-control" id="pname"
						placeholder="商品名称">
					<span class="inline-block">如果有错误,此处将会显示错误消息</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-2 control-label">商品价格:</label>
				<div class="col-sm-6">
					<input type="text" name="price" class="form-control" id="price"
						placeholder="商品价格">
				</div>
			</div>
			<!-- 商品备注,采用文本域 -->
			<div class="form-group">
				<label for="remark" class="col-sm-2 control-label">商品备注:</label>
				<div class="col-sm-8">
					<textarea class="form-control" name="remark" rows="3" id="remark"></textarea>
				</div>
			</div>
			
			<!-- 商品备注,采用文本域 -->
			<div class="form-group">
				<label for="cid" class="col-sm-2 control-label">所属类别:</label>
				<div class="col-sm-8">
					<select class="form-control" name="category.id" id="cid">
					    <option value="0">---请选择---</option>
					</select>
				</div>
			</div>
			
			
			<!-- 设置要偏移的列数: col-sm-offset-2 -->
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">添加商品</button>
				</div>
			</div>
		</form>
















	</div>

</body>
</html>