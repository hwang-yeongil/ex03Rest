<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
<%@ include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read Page</div>
			
			<div class="panel-body">
			
				<div class="form-group">
					<label>Bno</label><input class="form-control" name="Bno" readonly="readonly" value='<c:out value="${board.bno }"/>'>
				</div>
				<div class="form-group">
					<label>Title</label><input class="form-control" name="title" readonly="readonly" value='<c:out value="${board.title }"/>'>
				</div>
				<div class="form-group">
					<label>Text area</label>
					<textarea class="form-control" name="content" rows="3" readonly="readonly"><c:out value="${board.content }"/></textarea>
				</div>
				<div class="form-group">
					<label>Writer</label><input class="form-control" name="writer" readonly="readonly" value='<c:out value="${board.writer }"/>'>
				</div>
				<button data-oper='modify' class="btn btn-default">Modify</button>
				<button data-oper="list" class="btn btn-info">List</button>
				<form id="operForm" action="/board/modify" method="get">
					<input type="hidden" id="bno" name ="bno" value='<c:out value="${board.bno }"/>'>
					<input type="hidden" name ="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name ="amount" value='<c:out value="${cri.amount }"/>'>
				</form>
				

				<script type="text/javascript">
					$(document).ready(function () {
						var operForm = $("#operForm");
						
						$("button[data-oper='modify']").on("click",function(e){
							operForm.attr("action","/board/modify").submit();
						})
					
						$("button[data-oper='list']").on("click", function (e) {
							operForm.find("#bno").remove();
							operForm.attr("action","/board/list")
							operForm.submit();
						});
					});
				</script>
			</div>
		</div>	
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div  class="pannel panel-default">
			<div class="panel-heading">							
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
			</div>
	        <ul class="chat">
	        	<li class="left clearfix" data-rno="12">
	            	<div>
	            		<div class="header">
	                		<strong class="primary-font">user00</strong>
	                		<small class="pull-right text-muted">2018-01-01 13:13</small>
	             		</div>
	              		<p>Good 213123123!</p>
	            	</div>
	        	</li>
	        </ul>
		</div>
				<script type="text/javascript" src="/resources/js/reply.js"></script>
				<script type="text/javascript">
					$(document).ready(function(){
						
						var bnoValue ='<c:out value="${board.bno}"/>';
						var replyUL = $(".chat");
						showList(1);
					
					
						function showList(page) {
							replyService.getList({bno:bnoValue,page:page||1}, function (list) {
								var str="";
								if(list == null || list.length == 0){
									replyUL.html("");
									return;
								}
								for(var i = 0, len = list.length || 0; i < len; i++){
									str += "<li class='left clerfix' data-rno='"+list[i].rno+"'>";
									str +="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
									str +=" <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
									str +="<p>"+list[i].reply+"</p></div></li>";
								}
								replyUL.html(str);
							});
						}
					});
				
					
					/*
					replyService.getList({bno:bnoValue, page:1}, function(list){
						for(var i =0,len=list.length||0;i<len;i++){
							console.log(list[i]);
						}						
					});
					 
					replyService.remove(3, function(count){
						console.log(count);
						if(count === "success"){
							alert("REMOVED");
						}
					}, function (err){
						alert('ERROR.......');						
					});
					

					replyService.update({
						rno : 10,
						bno : bnoValue,
						reply: "Modified Reply"
					}, function(result){
						alert("수정완료")
					});
					console.log("get______________start");
					replyService.get(10, function(data){
						console.log(data);
						console.log("get______________end");
					});
					
					replyService.get(10, function (data) {
						console.log(data);
					});
					*/
				</script>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>