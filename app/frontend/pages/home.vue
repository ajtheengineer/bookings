<template>
  <title>Book A Place</title>
  <div>
    <div class="website-header" @click="clickHeader()">Book-A-Place</div>
  </div>
  <div>
    <router-view />
  </div>
</template>

<script setup>
  import { useRouter } from 'vue-router';

  const router = useRouter();

  function clickHeader() {
    router.push('/')
  }
</script>

<style>
  .website-header {
    font-size: 50px;
    width: 100%;
    background-color: #0071c2;
    margin-bottom: 32px;

    cursor: pointer;
  }
</style>