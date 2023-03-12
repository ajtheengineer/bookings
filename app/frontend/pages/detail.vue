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

  <h2> Reviews </h2>
  <div
      v-for="review in loadedReviews"
      :key="review.id"
      class="review-item-wrapper"
      >

      <div class="name-and-rating">
        <div class="display-name">{{ review.display_name }}</div>
        <div class="rating">{{ review.rating }} / 5</div>
      </div>
      <div class="comment">{{ review.comment }}</div>
      <div class="created-at">{{ review.created_at }}</div>
  </div>
</template>

<style scoped>

h2 {
  padding: 16px;
}
.review-item-wrapper {
  padding: 16px;
  display: flex;
  flex-direction: column;
  border: solid 1px black;
}

.name-and-rating {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-bottom: 10px;
}

.comment {
  padding-bottom: 20px;
  padding-top: 20px;
  padding-right: 20px;
}

.created-at {
  align-self: end;
}

.display-name {
  font-size: 20px;
}

.rating {
  margin-left: 20px;
}

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
  const loadedReviews = ref([]);
  const route = useRoute();
  const placeId = route.params.placeId;

  // hit the server for the place details
  function fetchPlace(placeId) {
    fetch(`/api/places/${placeId}`)
      .then((response) => response.json())
      .then((data) => {
        loadedPlace.value = data.place;
      });
  }

  function loadReviews(placeId) {
    fetch(`/api/places/${placeId}/reviews`)
      .then((response) => response.json())
      .then((data) => {
        loadedReviews.value = data.reviews
      })
  }

  fetchPlace(placeId);
  loadReviews(placeId);
</script>