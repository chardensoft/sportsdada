<template>
  <div class="home">
    <Header />
    <div>
      <h1>What is Sports Dada?</h1>

    </div>
    <Footer />
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default {
  name: 'Home',
  title: 'Sports Dada',
  components: {
    Header,
    Footer,
  }
}
</script>

<style>


</style>
