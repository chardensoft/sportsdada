<template>
  <div class="powder-header">
    <nav class="navbar navbar-expand-lg navbar-light">

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
            <img class = "powder-img" src="@/assets/powder.png" onclick="location.href = 'https://www.powderleague.com/'"/>
          </li>
          <li class="nav-item">
            <router-link class ="powder-header-link powder-link" to="/PowderStats">
                <p>Main</p></router-link>
          </li>
          <li class="nav-item">
            <router-link class ="powder-header-link powder-link" to="/Game">Games</router-link>
          </li>
          <li class="nav-item">
            <router-link class ="powder-header-link powder-link" to="/Player">Players</router-link>
          </li>
          <li class="nav-item">
            <router-link class ="powder-header-link powder-link" to="/Standings">Standings</router-link>
          </li>
          <li class="nav-item">
            <router-link class ="powder-header-link powder-link" to="/TeamStat">Teams</router-link>
          </li>
          <!-- <li class="nav-item">
            <router-link class ="powder-header-link powder-link" to="/The101">The 101</router-link>
          </li> -->

          <!-- <li class="nav-item">
            <router-link class ="powder-header-link" to="/">Back to Sports Dada</router-link>
          </li> -->
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
      <div class="powder-header_buttons">
        <button class = "" onclick="location.href = 'https://venmo.com/charden'">Donate</button>
        <button class = "" onclick="location.href = 'https://linktr.ee/sportsdada'">Follow</button>
      </div>
      <router-link to="/">
        <img class="alternate-logo" src="../assets/logo_alt.png" />
      </router-link>

    </nav>
  </div>
</template>

<style>
p {
  margin: 0;
}
.navbar {
  padding: 0 !important;
  background-color: white;
}
.alternate-logo {
  width: 200px;
}
.powder-img {
  width: 100px;
  cursor: pointer;
}
.powder-link,
.powder-link:active {
  color: #030303 !important;
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
.powder-header_buttons {
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
.powder-header {
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

.powder-header-link,
.powder-header-link:active {
  padding: 7px;
  color: #CE663D;
}

.powder-header-link:hover,
.powder-header-link:active:hover {
  color: #4670B4;
}

/* Mobile Styles */
@media only screen and (max-width: 991px) {
  .alternate-logo {
    width: 150px;
  }
  .powder-img {
    width: 50px;
  }

}


</style>
