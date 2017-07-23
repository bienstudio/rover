<template>
  <footer class="footer">
    <aside>
      <h3 class="footer__logo"><a href="#">Rover</a></h3>
      <p class="footer__copyright">&copy; {{ (new Date()).getFullYear() }}</p>
    </aside>
    <nav>
      <ul>
        <li><a href="#">About</a></li>
        <li><a href="#">FAQ</a></li>
        <li><a href="#">Support</a></li>
      </ul>
    </nav>
    <nav>
      <ul>
        <li><a href="#">About</a></li>
        <li><a href="#">FAQ</a></li>
        <li><a href="#">Support</a></li>
      </ul>
    </nav>
    <nav>
      <ul>
        <li><a href="#">About</a></li>
        <li><a href="#">FAQ</a></li>
        <li><a href="#">Support</a></li>
      </ul>
    </nav>
  </footer>
</template>

<script>
  export default { };
</script>

<style lang="sass">
  @import "~css/_base.sass"

  .footer
    border-top: 1px solid $color-grey-light
    color: $color-grey-dark
    display: flex
    margin-top: rhythm(1)
    padding: rhythm(1)

    a
      color: $color-grey-dark

    p
      font-size: $font-size-n2

    h3
      font-size: $font-size-n1
      font-weight: $font-weight-semibold

      a
        color: $color-grey-darkest

    aside, nav
      flex: 1

    li
      font-size: $font-size-n1
      list-style-type: none
</style>
