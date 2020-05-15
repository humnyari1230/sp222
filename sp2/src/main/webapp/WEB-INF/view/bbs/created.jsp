﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
  function sendBoard() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

	    str = f.name.value;
        if(!str) {
            alert("이름을 입력하세요. ");
            f.name.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	str = f.pwd.value;
        if(!str) {
            alert("패스워드를 입력하세요. ");
            f.pwd.focus();
            return;
        }
    	
        f.action="<%=cp%>/bbs/${mode}";

        f.submit();
  }
</script>

<div class="body-container" style="width: 600px; margin: 30px auto 0px;">
<table style="width: 100%; border-spacing: 0px;">
<tr height="45">
	<td align="left" class="title">
		<h3><span>|</span> 자유 게시판</h3>
	</td>
</tr>
</table>

<form name="boardForm" method="post" enctype="multipart/form-data">
  <table style="width: 100%; margin-top: 20px; border-spacing: 0px; border-collapse: collapse;">
  <tr align="left" height="40" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
      <td style="padding-left:10px;"> 
        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
      </td>
  </tr>

  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
      <td style="padding-left:10px;"> 
        <input type="text" name="name" size="35" maxlength="20" class="boxTF" value="${dto.name}">
      </td>
  </tr>

  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
      <td valign="top" style="padding:5px 0px 5px 10px;"> 
        <textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
      </td>
  </tr>

  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
      <td style="padding-left:10px;"> 
           <input type="file" name="selectFile" class="boxTF" style="height: 23px; width: 95%;">
       </td>
  </tr> 

<c:if test="${mode=='update' }">
	<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">둥록파일</td>
      <td style="padding-left:10px;"> 
           <c:if test="${not empty dto.saveFilename}">
           		${dto.originalFilename} | <a href="<%=cp%>/bbs/deleteFile?num=${dto.num}&page=${page}">삭제</a>
           </c:if>
       </td>
  </tr> 
</c:if>

  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">패스워드</td>
      <td style="padding-left:10px;"> 
           <input type="password" name="pwd" size="35" maxlength="7" class="boxTF">&nbsp;(게시물 수정 및 삭제시 필요 !!!)
       </td>
  </tr> 
  </table>

  <table style="width: 100%; border-spacing: 0px;">
     <tr height="45"> 
      <td align="center" >
        <button type="button" class="btn" onclick="sendBoard();">${mode=="update"?"수정완료":"등록완료"}</button>
        <button type="reset" class="btn">다시입력</button>
        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list';">${mode=="update"?"수정취소":"등록취소"}</button>
		<c:if test="${mode=='update' }">
			<input type="hidden" name="num" value="${dto.num}">
			<input type="hidden" name="page" value="${page}">
			<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
			<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
		</c:if>
		</td>
    </tr>
  </table>
</form>
</div>