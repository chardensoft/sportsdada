<template>
  <div class="home">
    <HomeHeader />
    <div class="featured">
      <a class="featured-link" href="https://sportsdadas.blogspot.com/2021/07/sports-dadas-powder-league-mvp-ladder.html" target="_blank">
      <div class="featured-content">
        <h1 class ="featured-header">Click Here! Featured Article: Powder League MVP Ladder</h1>
      </div></a>
    </div>
    <div class="article-list">
      <h3 class="">Article 1</h3>
    </div>
    <Footer />
  </div>
</template>

<script>
import HomeHeader from '@/components/HomeHeader.vue';
import Footer from '@/components/Footer.vue';

export default {
  name: 'Home',
  title: 'Sports Dada',
  components: {
    HomeHeader,
    Footer,
  }
}
</script>

<style>


</style>
