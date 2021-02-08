<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/img/005.JPG" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/002.JPG" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/003.JPG" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/004.JPG" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/img/001.JPG" class="d-block w-100">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>