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
  <div class="create-review-wrapper">
    <label for="displayName" class="display-name-label">Display name</label>
    <input type="text" id="displayName" v-model="displayName">
    <label class="comment-label" for="comment">Comment</label>
    <textarea
      type="text"
      id="comment"
      v-model="comment"
      cols="40"
      rows="5">
    </textarea>
    <label for="rating" class="rating-label">Rating</label>
    <select name="rating" id="rating" v-model="rating">
      <option value=1>1</option>
      <option value=2>2</option>
      <option value=3>3</option>
      <option value=4>4</option>
      <option value=5>5</option>
    </select>
    <button
      @click="submitReview()"
      > 
      Submit review
    </button>
  </div>
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

.create-review-wrapper {
  padding: 16px;
  display: flex;
  flex-direction: column;
  border: 1px solid black;
  margin-bottom: 12px;
}

#rating {
  width: 100px;
  margin-top: 10px;
}

.rating-label {
  margin-top: 20px;
}

.comment-label {
  margin-top: 20px;
}

.display-name-label {
  margin-top: 20px;
}

button {
  margin-top: 20px;
  width: 200px;
  height: 50px;
}

#displayName {
  width: 100px;
}



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
  const displayName = ref(null);
  const comment = ref(null);
  const rating = ref(null);
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

  function submitReview() {
    // It's going to read what's been entered for display name, comment, and rating
    // and POST that to the server in the form of a POST request.
    fetch(`/api/places/${placeId}/reviews`,{
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(
        {
          comment: comment.value,
          display_name: displayName.value,
          rating: rating.value
        }
      )
    }).then((_) => {
      // Refresh the page.
      comment.value = null
      displayName.value = null
      rating.value = null
      loadReviews(placeId);
    });
  }

  fetchPlace(placeId);
  loadReviews(placeId);
</script>