<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"> </script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
</style>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

</head>
<body class="w3-light-grey">


<% 

	String user = "";
		if(session.getAttribute("user") != null ){
			user = session.getAttribute("user").toString();
		}

%>

  <!-- Begin Wrapper -->
  <div id=wrapper class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4">
      
      	<c:if test= "${empty user}">
      
	    <jsp:include page="ViewMenuNotLogged.jsp" />
	    
		 </c:if>	   
		 
		  <c:if test= "${not empty user}">
		  				
		  	<jsp:include page="ViewMenuLogged.jsp" />
		  </c:if>	 
      	
     
		<div id="content"></div>
		
  <div  id="hot_topics" style="margin:10px;">
  <p class="w3-large w3-text-theme"><b><img class="new" src="images/new.png" ></i>Updates</b></p>

          <h5  >Movies</h5>
  <a href="index.html" style="text-decoration: none">      

  <ul class="w3-ul">
  <li>
    <div class="w3-container w3-card w3-indigo">
    Underground movies
    </div>
    <p>Free movie night at espai brut workshop </p>
  </li>
  </ul>
  </a>
       

  <p>Parties</p>
        <a href="index.html" style="text-decoration: none">      

  <ul class="w3-ul">
  <li>
    <div class="w3-container w3-card w3-indigo">
    80s parties 
    </div>
    <p>At mongoli dancefloor</p>
  </li>
  </ul>
  </a>
    
  <p>Food</p>
        <a href="index.html" style="text-decoration: none">      

  <ul class="w3-ul">
  <li>
    <div class="w3-container w3-card w3-indigo">
    Cheap shushi
    </div>
    <p>New shushi place at xxx serving unlimited sushi for 5euros</p>
  </li>
  </ul>
  </a>
  </div>
        </div>
        <br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    <div id="search_bar" class="w3-bar w3-black ">
    
    
    <div class="w3-col" style="width:20%"> <a class="w3-bar-item w3-button w3-mobile" href="MainController">Home</a> </div>  
    <div class="w3-col" style="width:20%">  <div class="w3-dropdown-hover">
		    <button class="w3-button w3-black">Activities</button>
		    <div class="w3-dropdown-content w3-bar-block w3-border">
		      <button id="button_restaurant"class="w3-bar-item w3-button" onclick="sendButton(this)">Restaurants</button>
		      <button id="button_movie" class="w3-bar-item w3-button" onclick="sendButton(this)">Movie</button>
		      <button id="button_disco" class="w3-bar-item w3-button" onclick="sendButton(this)">Parties</button>
		    </div>
		  </div> 
	</div>
		  
		  
    	<div class="w3-col" style="width:50%">
		  
				
				 <jsp:include page="ViewSearch.jsp" />
				    
		
		</div>
    
    <div class="w3-col" style="width:10%">
    	 
		  <c:if test= "${not empty user}">
		  
	 		<button class="w3-button w3-circle w3-teal" onclick="document.getElementById('id01').style.display='block'">+</button>	 
	 		
		 </c:if>

	</div>
		    
	</div>
	
	   <jsp:include page="ViewPostModal.jsp" />
	   
	   <jsp:include page="ViewProfile.jsp"/>
	
      	<div id="Posts"  class="w3-container w3-card w3-white w3-margin-bottom">
      	
      	<c:forEach items="${postList}" var="BeanPost">
      	
      	<div id="post${BeanPost.id}}">
      	
        <h2  class="w3-text-grey w3-padding-16"> <i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i> ${BeanPost.title}</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>${BeanPost.content}</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>${BeanPost.eventime} <span class="w3-tag w3-teal w3-round">  ${BeanPost.place} </span></h6>
           <span class="fake-link"  style="text-decoration: underline; color:blue;" onclick="showProfile(this)">${BeanPost.author}</span>  posted ${BeanPost.postime}
          <hr>
        </div>
        
        </div>
      	

      	</c:forEach>
      	
     
        </div>
      </div>
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->


	<script>
	
	function sendButton(event){
		
		$('#wrapper').load('SearchController',{content:event.innerHTML});
		
	}
	
	
	function showProfile(event){
		
		$('#profile_modal').load('ProfileController',{content:event.innerHTML});
		
	}
	
	</script>


</body>

</html>



