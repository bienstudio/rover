<template>
  <div class="activity">
    <a :href="activity.url">
      <img :src="activity.image">
      <h4>{{ activity.name }}</h4>
    </a>
  </div>
</template>

<script>
  export default {
    props: {
      activity: Object
    }
  }
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  a
    display: block

  img
    border-radius: 5px
    max-width: 100%
</style>
