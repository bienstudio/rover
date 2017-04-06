<template>
  <footer class="footer">
    <p>&copy; {{ (new Date()).getFullYear() }}</p>
  </footer>
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

  .footer
    border-top: 1px solid $color-grey-light
</style>
