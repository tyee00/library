<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:import url ="/include/top.jsp" />
<script>
function delK(idx) {
	alert(idx+"를 삭제합니다.");
	location.href = "${path}/bookmark_delete.do?idx="+idx;
}
</script>
<section>
 <br>
 <div align ="center">
 <h2>즐겨찾기</h2>
 <div id="map" style="width:500px;height:300px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services"></script>
	<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.2382905, 128.692398), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨  35.2382905 128.692398 (경남도청)
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
		
	var  libraryName = new Array();
	var  libraryAddr1 = new Array();
	 
	
	
	<c:forEach var="m"  items="${li}">
	
	libraryName.push("${m.libraryName}");
	libraryAddr1.push("${m.libraryAddr1}");
	var addr1 = '${m.addr1}';
	var id = '${m.id}';
    </c:forEach>
     
   		
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
	
	var positions = [];
	
	for (i=0 ; i <= libraryName.length ; i++ ){
		
		positions[i] = {
				libraryName : libraryName[i],
				libraryAddr1 : libraryAddr1[i],
		};
	}
	
	var geocoder = new kakao.maps.services.Geocoder();	
	
	geocoder.addressSearch(addr1, function(result, status) {
    	
    	// 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

          // 결과값으로 받은 위치를 마커로 표시합니다
          var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
          });

          // 인포윈도우를 생성합니다
          var infowindow = new kakao.maps.InfoWindow({
              content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ id +'</div>',
              removable : true
          });
              
          // 마커에 클릭이벤트를 등록합니다
          kakao.maps.event.addListener(marker, 'click', function() {
                // 마커 위에 인포윈도우를 표시합니다
                infowindow.open(map, marker);  
          });

	
	    } 
	});
	
	positions.forEach(function (k) { //추가한 코드
	    // 주소로 좌표를 검색합니다
	    
	    geocoder.addressSearch(k.libraryAddr1, function(result, status) {
	    	
	    	// 정상적으로 검색이 완료됐으면
	        if (status === kakao.maps.services.Status.OK) {

	          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	          // 결과값으로 받은 위치를 마커로 표시합니다
	          var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords,
	          });

	          // 인포윈도우를 생성합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ k.libraryName+'</div>',
                  removable : true
              });
                  
              // 마커에 클릭이벤트를 등록합니다
              kakao.maps.event.addListener(marker, 'click', function() {
                    // 마커 위에 인포윈도우를 표시합니다
                    infowindow.open(map, marker);  
              });
              map.setCenter(coords);

		
		    } 
		});
	}); 

	
	</script>
 
<table border = 1>
<tr>
<td align=center>순번</td>
<td align=center>도서관이름</td>
<td align=center>도서관주소</td>
<td align=center>도서관전화번호</td>
<td align=center>우편번호</td>
<td align=center>도서관홈페이지주소</td>
<td align=center>삭제</td>
</tr>
<c:forEach items="${li}" var="m" varStatus="status">
<tr>
<td align=center>${status.count}</td>
<td align=center>${m.libraryName}</td>
<td align=center>${m.libraryAddr1}${m.libraryAddr2}</td>
<td align=center>${m.libraryTel}</td>
<td align=center>${m.zipcode}</td>
<td align=center>${m.libraryHomepage}</td>
<td align=center><input type = "button" onclick="delK('${m.idx}')" value ="삭제"></td>
</tr>
</c:forEach>


</table>

</div>

</section>
<c:import url ="/include/bottom.jsp" />