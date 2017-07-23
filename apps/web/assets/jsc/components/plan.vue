<template>
  <article>
    <aside>
      <span>{{ formatTime(plan.start_time) }}</span>
    </aside>
    <section>
      <p>
        <span v-html="iconText(plan)"></span>
        {{ plan.description }}
      </p>
    </section>
  </article>
</template>

<script>
  import moment from 'moment';

  export default {
    props: {
      plan: Object
    },

    methods: {
      formatTime (time) {
        return moment(time).format('hh:mma');
      },

      iconText (plan) {
        let type = plan.type
        let text = '&#128694;';

        if (type === 'flight') {
          text = '&#9992;'
        }

        return text;
      }
    }
  };
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  article
    display: flex

  aside
    flex: 0 0 8%
    margin-right: 2%

    span
      color: $color-grey-dark
      font-size: $font-size-n1

  section
    flex: 0 0 90%
</style>
