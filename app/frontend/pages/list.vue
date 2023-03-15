<template>
  <h2>List of places</h2>
  <div class="search-wrapper">
    <label for="search">Search</label>
    <input
      type="text"
      v-model="searchTerm"
      @keyup="onSearchChange($event)"
      >
  </div>
  <div class="sort-wrapper">
    <label for="sort-options">Sort Options</label>
    <select
      id="sort-options"
      v-model="sortOption"
      @change="onSortChange($event)"
    >
      <option value="rating_desc">Rating (highest first)</option>
      <option value="rating_asc">Rating (lowest first)</option>
    </select>
  </div>
  <div>
    <div
      v-for="place in placesFromServer"
      :key="place.id"
      class="place-item-wrapper"
      @click="clickPlace(place.id)"
      >
      <div class="image-wrapper">
        <img class="image" :src="place.image_src">
      </div>
      <div class="content-wrapper">
        <div class="name-and-rating">
          <div class="name">
            {{ place.name }}
          </div>
          <div class="rating">
            {{ place.average_rating.toFixed(2) }}
          </div>
        </div>
        <div class="city">
          {{ place.city }}
        </div>
        <div class="description">
          {{ place.description }}
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
  .place-item-wrapper {
    border-color: #c6c6c6;
    border-radius: 2px;
    padding: 16px;
    border-style: solid;
    margin: 16px;
    display: flex;
    flex-direction: row;

    cursor: pointer;
  }

  .search-wrapper { 
    display: flex;
    flex-direction: column;
    width: 150px;
  }
  .name-and-rating {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-content: center;
  }

  #sort-options {
    margin-top: 12px;
    width: 150px;
  }

  .content-wrapper {
    display: flex;
    flex-direction: column;
    padding: 8px;
  }
  .image-wrapper {
    padding: 8px; 
  }

  .image {
    width: 140px;
  }
  .name {
    color: rgb(0, 113, 194);
    font-family: Roboto;
    font-size: 20px;
    font-weight: 700;
  }
  .description {
    font-family: Roboto;
    font-size: 14px;
  }

  .sort-wrapper {
    padding-top: 20px;
    padding-bottom: 20px;
    display: flex;
    flex-direction: column;
  }
</style>

<script setup>
  import { ref } from 'vue'
  import { useRouter } from 'vue-router'

  // When the page loads, I haven't hit the server yet for the places.
  // So there are no places to show right now.
  const placesFromServer = ref([]);
  const router = useRouter();
  const sortOption = ref("rating_desc")
  const searchTerm = ref("")

  function onSortChange(event) {
    fetchPlaces()
  }

  function onSearchChange(event) {
    fetchPlaces()
  }
  // On page load, I want to ask the server to give me a list of places in json format.
  // Once i get the data in json format, I want to iterate through the list of places
  // and render it on the screen.
  function fetchPlaces() {
    fetch(`/api/places?sort_option=${sortOption.value}&search_term=${searchTerm.value}`)
      .then((response) => response.json())
      .then((data) => {
        placesFromServer.value = data.places;
        console.log(data.places);
      });
  }

  function clickPlace(placeId) {
    console.log("clickplaces was called!");
    console.log(placeId);
    router.push(`/places/${placeId}`)
  }

  fetchPlaces()
</script>