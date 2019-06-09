import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 14 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
      // style monochrome gray: mapbox://styles/sheesh19/cjwoecanw2ted1cqn4b9bkcpd
      // style outdoors: mapbox://styles/sheesh19/cjwoekbcu37781cmf1tzv17fs
      // style streets: mapbox://styles/mapbox/streets-v10
    });

    map.scrollZoom.disable();
    const markers = JSON.parse(mapElement.dataset.markers);

    if (Array.isArray(markers)) {
      markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
        });

      fitMapToMarkers(map, markers);

      } else {
        const markers = JSON.parse(mapElement.dataset.markers);

        new mapboxgl.Marker(markers)
          .setLngLat([ markers.lng, markers.lat ])
          .addTo(map);
      }
    };
  fitMapToMarkers(map, markers);
  map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
};

export { initMapbox };
