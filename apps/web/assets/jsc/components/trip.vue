<template>
  <div class="trip">
    <header>
      <h2>{{ trip.name }}</h2>
    </header>
    <section class="itinerary">
      <div class="plan">

      </div>
    </section>
  </div>
</template>

<script>
  export default {
    props: {
      trip: Object,
      plans: Array
    }
  }
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"


</style>
