  const ckAll = document.getElementById("ck-all");
  const ckArr = document.querySelectorAll(".ck");
  const menuAll = document.querySelector(".menu-all");

  const productQuantity = document.querySelectorAll(".product-quantity");
  const productPrice = document.querySelectorAll(".product-price");
  const totalSum = document.getElementById("sum");


  // ---------------------------------------------------------------------- //
  // 체크리스트 제어
  // 상위체크박스와 하위체크박스의 checked일치시키기
  ckAll.addEventListener('click',()=>{
    ckArr.forEach(ck => {
      ck.checked = ckAll.checked;
    });
    updateTotal();
  });

  // 하위 체크박스 전체 선택되었을때 상위체크박스 checked하기
  ckArr.forEach(ck => {
    ck.addEventListener('click',()=>{
      let count = 0;
      ckArr.forEach(ck => {
        if(ck.checked){
          count ++;
        }
      });
      if(ckArr.length == count){
        ckAll.checked = true;
      }else{
        ckAll.checked = false;
      }
      updateTotal(); 
    });
    
  });
  
 //전체선택 클릭했을때 체크박스 체크하기
 
  menuAll.addEventListener('click',()=>{

   if(ckAll.checked==false){
    ckArr.forEach(ck => {
    ck.checked = true;
   });
    ckAll.checked = true;
   } else{
    ckArr.forEach(ck => {
    ck.checked =false;
   });
    ckAll.checked = false;
   }
   

    updateTotal();
  });


   // ---------------------------------------------------------------------- //  

   // 수량이 변할때마다 가격합계에 반영하기
   productQuantity.forEach(pr => {
      pr.addEventListener('check',()=>{
        updateTotal();
      });
   });

   updateTotal();

  function updateTotal(){
  let priceTotal =0;
  let updatePrice = false; // 체크된게 없을때 전체가격을 0 출력하기 위해서 설정
      for(let i = 0; i < ckArr.length; i++){
        if(ckArr[i].checked){
          let quantity = parseInt(productQuantity[i].value);
          let price = parseInt(productPrice[i].value);
          
          priceTotal += (quantity * price);
          updatePrice = true;  
        }
        
      }

      if(updatePrice == false){
        priceTotal =0;
      }

     
     
     
      if(totalSum.innerHTML.startsWith('-')){
    	  totalSum.innerHTML = '0 원';
    	  }
      else {
    	  totalSum.innerHTML = priceTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
      }

  }
  
  //-------------------------------------------------------------------------//
  // 삭제버튼 클릭시, 만약 체크된게 없으면 삭제 클릭했을때 선택된게 없다고 알려주기
   const deleteBtn = document.querySelector(".delete-btn");
   function checkcon() {
    let count = 0;
    ckArr.forEach(ck => {
        if (ck.checked) {
            count++;
        }
    });

    if (count === 0) {
        alert('선택된 항목이 없습니다.');
        return false; // 선택된 항목이 없을 때 폼 제출을 막기 위해 false 반환
    } else {
    	update();
        let result = confirm('삭제하시겠습니까?');
 		
        return result; // 결과에 따라 true 또는 false 반환
        
        
    }
}



  //-----------------------------------------------------------------//
  
 
  // 주문버튼을 클릭했을때 주문한게 없으면 없다고 alert창으로 알려주기 

  const orderButton = document.querySelector(".order-btn");
 
  
  orderButton.addEventListener('click',()=>{
   let count = 0;
   
   ckArr.forEach(ck => {
    if(ck.checked){
        count ++;
    }
  });

   if(count==0){
        alert("주문할 상품을 선택하여 주세요.");
        event.preventDefault();
   }else{
	   update(); 
    document.querySelector("form").submit();
   }

   

  });

  
  
  
  // 주문하기 버튼 클릭했을때 선택된 정보 보내기
  
  //-------------------------------------------------------------------//
  // 폼태그에서 선택된 정보 보내기

      function update() {
        
        for (let i = 0; i < ckArr.length; i++) {
          if (ckArr[i].checked) {
            productQuantity[i].disabled = false;
          } else {
            productQuantity[i].disabled = true;
          }
        }
       

      }
 
      
  //---------------------------------------------------------//
  // 상품수량 제한하기 , 0이하 입력시 올바른 상품 수량을 입력하여 주십시오 출력

  
  productQuantity.forEach(pq => {
    pq.addEventListener('change',()=>{
      if(pq.value < 0){
        alert('올바른 상품 수량을 입력하여 주십시오. (최소 1개 이상 선택)');
        pq.value = 1;
        pq.focus(); 
        
      }else if(pq.value == 0){
    	  alert('최소 1개 이상 선택하셔야 합니다.');
    	 
    	  pq.value = 1;
    	  pq.focus(); 
    	 
      }
      updateTotal();
    });
  });




