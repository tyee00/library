<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  


<c:import url="/include/top.jsp" />
<section>
  <br>
 <div align ="center">
 <h2>도서관 상세 보기</h2>
 <div align="center">
<table border = 1>
<tr>
<td colspan =2 width = 500px height = 300px>
<div id="map" style="width:500px;height:300px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${m.libraryAddr1}', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${m.libraryName}</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		geocoder.addressSearch('${member.addr1}', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker1 = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${member.id}</div>'
		        });
		        infowindow.open(map, marker1);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    } 
		});  
		

	
		</script>
</td>
</tr>


<tr>
<td>도서관이름</td><td>${m.libraryName }</td>
</tr>
<tr>
<td>주소</td><td>${m.libraryAddr1 }</td>
</tr>
<tr>
<td>상세주소</td><td>${m.libraryAddr2 }</td>
</tr>


</table>
<form action = "${path}/bookmark_Insert.do">
 <input type = hidden name = l_idx value ="${m.idx}"> 
<input type = hidden name = m_idx value ="${member.idx}">
<input type = hidden name = libraryName value ="${m.libraryName}"> 
<input type = hidden name = id value ="${member.id}">
<input type = submit value="즐겨찾기">
 </form>
 
 
 </div>
 <br>
</section>
<c:import url="/include/bottom.jsp" />
