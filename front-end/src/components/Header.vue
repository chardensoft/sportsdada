<template>
  <div class="full-header">
    <div class="header">

      <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <img class="normal-logo2" src="../assets/logo.png" />
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <!-- <li class="nav-item">
              <a class="nav-link" href="html/apply.html">Apply</a>
            </li> -->
            <li class="nav-item">
              <router-link class ="header-link header-link1" to="/">Home</router-link>
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
            <li class="nav-item volley-item"><a href="https://me.volley.app/chris-harden"><img src="https://pieces.volley.app/icons/consultWithMeBadge.png" alt=" " style='width:104px;height:44px;min-width:104px;min-height:44px;border-radius:12px;-webkit-border-radius:12px;-moz-border-radius:12px;background-size:contain;background-repeat:no-repeat;background-image:url("data:image/png;base64,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")'
            ></a></li>
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
.normal-logo2 {
  display: none;
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

.header-link1 {
  padding-left: 10px;
}

.volley-item {
  padding-left: 20px;
}

@media only screen and (min-width: 991px) and (max-width: 1200px) {
  .wreport-link,
  .powder-link {
    font-size: 19px;
  }
  .volley-item {
    padding-right: 30px;
    padding-left: 0px;
  }
}

/* Mobile Styles */
@media only screen and (max-width: 991px) {
  .normal-logo {
    display: none;
  }
  .normal-logo2 {
    display: block;
    float: right;
    height: 50px;
  }
  .volley-item {
    padding-left: 10px;
  }
  .normal-powder-img {
    width: 35px;
  }
}


</style>
