
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none}
.display-left1 {position: absolute; top: 69%;  left: 12.5%; transform: translate(0%,-50%);}
.display-right1 {position: absolute; top: 69%;  right: 12.5%; transform: translate(0%,-50%);}
</style>
<div id="slide" >


<div class="mySlides SlideShow" >
  <img src="https://i.pinimg.com/originals/d4/bc/c4/d4bcc46e371e194b20854acd1ba3a86b.jpg" style="width:100%; height: 600px;">
  
</div>

<div class="mySlides SlideShow">
  <img src="https://i.pinimg.com/originals/39/44/6e/39446e759a1d7caf1582b346f53e1945.png" style="width:100%; height: 600px;">
 
</div>

<div class="mySlides SlideShow">
  <img src="https://i.pinimg.com/originals/96/e7/da/96e7dadf45e4b1ec6349388406597d96.jpg" style="width:100%; height: 600px;">
 
</div>

<!-- <button class="w3-button display-left1" onclick="plusDivs(-1)">&#10094;</button>
<button class="w3-button display-right1" onclick="plusDivs(1)">&#10095;</button> -->

</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 6000); // Change image every 6 seconds
}
</script>
	</div>
</div>