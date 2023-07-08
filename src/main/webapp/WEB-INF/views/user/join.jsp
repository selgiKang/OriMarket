<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../../css/user/join.css"">
  
  
  
</head>
<body>
  <div class="container">
    <div class="logo_container">
      <img src="../../img/header.footer/ori.png" alt="logo">
       <img src="../../img/header.footer/smoke.png" alt="smoke">
      
      <span class="logo-text">Ori Market</span>
    </div>
    <form>
      <div class="form_field">
        <label for="id">ID</label>
        <div class="input_container">
          <input type="text" id="id" name="id" required>
          <div class="btn_container">
            <button type="button" class="btn_round" onclick="checkDuplicate()" 			
            			style="border-radius: 20px; 
            			padding: 5px 10px; 
            			background-color: #ffbf41; 
            			color: white; border: none; 
            			font-size: 14px; cursor: pointer;  
            			font-family: 'omyu pretty', Arial, sans-serif;">중복확인
            </button>
          </div>
        </div>
      </div>
      <div class="form_field">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="form_field">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form_field">
        <label for="phone">Phone</label>
        <input type="tel" id="phone" name="phone" required>
      </div>
      <div class="form_field">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form_field">
        <label for="address">Address</label>
        <div class="input_container">
          <input type="text" id="address" name="address" required>
          <div class="btn_container">
            <button type="button" class="btn_round" onclick="searchAddress()" 
            				style="border-radius: 20px; padding: 5px 10px; 
            				background-color: #ffbf41; color: white; border: none; 
            				font-size: 14px; cursor: pointer ; 
            				font-family: 'omyu pretty', Arial, sans-serif;">주소검색
            </button>
          </div>
        </div>
      </div>
      <input type="submit" value="SIGN UP" class="submit_btn">
    </form>
    
    		
  </div>
  




</body>
</html>
