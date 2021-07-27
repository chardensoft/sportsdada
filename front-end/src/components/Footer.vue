<template>
  <div class="footer">
    <div class="footer-content bg-light">
      <h6 class ="header6">All content copyright © Sports Dada</h6>
      <!-- <h6 class ="header6">
        <a href="https://linktr.ee/sportsdada" target="_blank">Donate/Follow</a>
      </h6> -->
      <div class="footer_buttons">
        <button class = "" onclick="location.href = 'https://venmo.com/charden'">Donate</button>
        <button class = "" onclick="location.href = 'https://www.instagram.com/sports.dada/'">Follow</button>
      </div>
      <h6 class ="header6">Text me: 801.712.0713</h6>
    </div>

  </div>
</template>

<style>
.footer_buttons {
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
.footer {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  margin-top: 100px;
}

.footer-content {
  padding: 20px;
}

.header6 {
  color: #CE663D;
  padding-top: 5px;
}


</style>
