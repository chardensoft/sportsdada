<template>
  <div class="full-header">
    <div class="header">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <!-- <li class="nav-item">
              <a class="nav-link" href="html/apply.html">Apply</a>
            </li> -->
            <li class="nav-item">
              <router-link class ="header-link" to="/">Home</router-link>
            </li>
            <li class="nav-item">
              <router-link class ="header-link" to="/Entries">Entries</router-link>
            </li>
            <!-- <li class="nav-item">
              <router-link class ="header-link" to="/About">About</router-link>
            </li> -->
            <li class="nav-item">
              <a class ="header-link wreport-link" href="https://thewoodreportxc.com/" target="_blank">
                  <img class = "normal-wreport-img" src="@/assets/wreport.png" /><p>The Wood Report</p></a>
            </li>
            <li class="nav-item">
              <router-link class ="header-link powder-link" to="/PowderStats">
                  <img class = "normal-powder-img" src="@/assets/powder.png" /><p>Powder League</p></router-link>
            </li>
            <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Products
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="">Fake Plants</a>
                <a class="dropdown-item" href="">Real Plants</a>
                <a class="dropdown-item" href="">Accessories</a>
              </div>
            </li> -->

          </ul>
        </div>
        <!-- <div class="header_buttons">
          <button class = "" onclick="location.href = 'https://twitter.com/SportsDada'">Follow</button>
          <button class = "" onclick="location.href = 'https://www.sportsdada.net'">Learn More</button>
        </div> -->
        <img class="normal-logo" src="../assets/logo.png" />

      </nav>
    </div>
    <!-- <Featured /> -->
  </div>
</template>

<script>
import Featured from '@/components/Featured.vue';

export default {
  name: 'Header',
  components: {
    Featured,
  }
}
</script>

<style>
p {
  margin: 0;
}
.normal-logo {
  width: 400px;
}
.normal-powder-img {
  width: 35px;
}
.normal-wreport-img {
  width: 35px;
}
.powder-link,
.powder-link:active {
  color: #030303 !important;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.wreport-link,
.wreport-link:active {
  color: #F3B23D !important;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.powder-link:hover,
.powder-link:hover:active {
  color: #616161 !important;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.wreport-link:hover,
.wreport-link:hover:active {
  color: #0F4C75 !important;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.header_buttons {
  margin-right: 10px;
  display: flex;
  justify-content: space-around;
  flex-direction: column;
}
button:active, button {
  cursor: pointer;
  margin: 5px;
  border-radius: 5px;
  border: solid #83C4E7 1px;
  background-color: #83C4E7;
  color: black;
}
button:hover,
button:hover:active {
  cursor: pointer;
  margin: 5px;
  border-radius: 5px;
  border: solid #83C4E7 1px;
  background-color: #F8F9FA;
  color: #CE663D;
}
.header {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  padding-left: 10px;
}
  /*color: #CE663D; <- orange*/
  /*color: #83C4E7; <- light blue*/
  /*color: #4670B4; <- dark blue */

.nav-item {
  font-size: 25px;
  font-weight: bold;
  display: flex;
  align-items: center;
}

.header-link,
.header-link:active {
  padding: 7px;
  color: #CE663D;
}

.header-link:hover,
.header-link:active:hover {
  color: #4670B4;
}

@media only screen and (min-width: 991px) and (max-width: 1080px) {
  .wreport-link,
  .powder-link {
    font-size: 19px;
  }
}

/* Mobile Styles */
@media only screen and (max-width: 991px) {
  .normal-logo {
    width: 200px;
  }
  .normal-powder-img {
    width: 35px;
  }
}


</style>
