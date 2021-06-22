<template>
  <div class="powder">
    <Header />
    <div>
      <h1 class="comingsoon">Powder League Coming Soon!</h1>
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default {
  name: 'Powder',
  components: {
    Header,
    Footer,
  }
}
</script>

<style>



</style>
