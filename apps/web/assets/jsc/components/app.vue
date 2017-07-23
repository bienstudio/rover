<template>
  <div id="rover">
    <app-header>
      <ul slot="primary-nav" v-if="loggedIn">
        <li><a href="/trips">Trips</a></li>
        <li><a href="#">Destinations</a></li>
      </ul>
      <ul slot="primary-nav" v-else>
        Not logged in
      </ul>
      <ul slot="secondary-nav">
        <li><a href="/login">Login</a></li>
        <li><a href="/join">Join</a></li>
      </ul>
    </app-header>
    <slot name="content"></slot>
    <app-footer></app-footer>
  </div>
</template>

<script>
  import Vue from 'vue';

  import { mapMutations, mapGetters } from 'vuex';

  import AppHeader from './app-header.vue';
  import AppFooter from './app-footer.vue';

  Vue.component('app-header');
  Vue.component('app-footer');

  export default {
    components: { AppHeader, AppFooter },

    props: {
      current_user: Object
    },

    computed: {
      ...mapGetters({
        mobile: 'mobile',
        user: 'user',
        loggedIn: 'loggedIn'
      })
    },

    mounted () {
      window.addEventListener('resize', this.handleResize);

      this.handleResize();

      this.setUser(this.current_user);
    },

    beforeDestroy () {
      window.removeEventListener('resize', this.handleResize);
    },

    methods: {
      ...mapMutations([
        'handleResize',
        'setUser'
      ]),
    }
  };
</script>

<style lang="sass">
  @import "~css/_base.sass"

  body
    background: $color-white
    color: $color-text
    display: flex
    flex-flow: column
    font-family: $font-family-sans-serif
    font-size: $font-size-base
    font-weight: $font-weight-regular
    line-height: $line-height-normal
    max-width: 2200px

  a
    color: $color-text
    text-decoration: none

  main
    flex: 1
    margin: 0 rhythm(1)

  #rover
    display: flex
    min-height: 100vh
    flex-direction: column
</style>
