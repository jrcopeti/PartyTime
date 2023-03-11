// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
// import mapboxgl from 'mapbox-gl/dist/mapbox-gl-csp';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/jonathanamir1/cletzfekq000m01ph88obppxk",
      center: [13.443625162341908, 52.50652632365762],
      zoom: 12,
    });
    this.#addMarkersToMap()
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
          // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
    })
  }
}
