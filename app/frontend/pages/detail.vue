<template>
  <div
    loadedPlace="place-item-wrapper"
    v-if="loadedPlace"
  >
    <div class="image-wrapper">
      <img class="image" :src="loadedPlace.image_src">
    </div>
    <div class="content-wrapper">
      <div class="name">
        {{ loadedPlace.name }}
      </div>
      <div class="city">
        {{ loadedPlace.city }}
      </div>
      <div class="description">
        {{ loadedPlace.description }}
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

</style>

<script setup>
  import { ref } from 'vue'
  import { useRoute } from 'vue-router';
  const loadedPlace = ref(null);
  const route = useRoute();
  const placeId = route.params.placeId;

  // hit the server for the place details
  function fetchPlace(placeId) {
    fetch(`/api/places/${placeId}`)
      .then((response) => response.json())
      .then((data) => {
        loadedPlace.value = data.place;
        console.log(data.place);
      });
  }

  fetchPlace(placeId);
</script>