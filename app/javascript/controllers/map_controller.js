import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    center: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    const center = this.centerValue.length ? this.centerValue : [13.443625162341908, 52.50652632365762];

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/jonathanamir1/cletzfekq000m01ph88obppxk",
      center: center,
      zoom: 12,
    });
    this.#addMarkersToMap()
    // this.#fitMapToMarkers()
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map)
    })

    if (this.centerValue.length > 0) {
      const userMarker = new mapboxgl.Marker({ color: "red" })
          .setLngLat(this.centerValue)

          .addTo(this.map)
    }
  }

  // #fitMapToMarkers() {
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  //   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  // }
}
