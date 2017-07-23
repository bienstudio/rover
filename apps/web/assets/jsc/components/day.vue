<template>
  <article>
    <header>
      <h3>{{ formatDate(date) }}</h3>
    </header>
    <section>
      <plan v-for="plan in plans" v-bind:plan="plan" :key="plan.id"></plan>
    </section>
  </article>
</template>

<script>
  import Vue from 'vue';

  import moment from 'moment';

  import Plan from './plan.vue';

  Vue.component('plan');

  export default {
    components: { Plan },

    props: {
      date: Object,
      plans: Array
    },

    methods: {
      formatDate (date) {
        return moment(date).format('dddd, MMM Do, YYYY');
      }
    }
  };
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  article
    margin-bottom: rhythm(1)

  header
    h3
      display: inline-block
      font-size: $font-size-1
      font-weight: $font-weight-semibold
</style>
