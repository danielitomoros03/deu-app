<template>
  <div id="app">
    <SocialsBar class="socialbar" />
    <router-view class="router-view-container"></router-view>
    <ScrollBtn class="socialbar" />
  </div>
</template>

<script>
  import SocialsBar from "./components/SocialsBar.vue";
  import ScrollBtn from "./components/ScrollBtn.vue";
  export default {
    components: {
      SocialsBar,
      ScrollBtn,
    },
  };
</script>