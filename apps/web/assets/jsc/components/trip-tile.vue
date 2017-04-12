<template>
  <div class="trip">
    <a :href="`/trips/${trip.permalink}`">
      <figure>
        <img src="https://media.timeout.com/images/100644443/image.jpg">
      </figure>
      <section>
        <h3>{{ trip.name }}</h3>
        <p class="dates" v-if="trip.start_date || trip.end_date">
          <span v-if="trip.start_date">{{ this.formatDate(trip.start_date) }}</span>
          <span class="hyphen" v-if="trip.end_date">&mdash;</span>
          <span v-if="trip.end_date">{{ this.formatDate(trip.end_date) }}</span>
        </p>
      </section>
    </a>
  </div>
</template>

<script>
  import moment from 'moment';

  export default {
    props: {
      trip: Object
    },

    mounted () {
      this.parseDates();
    },

    methods: {
      parseDates () {
        this.trip.start_date = moment(this.trip.start_date);
        this.trip.end_date = moment(this.trip.end_date);
      },

      formatDate (date) {
        return moment(date).format('D MMM YYYY');
      }
    }
  };
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  .trip
    flex: 0 0 25%
    margin-right: 1%

    &:hover
      section
        background: $color-grey-light

    a
      display: block

    img
      border-radius: 5px 5px 0 0
      display: block
      max-width: 100%

    section
      background: $color-grey-lightest
      border-radius: 0 0 5px 5px
      padding: rhythm(0.25) rhythm(0.5)

    h3
      font-weight: $font-weight-semibold

    .dates
      font-size: $font-size-n1
      color: $color-grey-darkest
</style>
