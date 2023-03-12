<template>
  List of places
  <div>
    {{ placesFromServer }}
  </div>
</template>

<script setup>
  import { ref } from 'vue'

  // When the page loads, I haven't hit the server yet for the places.
  // So there are no places to show right now.
  const placesFromServer = ref([]);
  
  // On page load, I want to ask the server to give me a list of places in json format.
  // Once i get the data in json format, I want to iterate through the list of places
  // and render it on the screen.
  function fetchPlaces() {
    fetch("/api/places")
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
        placesFromServer.value = data;
      });
  }

  // Wait 3 seconds before fetching places from the backend
  setTimeout(function() {
    fetchPlaces()
  }, 3000)
</script>