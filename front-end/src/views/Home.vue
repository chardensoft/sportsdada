<template>
  <div class="home">
    <HomeHeader />
    <div class="content-header">
      <h1 class="content-title">Current Content</h1>
    </div>
    <div class="current-content">
      <div class="company">
        <a class="comp_link" href="https://sportsdada.substack.com/" target="_blank">
          <img class="comp_logo" src="../assets/headshot.png" />
          <p class="comp_text">My Substack Newsletter: Writing about what I love and sharing tips along the way</p>
        </a>
      </div>
      <div class="company">
        <a class="comp_link" href="https://www.tiktok.com/@chrisandkemi" target="_blank">
          <img class="comp_logo" src="../assets/tiktok.png" />
          <p class="comp_text">TikTok: Sharing videos about my journey to ESPN and my family</p>
        </a>
      </div>
      <div class="company">
        <a class="comp_link" href="https://join.slack.com/t/sportsdada/shared_invite/zt-12vf175g6-MawHJaMtSKiHTAIinOCkyQ" target="_blank">
          <img class="comp_logo" src="../assets/slack.png" />
          <p class="comp_text">Slack: Join the community if you're an aspiring sports analyst or just enjoy sports!</p>
        </a>
      </div>
      <div class="company">
        <a class="comp_link" href="https://www.linkedin.com/in/chris-harden/" target="_blank">
          <img class="comp_logo" src="../assets/linkedin.png" />
          <p class="comp_text">LinkedIn: Sharing tips and thoughts about sports analytics &amp; data science</p>
        </a>
      </div>
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
