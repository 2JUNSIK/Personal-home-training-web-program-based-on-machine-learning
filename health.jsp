<%@page import="java.util.ArrayList"%>
<%@ page import="com.controller.CSVReader" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wf6mnm704t"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=YOUR_CLIENT_ID&submodules=geocoder"></script>
</head>
<body>
	<%
		String GwangJu_Health = "C:\\Users\\vdi02\\Documents\\Programming\\Project\\Crawling\\GwangJu.csv";
	    
	    String encoding = "EUC-KR";
	    
	    CSVReader csv = new CSVReader();
	    
	    ArrayList<String[]> temp = csv.getCSVInfo(GwangJu_Health, encoding, 4);
	    
	    csv.jsonConversion(request, response, temp);
	%>
	<input type="text" id="city">
	<input type="text" id="gu">
	<input type="text" id="dong">
	<button value="search" onclick="search()">검색</button><br>
 	<div id="map" style="width:100%;height:600px;">
	</div>
<script>
	var default_posi_x = 37.3595704;
	var default_posi_y = 127.105399;
	
	var mapOptions = {
		center: new naver.maps.LatLng(default_posi_x, default_posi_y), //지도의 초기 중심 좌표
		zoom: 11, //지도의 초기 줌 레벨
		minZoom: 1, //지도의 최소 줌 레벨
		zoomControl: false, //줌 컨트롤의 표시 여부
		draggable: true,
	    pinchZoom: true,
	    scrollWheel: true,
	    keyboardShortcuts: true,
	    disableDoubleTapZoom: true,
	    disableDoubleClickZoom: true,
	    disableTwoFingerTapZoom: true, 
	    
	    // 관성 드래깅
	    disableKineticPan: false, 
	    
	    tileTransition: true
	};
	
	var map = new naver.maps.Map('map', mapOptions);
	
	var bounds = map.getBounds(),
    southWest = bounds.getSW(),
    northEast = bounds.getNE(),
    lngSpan = northEast.lng() - southWest.lng(),
    latSpan = northEast.lat() - southWest.lat();
	
	var GwangJu = ${GwangJu};
	var listLength = ${listLength};
	
	var markers = [];
	var contentStrings = [];
	var infowindows = [];
	
	for (var i = 0; i < listLength; i++) {
		var contentString = [
		    '<div class="iw_inner">',
		    '   <h3>'+ GwangJu.place[i].name + '</h3>',
		    '   <p>' + GwangJu.place[i].address + '<br>',
		    '       '+ GwangJu.place[i].pn + '',
		    '   </p>',
		    '</div>'
		].join('');
		contentStrings.push(contentString);
		var infowindow = new naver.maps.InfoWindow({
		    content: contentString
		});
		infowindows.push(infowindow);
	}
	
		for (var m = 0; m < listLength; m++) {
			naver.maps.Service.geocode({
		        address: GwangJu.place[m].address
		    }, function(status, response) {
		    	
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }
		        var item = response.result.items[0],
		            point = new naver.maps.Point(item.point.x, item.point.y);
	
		        setMarker(point, '/image/mr game and watch.png', markers);
		    	
		    });
		}
		
	naver.maps.Event.addListener(map, 'idle', function() {
	    updateMarkers(map, markers);
	});
	
	
	
	function updateMarkers(map, markers) {

	    var mapBounds = map.getBounds();
	    var marker, position;

	    for (var i = 0; i < markers.length; i++) {

	        marker = markers[i]
	        position = marker.getPosition();

	        if (mapBounds.hasLatLng(position)) {
	            showMarker(map, marker);
	        } else {
	            hideMarker(map, marker);
	        }
	    }
	}

	function showMarker(map, marker) {

	    if (marker.getMap()) return;
	    marker.setMap(map);
	}

	function hideMarker(map, marker) {

	    if (!marker.getMap()) return;
	    marker.setMap(null);
	}
	
	function setMarker(point, imgurl, markers) {
		var HOME_PATH = window.HOME_PATH || '.';
		var posi = new naver.maps.LatLng(point.y, point.x);
		var markerOptions = {
			    position: posi,
			    map: map,
			    icon: {
			        url: HOME_PATH + imgurl,
			        size: new naver.maps.Size(50, 68),
			        scaledSize: new naver.maps.Size(50, 68),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(11, 35)
			    }
			};
		var marker = new naver.maps.Marker(markerOptions);
		markers.push(marker);
		
	}
	
	function setMarker(point, imgurl) {
		var HOME_PATH = window.HOME_PATH || '.';
		var posi = new naver.maps.LatLng(point.y, point.x);
		var markerOptions = {
			    position: posi,
			    map: map,
			    icon: {
			        url: HOME_PATH + imgurl,
			        size: new naver.maps.Size(50, 68),
			        scaledSize: new naver.maps.Size(50, 68),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(11, 35)
			    }
			};
		var marker = new naver.maps.Marker(markerOptions);
		markers.push(marker);
	}
	
	function search() {
		for (var i = 0; i < markers.length; i++) {
		    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
		}
		
		var city = document.getElementById("city").value;
		var gu = document.getElementById("gu").value;
		var dong = document.getElementById("dong").value;
		
		var currentDistrict = new Array();
		currentDistrict[0] = [city + " " + gu + " " + dong];
		
		naver.maps.Service.geocode({
	        address: currentDistrict[0]
	    }, function(status, response) {
	    	
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	
	        var item = response.result.items[0],
	            point = new naver.maps.Point(item.point.x, item.point.y);
			map.setCenter(point);
			setMarker(point, '/image/kirby.png');
	    });
	}
	
	function getClickHandler(seq) {
	    return function(e) {
	        var marker = markers[seq],
	            infoWindow = infowindows[seq];

	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	        }
	    }
	}
	</script>
</body>
</html>