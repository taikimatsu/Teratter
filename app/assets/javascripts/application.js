// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
  //= require turbolinks
  //= require_tree .
  //= require underscore
  //= require gmaps/google
  //= require jquery3
  //= require popper
  //= require bootstrap-sprockets

$(".accordion li .nest").hide();
$(".accordion .button").on("click", function() {
    $(this).next().slideToggle();
    $(this).toggleClass("active");
});

$(function(){

　'use strict';
　　 var map;
    var service;
    var infowindow;
    var pyrmont = new google.maps.LatLng(-33.8665433,151.1956316);
    createMap(pyrmont)


     // 現在地取得
     document.getElementById('getcurrentlocation').onclick = function() {
      geoLocationInit();
    }

    function geoLocationInit() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(success, fail);

        } else {
          createMap(pyrmont);
      }
    }

   // success
   function success(position) {
     var currentLat = position.coords.latitude;
     var currentLng = position.coords.longitude;

     var pyrmont = new google.maps.LatLng(currentLat,currentLng);

     createMap(pyrmont)

     CurrentPositionMarker(pyrmont);
   }

    // fail
    function fail(pyrmont) {
      createMap(pyrmont);
    }

    function createMap(pyrmont) {

      map = new google.maps.Map(document.getElementById('map'), {
        center: pyrmont,
        zoom: 15
      });
      nearbysearch(pyrmont)
    }

    function createMarker(latlng, icn, place)
    {
      var marker = new google.maps.Marker({
        position: latlng,
        map: map
      });

      var placename = place.name;
　　　　　　　　　　// 吹き出しにカフェの名前を埋め込む
      var contentString = `<div class="sample"><p id="place_name">${placename}</p></div>`;

     // 吹き出し
      var infoWindow = new google.maps.InfoWindow({ // 吹き出しの追加
		  content:  contentString// 吹き出しに表示する内容
		});


		marker.addListener('click', function() { // マーカーをクリックしたとき
			infoWindow.open(map, marker); // 吹き出しの表示
		});

      }

    // 現在地のアイコンを表示
    function CurrentPositionMarker(pyrmont) {
        var image = 'http://i.stack.imgur.com/orZ4x.png';
        var marker = new google.maps.Marker({
                position: pyrmont,
                map: map,
                icon: image
            });
        marker.setMap(map);
    }

    // 周辺のカフェを検索
    function nearbysearch(pyrmont) {
        var request = {
          location: pyrmont,
          radius: '1500',
          type: ['cafe']
        };

        service = new google.maps.places.PlacesService(map);
        service.nearbySearch(request, callback);

        function callback(results, status) {
          if (status == google.maps.places.PlacesServiceStatus.OK) {
	　　　　　　　　//取得したカフェ情報をそれぞれcreateMarkerに入れて、マーカーを作成
            for (var i = 0; i < results.length; i++) {
              var place = results[i];
              //console.log(place)
              var latlng = place.geometry.location;
              var icn = place.icon;

              createMarker(latlng, icn, place);
            }
          }
        }
    }
});


