<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>STYLEBOOK</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="<%=cp%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="<%=cp%>/bootstrap/css/styles.css" rel="stylesheet">
	</head>
<meta charset="utf-8">
<title>JOIN</title>
<script>
    function memberOk() {
        f = document.memberForm;

    	str = f.userId.value;
        if(!str) {
            alert("\n아이디를 입력하세요. ");
            f.userId.focus();
            return false;
        }
		if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
			alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
			f.userId.focus();
			return false;
		}
		
		str = f.userPwd.value;
		
		if(!str) {
			alert("\n패스워드를 입력하세요. ");
			f.userPwd.focus();
			return false;
		}
		if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
			alert("패스워드는 5~10자이며 하나 이상 영문자와 숫자나 특수문자가 포함되어야 합니다.");
			f.userPwd.focus();
			return false;
		}
		
		str1=f.userPwd1.value;
		
		if(!str) {
			alert("\n패스워드를 입력하세요. ");
			f.userPwd.focus();
			return false;
		}
		if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
			alert("패스워드는 5~10자이며 하나 이상 영문자와 숫자나 특수문자가 포함되어야 합니다.");
			f.userPwd.focus();
			return false;
		}
		
		if(str!=str1){
			alert("비밀번호가 다릅니다.");
			f.userPwd.focus();
			return false;
		}
		
	    str = f.userName.value;
        
	    if(!str) {
            alert("\n이름을 입력하세요. ");
            f.userName.focus();
           return false;
        }

	    str = f.birth.value;
        if(!str || !isValidDateFormat(str)) {
            alert("\n생년월일를 입력하세요[YYYY-MM-DD]. ");
            f.birth.focus();
           return false;
        }
        
	    str = f.tel1.value;
        
	    if(!str) {
            alert("\n전화번호를 입력하세요. ");
            f.tel1.focus();
            return false;
        }

	    str = f.tel2.value;
        
	    if(!/^[0-9][0-9]{2,3}$/g.test(str)) {
            alert("\n전화번호는 3~4자의 숫자입니다 !!! ");
            f.tel2.focus();
            return false;
        }
	    
	    str = f.tel3.value;
        if(!/^[0-9][0-9]{3}$/g.test(str)) {
            alert("\n전화번호는 4자의 숫자입니다 !!! ");
            f.tel3.focus();
            return false;
        }
        
	    str = f.email1.value;
        if(!str) {
            alert("\n이메일을 입력하세요. ");
            f.email1.focus();
            return false;
        }

	    str = f.email2.value;
        if(!str) {
            alert("\n이메일을 입력하세요. ");
            f.email2.focus();
            return false;
        }


        
        var mode="${mode}";
        if(mode=="created")
        	f.action = "<%=cp%>/member/created_ok.do";
        else if(mode=="update")
        	f.action = "<%=cp%>/member/update_ok.do";
     
        f.submit();
    }

    function changeEmail() {
        var f = document.memberForm;
        
     	var str = f.selectEmail.value;
        if(str!="direct") {
             f.email2.value=str; 
             f.email2.readOnly = true;
             f.email1.focus(); 
        }
        else {
            f.email2.value="";
            f.email2.readOnly = false;
            f.email1.focus();
        }
    }

    function changeQuestion() {
        var f = document.memberForm;
        
     	str = f.question.value;
        if(!str) {
          f.answer.readOnly = true;
        }
        else {
          f.answer.readOnly = false;
          f.answer.focus();
        }
    }

    if(window.attachEvent) { // IE 낮은버전
    	window.attachEvent("onload", function(){
    		var ob=document.getElementsByTagName("input");
    		for(var i=0; i<ob.length; i++) {
    			if(ob[i].getAttribute("type")=="text" || ob[i].getAttribute("type")=="password") {
    				ob[i].onkeydown=function() { // IE만 가능
    			        if(event.keyCode==13){
    			        	event.keyCode=9; 
    			        	return event.keyCode;
    			        }
    				};
    				
    				ob[i].onfocus=function() {
    					if(! this.getAttribute("readonly"))
    					   this.style.border="1px solid red";
    				};
    				
    				ob[i].onblur=function() {
    					if(! this.getAttribute("readonly"))
    					  this.style.border="1px solid #666666";
    				};
    			}
    		}
    	});
    } else if(window.addEventListener) {
    	window.addEventListener("load", function(){
    		var ob=document.getElementsByTagName("input");
    		for(var i=0; i<ob.length; i++) {
    			if(ob[i].getAttribute("type")=="text" || ob[i].getAttribute("type")=="password") {
    				ob[i].onkeydown=function() {
    			        if(event.keyCode==13) {
    			        	var it=document.getElementsByTagName("input");
    			        	for(var n=0; n<it.length; n++) {
    			        		if(event.srcElement==it[n]) {
    			        			if(n!=it.length-1) {
    			        		   		it[n+1].focus();
    			        		   		return;
    			        			}
    			        		}
    			        	}
    			        }
    				};
    				
    				ob[i].onfocus=function() {
    					if(! this.getAttribute("readonly"))
    					  this.style.border="1px solid red";
    				};
    				
    				ob[i].onblur=function() {
    					if(! this.getAttribute("readonly"))
    					  this.style.border="1px solid #666666";
    				};
    			}
    		}
    	});
    }    
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<body>
<!-- Wrap all page content here -->
<div id="wrap">


  
<!-- Fixed navbar -->
<div class="layoutBody" style="width: 1300px; height: 600px; margin: auto;">
		
		
		    <div>   
            <a style="font-size: 20pt; font-weight: bold; color: #4C4C4C; position: absolute; left: 20%;">${mode=='created'?'JOIN':'정보수정' }</a>
         </div>
     
		<br><br>
		<div style="width:600px; min-height: 390px; margin: 30px auto 10px; text-align: center;">
		<form name="memberForm" style="text-align: center; action:">
		
				<table class="table" style="text-align: center;">
				
						<tr>
							<td style="text-align: center; width: 30%;">ID&nbsp;&nbsp;&nbsp;</td>
						 	<td style="width: 70%">
							<input name="userId" id="userId" class="input-large" type="text" placeholder="userId" rea
								value="${dto.userId}" ${mode=="update" ? "readonly='readonly' style='border:none;' ":""}/>
							</td>
						</tr>
						
						<tr>
							<td style="text-align: center; width: 30%;">PWD&nbsp;</td>
							<td style="width: 70%">
							<input name="userPwd" id="userPwd" class="input-large" type="password" placeholder="userPassward"/>
							</td>
						</tr>
						
						<tr>
							<td style="text-align: center; width: 30%;">PWD&nbsp;<img src="<%=cp%>/bootstrap/img/pwdch.jpg" width="15" height="15"/>&nbsp;</td>
							<td style="width: 70%">
							<input name="userPwd1" id="userPwd1" class="input-large" type="password" placeholder="userPassward"/>
								
							</td>
						</tr>
						
						<tr>
							<td style="text-align: center; width: 30%;">NAME&nbsp;</td>
							<td style="width: 70%">
							<input name="userName" id="userName" class="input-large" type="text" placeholder="userName"
								value="${dto.userName}" ${mode=="update" ? "readonly='readonly' style='border:none;' ":""}/>
								
							</td>
						</tr>
							
						<tr>
							<td style="text-align: center; width: 30%;">BIRTH&nbsp;</td>
							<td style="width: 70%">
							<input name="birth" id="birth" class="input-large" type="text" placeholder="birth"
								value="${dto.birth}" />
								
							</td>
							</tr>
						
						<tr>
							<td style="text-align: center; width: 30%;">TEL&nbsp;</td>
							<td style="width: 70%">
							<select name="tel1" class="span1">
 								<option style="width: 70px" value="">선 택</option>
										<option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
										<option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
										<option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
										<option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
										<option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
										<option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
							</select>
							-
							<input style="width: 70px" type="text" name="tel2"   class="input-mini" value="${dto.tel2}" /> 
							-
							<input style="width: 70px" type="text" name="tel3" class="input-mini" value="${dto.tel3}" />
							</td>
							</tr>
				
						<tr>
							<td style="text-align: center; width: 30%;">E-Mail&nbsp;</td>
							<td style="width: 70%">
							<select style="width: 110px" name="selectEmail" class="span2" onchange="changeEmail()">
										<option  value="">선 택</option>
										<option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>naver.com</option>
										<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>hanmail.net</option>
										<option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>hotmail.com</option>
										<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>gmail.com</option>
										<option value="direct">직접입력</option>
							
							</select>
		
							<input style="width: 110px" type="text" name="email1" class="input-mini" value="${dto.email1}"/> @ 
							<input style="width: 110px" width="30px;" type="text" name="email2" class="boxTF" value="${dto.email2}" readonly="readonly"/>	
							
							</td>
							</tr>
							
						<tr>
							<td style="text-align: center; width: 30%;">JOB&nbsp;</td>
							<td style="width: 70%">
							<input name="job" id="job" class="input-large" type="text" placeholder="JOB"
								value="${dto.job}" />
								
							</td>
							</tr>
					
						</table>
				
					
				<div align="center">
				
				<input type="button" value=" ${mode=='created'?'회원가입':'정보수정' } " class="btn btn-inverse" onclick="memberOk()"/>
				<input type="reset" value=" 다시입력 " class="btn btn-inverse" onclick="document.memberForm.userId"/>
				<input type="button" value=" ${mode=='created'?'가입취소':'수정취소' } " class="btn btn-inverse" onclick="javascript:location.href='<%=cp%>';"/>
				
				
				
				</div>
				</form>
				
				<div id="memberCreated_message">
				  <font color="blue">${message}</font>
				</div>
				
			</div>

         </div>
  

<div class="row">
  <div class="col-md-8 col-md-offset-1">
  </div>
</div>

  
</div><!--/wrap-->
		
		<div class="container">
  	<div class="col-sm-8 col-sm-offset-2 text-center">

      <ul class="list-inline center-block">
        <li><a href="http://facebook.com/bootply"><img src="<%=cp %>/bootstrap/img/facebook.jpg"></a></li>
        <li><a href="http://twitter.com/bootply"><img src="<%=cp %>/bootstrap/img/twitter.jpg"></a></li>
        <li><a href="http://google.com/+bootply"><img src="<%=cp %>/bootstrap/img/googlep.jpg"></a></li>
        <li><a href="https://story.kakao.com/s/login"><img src="<%=cp %>/bootstrap/img/kakaostory.jpg"></a></li>
      </ul>
      
  	</div><!--/col-->
</div><!--/container-->
  

		
	

	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="<%=cp%>/bootstrap/js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
		<script src="<%=cp%>/bootstrap/js/scripts.js"></script>
		<script type="text/javascript" src="<%=cp%>/bootstrap/js/util.js"></script>
	</body>
</html>