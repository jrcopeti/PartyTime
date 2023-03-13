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
      new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(this.map)
    })
  }
}
