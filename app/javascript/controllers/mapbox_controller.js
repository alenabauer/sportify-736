import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/alenabauer/ckw43utrj0xhv15p61di32g5s'
    });
    this._addMarkersToMap();
    this._fitMapToMarkers();
  }

  _addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      // Create a HTML element for your custom marker
      const customMarker = document.createElement('div');
      customMarker.className = 'marker';
      customMarker.innerHTML = '<i class="fas fa-baseball-ball"></i>';
      customMarker.style.color = '#F8684E';
      customMarker.style.fontSize = '24px';
      customMarker.style.display = 'block';

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
