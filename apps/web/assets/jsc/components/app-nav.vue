<template>
  <header class="header">
    <aside class="header__banner">
      <h1 class="header__logo"><a href="/">Rover</a></h1>
      <a class="js-nav-toggle header__toggle" @click="handleToggle"><i class="ss-icon">rows</i></a>
    </aside>
    <nav class="nav header__nav" v-if="(mobile && navShowing) || !mobile">
      <slot name="primary-nav"></slot>
      <slot name="secondary-nav"></slot>
    </nav>
  </header>
</template>

<script>
  export default {
    data () {
      return {
        mobile: false,
        navShowing: false
      };
    },

    mounted () {
      window.addEventListener('resize', this.handleResize);

      this.handleResize();
    },

    beforeDestroy () {
      window.removeEventListener('resize', this.handleResize);
    },

    methods: {
      handleResize () {
        this.mobile = document.documentElement.clientWidth <= 960;
      },

      handleToggle () {
        this.navShowing = !this.navShowing;
      }
    }
  };
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"

  .header
    background: $color-white
    display: flex
    flex-flow: row
    flex-wrap: wrap
    padding: rhythm(0.5) rhythm(1)

    &__banner
      flex: 0 0 10%
      display: flex

    &__logo
      font-weight: $font-weight-bold

    &__nav
      flex: 0 0 90%
      display: flex

      ul
        flex: 1

        &:last-child
          text-align: right

        li
          display: inline-block
          font-size: $font-size-n1
          list-style-type: none

          & + li
            margin-left: rhythm(0.5)

          a
            color: $color-grey-dark

            &:hover
              color: $color-grey-darkest

    .js-nav-toggle
      display: none

    @media (max-width: $breakpoint)
      .js-nav-toggle
        display: block

      .header
        flex-flow: column

        &__banner
          flex: 0 0 100%

        &__logo
          flex: 0 0 80%

        &__toggle
          flex: 0 0 20%
          text-align: right

        &__nav
          flex: 0 0 100%

          li
            display: block
            margin-left: 0
</style>
