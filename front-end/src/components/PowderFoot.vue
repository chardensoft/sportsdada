<template>
  <div class="powder-footer">
    <div class="powder-footer-content">
      <h6 class ="header6">All content copyright © Powder League © Sports Dada</h6>
      <!-- <h6 class ="header6">
        <a href="https://linktr.ee/sportsdada" target="_blank">Donate/Follow</a>
      </h6> -->
      <div class="powder-footer_buttons">
        <button class = "" onclick="location.href = 'https://venmo.com/charden'">Donate</button>
        <button class = "" onclick="location.href = 'https://www.instagram.com/sports.dada/'">Follow</button>
      </div>
      <h6 class ="header6">Email me: charden@berkeley.edu</h6>
    </div>

  </div>
</template>

<style>
.powder-footer {
  background-color: #F8F9FA;
  color: #F8F9FA;
  text-align: center;
}
.powder-footer_buttons {
  display: flex;
  justify-content: center;
  flex-direction: row;
}
button:active, button {
  cursor: pointer;
  border-radius: 5px;
  border: solid #83C4E7 1px;
  background-color: #83C4E7;
  color: black;
}
button:hover,
button:hover:active {
  cursor: pointer;
  border-radius: 5px;
  border: solid #83C4E7 1px;
  background-color: #F8F9FA;
  color: #CE663D;
}
.powder-footer {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  padding-top: 100px;
}

.powder-footer-content {
  padding: 20px;
}

.header6 {
  color: #CE663D;
  padding-top: 5px;
}


</style>
