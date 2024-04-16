<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/menu.css" rel="stylesheet">
	<link href="resources/css/font.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>게시물 목록</title>
     <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #fffec4;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .button-container {
            margin-top: 20px;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 16px; 
            background-color: #f5f5f5;
        }
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
	<nav>
        <ul>
            <li><a href="corpInfo.html">회사 소개</a></li>
            <li><a href="<c:url value='/member/signupForm'/>">회원가입</a></li>
            <li><a href="<c:url value='/member/loginForm'/>">로그인</a></li>
            <li><a href="<c:url value='/board/list'/>">게시판</a></li>
        </ul>
    </nav>
    	
    <h1>게시판</h1>
    <h3>로그인 : ${loginVO.memberName} </h3>
    <form id="searchForm" action="list" method="post" >
        <select id="size" name="size" >
        	<c:forEach var="size" items="${sizes}">
        		<option value="${size.codeid}" ${pageRequestVO.size == size.codeid ? 'selected' : ''} >${size.name}</option>
        	</c:forEach>
        </select>
    	<label>제목</label>
    	<input type="text" id="searchKey" name="searchKey" value="${param.searchKey}">
    	<input type="submit" value="검색">
    </form>
    
    <form id="listForm" action="view" method="post">
    	<input type="hidden" id="bno" name="bno" >
    </form>
   
    <table border="1">
        <tr>
            <th>게시물번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
         <c:forEach var="board" items="${pageResponseVO.list}">
        <tr>
            <td onclick="jsView('${board.bno}')"  style="cursor:pointer;">${board.bno}</td>
            <td><a href="view?bno=${board.bno}">${board.btitle}</a></td>
            <td>${board.memberID}</td>
            <td>${board.bdate}</td>
        </tr>
        </c:forEach>
    </table>
    
     <!--  페이지 네비게이션 바 출력  -->
    <div class="float-end">
        <ul class="pagination flex-wrap">
            <c:if test="${pageResponseVO.prev}">
                <li class="page-item">
                    <a class="page-link" data-num="${pageResponseVO.start -1}">이전</a>
                </li>
            </c:if>

            <c:forEach begin="${pageResponseVO.start}" end="${pageResponseVO.end}" var="num">
                <li class="page-item ${pageResponseVO.pageNo == num ? 'active':''} ">
                    <a class="page-link"  data-num="${num}">${num}</a></li>
            </c:forEach>

            <c:if test="${pageResponseVO.next}">
                <li class="page-item">
                    <a class="page-link"  data-num="${pageResponseVO.end + 1}">다음</a>
                </li>
            </c:if>
        </ul>

    </div>
    
	<script>

	document.querySelector(".pagination").addEventListener("click", function (e) {
	    e.preventDefault()
	
	    const target = e.target
	
	    if(target.tagName !== 'A') {
	        return
	    }
	    //dataset 프로퍼티로 접근 또는 속성 접근 메서드 getAttribute() 사용 하여 접근 가능 
	    //const num = target.getAttribute("data-num")
	    const num = target.dataset["num"];
	    
	    //페이지번호 설정 
	    searchForm.innerHTML += `<input type='hidden' name='pageNo' value='\${num}'>`;
	    searchForm.submit();
	});
	
	document.querySelector("#size").addEventListener("change", e => {
	    searchForm.submit();
	});
    
	function jsView(bno) {
		//인자의 값을 설정한다 
		bno.value = bno;
		
		//양식을 통해서 서버의 URL로 값을 전달한다
		listForm.submit();
		
	}
	</script>      
	    <div class="button-container">
	        <a href="insertForm">등록</a>
	    </div>
	</body>
</html>