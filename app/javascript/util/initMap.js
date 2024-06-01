const initMap = () => {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      var map = new google.maps.Map(document.getElementById('map'), {
        center: pos,
        zoom: 15
      });

      fetch(`/map/search?location=${pos.lat},${pos.lng}`)
        .then(response => response.json())
        .then(data => {
          data.results.forEach(place => {
            var marker = new google.maps.Marker({
              position: place.geometry.location,
              map: map,
              title: place.name
            });

            var infowindow = new google.maps.InfoWindow({
              content: `<div><strong>${place.name}</strong><br>${place.vicinity}</div>`
            });

            marker.addListener('click', function() {
              infowindow.open(map, marker);
            });
          });
        });
    });
  }
};

export default initMap;