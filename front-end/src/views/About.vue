<template>
  <div class="about">
    <Header />
    <!-- <Featured /> -->

    <div class="about-content">
      <div class="about-info">
        <div class="text-info">
          <h1 class="hi-info">Hey! I'm Chris Harden and welcome to Sports Dada!</h1>
          <br>
          <h6 class="small-info">Sports Dada was originally created so I could get noticed as I worked to get into the sports industry. I showcased projects and tried to show my worth.</h6>
          <h6 class="small-info">Now, I'm enjoying being part of ESPN's Sports Analytics Team. We're responsible for key statistics output on ESPN such as BPI in the NBA or QBR in the NFL.</h6>
          <h6 class="small-info">I use the site to keep sharing things I've created or worked on and to try to help others along the way! I'm a lucky husband, dad of two adorable kids and a huge Boston sports fan. I love building things, hanging with my kids and watching movies with my wife.</h6>


        </div>
      </div>
      <div class="about-pic-div">
        <img class="about-pic" src="../assets/aboutpic.jpeg">
      </div>
    </div>

    <Home />

    <Footer />

  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
import Home from '@/components/Home.vue';
import Featured from '@/components/Featured.vue';

export default {
  name: 'About',
  title: 'Sports Dada: About',
  components: {
    Header,
    Footer,
    Home,
    Featured,
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
  padding: 50px;
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
  width: 300px;
}

.about-pic-div {
  /* border: 2px solid black; */
}

@media only screen and (max-width: 600px) {
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
