<template>
  <div class="about">
    <Header />
    <div class="about-content">
      <div class="about-info">
        <div class="text-info">
          <h1 class="hi-info">Hey! I'm Chris Harden and welcome to Sports Dada!</h1>
          <br>
          <h6 class="small-info">I'm a Sports Analyst on ESPN's Sports Analytics Team. We're responsible for key statistics produced by ESPN such as BPI in the NBA and QBR in the NFL.</h6>
          <h6 class="small-info">I'm a lucky husband and a dad of two adorable kids, a huge Boston sports fan, and I love building things!</h6>
        </div>
      </div>
      <div class="about-pic-div">
        <img class="about-pic" src="../assets/aboutpic.jpeg">
      </div>
      <!-- <h1 class="comingsoon">About Page Coming Soon!</h1> -->
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default {
  name: 'About',
  title: 'Sports Dada: About',
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

.about-content {
  padding-top: 50px;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.text-info {
  padding: 75px;
}

.about-info {
  width: 700px;
  /* border: 2px solid black; */
}

.hi-info {
  color: black;
  font-size: 47.5px;
  text-align: left;
}

.small-info {
  color: black;
  text-align: left;
}

/* .comingsoon {
  padding: 200px;
  color: #4670B4;
  margin-bottom: 300px;
} */

.about-pic {
  width: 400px;
}

.about-pic-div {
  /* border: 2px solid black; */
}

@media only screen and (max-width: 700px) {
  .about-info {
    width: 300px;
  }
  .text-info {
    padding: 5px;
  }
  .hi-info {
    font-size: 30px;
  }
  .about-pic {
    width: 300px;
  }
  /* .comingsoon {
    padding: 5px;
    padding-top: 200px;
    padding-bottom: 200px;
  } */
}

</style>
