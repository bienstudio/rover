<template>
  <div class="trip">
    <h3 class="trip__name"><a href="#">{{ trip.name }}</a></h3>
  </div>
</template>

<script>
  export default {
    props: {
      trip: Object
    },

    mounted () {
      this.parseDates();
    },

    methods: {
      parseDates () {
        this.trip.start_date = new Date(this.trip.start_date);
        this.trip.end_date = new Date(this.trip.end_date);
      }
    }
  };
</script>

<style lang="sass" scoped>
  @import "~css/_variables.sass"

</style>
