<template>
  <div class="about">
    <Header />
    <div>
      <h1 class="comingsoon">About Page Coming Soon!</h1>
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default {
  name: 'About',
  components: {
    Header,
    Footer,
  }
}
</script>

<style>
.about {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.comingsoon {
  padding: 200px;
  color: #4670B4;
  margin-bottom: 300px;
}

@media only screen and (max-width: 450px) {
  .comingsoon {
    padding: 5px;
    padding-top: 200px;
    padding-bottom: 200px;
  }
}

</style>
