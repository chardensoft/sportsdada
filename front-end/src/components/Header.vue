<template>
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
            <router-link class ="header-link" to="/About">About</router-link>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link" href="html/team.html">Team</a>
          </li> -->
          <li class="nav-item">
            <router-link class ="header-link" to="/Content">Content</router-link>
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

      <img class="logo" src="../assets/logo.png" />

    </nav>
  </div>
</template>

<style>
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

.logo {
  margin-right: -50px;
}

</style>
