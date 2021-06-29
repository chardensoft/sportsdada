<template>
  <div class="powder">
    <Header />
    <div class="nonflex">
      <h3>Basketball Powder League Stats coming soon!</h3>
      <div class="outerbox">
        <router-link to="/Powder"><div class = "option">
          <h4 class="optionname">2PTs, 3PTs, FTs</h4>
        </div></router-link>
        <router-link to="/Powder"><div class = "option">
          <h4 class="optionname">OREBs, DREBs</h4>
        </div></router-link>
        <router-link to="/Powder"><div class = "option">
          <h4 class="optionname">STLs, ASTs</h4>
        </div></router-link>
        <router-link to="/Powder"><div class = "option">
          <h4 class="optionname">TOVs, BLKs</h4>
        </div></router-link>
        <router-link to="/Powder"><div class = "option">
          <h4 class="optionname">PFs, TimeOuts</h4>
        </div></router-link>
        <router-link to="/Powder"><div class = "option">
          <h4 class="optionname">OREBs, DREBs, STLs, PFs</h4>
        </div></router-link>
        <router-link to="/Powder"><div class = "option">
          <h4 class="optionname">ASTs, BLKs, TOVs, TimeOuts</h4>
        </div></router-link>
        <div class = "option">
          <h4 class="optionname">Lineups</h4>
        </div>
        <div class = "option">
          <h4 class="optionname">Game Clock</h4>
        </div>
        <div class = "option">
          <h4 class="optionname">Shot Clock</h4>
        </div>
        <div class = "option">
          <h4 class="optionname">Other</h4>
        </div>
      </div>
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

h3 {
  padding-top: 20px;
  color: #4670B4;
}
.outerbox {
  margin: 20px;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.option {
  height: 200px;
  width: 200px;
  margin: 10px;
  border: 2px solid #4670B4;
  display: flex;
  align-items: center;
  justify-content: center;
}

.optionname {

}


</style>
