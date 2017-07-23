<template>
  <div class="panel">
    <h1><a href="#">Rover</a></h1>
    <p v-if="hasErrors()">{{ this.messages.error }}</p>
    <form action="/sessions/create" class="form" method="post">
      <div class="form__field">
        <label for="email">Email</label>
        <div class="form__action">
          <input type="text" class="form__input" name="email">
        </div>
      </div>
      <div class="form__field">
        <label for="password">Password</label>
        <div class="form__action">
          <input type="password" class="form__input" name="password">
        </div>
      </div>
      <footer class="form__footer">
        <button type="submit" class="btn btn--blue btn--small">Login</button>
      </footer>
    </form>
  </div>
</template>

<script>
  export default {
    props: {
      messages: Object
    },

    methods: {
      hasErrors () {
        this.messages.hasOwnProperty('error');
      }
    }
  }
</script>

<style lang="sass" >
  @import "~css/_base.sass"
  @import "~css/_button.sass"

  body
    background: $color-grey-light

  h1
    font-size: $font-size-1
    font-weight: $font-weight-bold
    margin-bottom: rhythm(0.5)

  .form
    text-align: left

    &__field
      margin-bottom: rhythm(0.5)

    label
      font-size: $font-size-n1

    input
      border: 1px solid $color-grey-light
      border-radius: 2px
      box-sizing: border-box
      display: block
      font-size: $font-size-1
      font-family: $font-family-sans-serif
      outline: none
      padding: rhythm(0.25)
      width: 100%

    &__footer
      button
        float: right

  #app
    display: flex
    min-height: 100vh
    align-items: center
    justify-content: center

  .panel
    background: $color-white
    border-radius: 2px
    padding: rhythm(1.5) rhythm(1)
    text-align: center
    width: $breakpoint / 2
    margin:
      right: auto
      left: auto
</style>
