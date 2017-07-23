<template>
  <div class="trip">
    <header>
      <section>
        <h2>{{ trip.name }}</h2>
        <p>{{ formatDate(trip.start_date) }} &ndash; {{ formatDate(trip.end_date) }}</p>
      </section>
      <aside>
        <a class="btn btn--small" href="#">Edit Trip</a>
        <a class="btn btn--blue btn--small" :href="`/trips/${trip.permalink}/plans/new`"><i class="ss-icon">add</i> Add Plans</a>
      </aside>
    </header>
    <section>
      <day v-for="date in dates" v-bind:date="date" v-bind:plans="plansForDate(date)"></day>
    </section>
  </div>
</template>

<script>
  import Vue from 'vue';

  import Moment from 'moment';
  import { extendMoment } from 'moment-range';

  import Dropdown from './dropdown.vue';
  import Day from './day.vue';

  Vue.component('dropdown');
  Vue.component('day');

  const moment = extendMoment(Moment);

  export default {
    components: { Dropdown, Day },

    data () {
      return {
        dates: []
      };
    },

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
        this.dates = Array.from(moment.range(this.trip.start_date, this.trip.end_date).by('days'));
      },

      formatDate (date) {
        return moment(date).format('D MMM YYYY');
      },

      plansForDate (date) {
        return this.trip.plans[moment(date).format('YYYY-MM-DD')];
      }
    }
  };
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"
  @import "~css/_button.sass"

  header
    border-bottom: 1px solid $color-grey-light
    display: flex
    margin-bottom: rhythm(1)
    margin-top: rhythm(1)
    padding-bottom: rhythm(0.5)

    section
      flex: 0 0 75%

      h2
        font-size: $font-size-3
        font-weight: $font-weight-bold

      p
        color: $color-grey-dark
        font-size: $font-size-n1

    aside
      display: flex
      flex: 0 0 25%
      align-items: center
      justify-content: flex-end

      a
        margin-left: 1%
</style>
