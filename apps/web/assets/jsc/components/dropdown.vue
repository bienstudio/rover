<template>
  <div class="dropdown">
    <a class="btn" @click="handleToggle"><slot name="button"></slot></a>
    <slot name="options" v-if="active"></slot>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        active: false
      };
    },

    methods: {
      handleToggle () {
        this.active = !this.active;
      }
    }
  };
</script>

<style lang="sass" scoped>
  @import "~css/_base.sass"
  @import "~css/_button.sass"

  .dropdown
    position: relative

  ul
    border-radius: $border-radius
    margin: 0 auto
    position: absolute
    z-index: 1
    transform: translateZ(0)

    &:before
      content: ''
      width: 0
      height: 0
      border-left: 5px solid transparent
      border-right: 5px solid transparent
      border-bottom: 5px solid $color-grey-light
      display: table
      border-collapse: separate
      margin: rhythm(0.15) auto 0

  li
    border-bottom: 1px solid $color-grey-light
    border-left: 1px solid $color-grey-light
    border-right: 1px solid $color-grey-light
    list-style-type: none

    &:first-child
      border-top: 1px solid $color-grey-light
      border-radius: $border-radius $border-radius 0 0

    &:last-child
      border-radius: 0 0 $border-radius $border-radius

    a
      background: $color-white
      display: block
      padding: 0 rhythm(0.5)

      &:hover
        background: $color-grey-light
</style>
