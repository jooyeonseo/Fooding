<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 장바구니 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

 <!-- css -->
 <link rel="stylesheet" href="./fooding/css/cart3.css" >
 <!-- 아이콘 -->
<!-- 파비콘 적용 -->
<link rel="icon" href="./fooding/images/fooding_log.png" type="image/x-icon">
 <script src="https://kit.fontawesome.com/38bf29a217.js" crossorigin="anonymous"></script>
 <script src="./fooding/cart/cart.js"></script>
 <style>
 .product_info {
	text-decoration: none;
	color: black;
}

.product_info:hover {
	color: red;
}

 .arrow-up{
      background-color: white;
      color: black;
      position: fixed;
      bottom: 8rem;
      right: 3rem;
      font-size: 2rem;
      width: 3.5rem;
      height: 3.5rem;

      border-radius: 100%;
      text-align: center;
      box-shadow: 5px 5px 0px 0px rgba(153, 204, 255);
    }

    .arrow-down{
      background-color: white;
      color: black;
      position: fixed;
      bottom: 3rem;
      right: 3rem;
      font-size: 2rem;
      width: 3.5rem;
      height: 3.5rem;

      border-radius: 100%;
      text-align: center;
      box-shadow: 5px 5px 0px 0px rgba(153, 204, 255);
    }
 
 </style>
</head>
<body>
<div id="cart-top"></div>
<!-- 로그인 했을 때 -->
    <c:if test="${!empty sessionScope.id }">
    <jsp:include page="../inc/top_another.jsp" />
    </c:if>
<!-- 로그인 했을 때 -->
	
<div class="cart-container" >

<!-- 장바구니 헤더 -->
    <div class="cart-header" >
        <i class="fa-solid fa-cart-shopping"></i>
        <p class="cart-header-title" >장바구니</p>
    </div>

<!-- 장바구니 폼 시작 -->
	<div class="cart-form">
	<form method="post">
	
<!-- 장바구니 상단체크 -->    
    <div class="cart-menu">
    
      <input class="form-check-input mt-0" type="checkbox"  aria-label="Checkbox for following text input" id="ck-all">   
      <p class="menu-all">전체선택</p>
	  <button  class="btn btn-primary order-btn" type="submit"  formaction="./CartPay.car" >주문하기</button>   
      <button  class="btn btn-light order-btn delete-btn" type="submit"  formaction="./CartDelete.car"  onclick="return checkcon();">삭제</button> 

  
    </div>
<!-- 장바구니 상단체크 끝 -->
<!-- 장바구니 테이블 시작 -->
   <div class="cart-table">
    <table class="table">
      <thead class="table-light cart-thead">
        <tr>
          <th></th>
          <th>운행일</th>
          <th>정차지</th>
       
          <th colspan="2">상품</th>
          <th>상품금액</th>
          <th>수량</th>
        </tr>
      </thead>
      
      <tbody>
		  <input type="hidden" name="member_id" value="${cartList[0].member_id}">
          <c:forEach var="list" items="${cartList}">
          <tr>
          <td><input class="form-check-input mt-0 ck" type="checkbox" name="cart_id" value="${list.cart_id }" aria-label="Checkbox for following text input" ></td>
          
          <td>${list.date }</td>
          
          <td>${list.address }</td>
          
          
          <td><a href="./FtInfoMainAction.fti?foodtruck_id=${list.foodtruck_id}"><img src="./upload/product/${list.image }" style="width: 100px;"></a></td>
          
          <td><a href="./FtInfoMainAction.fti?foodtruck_id=${list.foodtruck_id}" class="product_info">${list.name }</a></td>
          
          <td>
            <input type="number" value="${list.price }" class="product-price" readonly > &nbsp;원
          </td>
          
          <td>
            <input type="number" value="${list.quantity }" name="quantity" class="product-quantity" min="1">&nbsp;개
          </td>
        </tr>
        </c:forEach>
          
      </tbody>
    </table>
  </div>
<!-- 장바구니 테이블 끝 -->

<!-- 장바구니 최종 결제금액 cart-total -->

 <!-- 장바구니 최종 결제금액 -->
  <div class = "cart-total" id="cart-bottom" >
    <p class="totalbox" > &nbsp; 총 주문 금액</p>
    <p id=sum > 0원</p>
     
</div>
<!-- 장바구니 최종 결제금액 cart-total 끝 -->
</form>
	</div> 
<!-- 장바구니 폼 끝 -->

<!-- 장바구니 cart-container 끝 -->
</div>

<aside class="arrow">
    <a href="#cart-top" class="arrow-up"><i class="fa-solid fa-arrow-up"></i></a>
    <a href="#cart-bottom" class="arrow-down"><i class="fa-solid fa-arrow-down"></i></a>
  </aside>
  
<jsp:include page="../inc/bottom.jsp" />


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>