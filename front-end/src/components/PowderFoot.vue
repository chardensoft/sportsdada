<template>
  <div class="powder-footer">
    <div class="powder-footer-content">
      <h6 class ="header6">All content copyright © Powder League, © Sports Dada</h6>
      <!-- <h6 class ="header6">
        <a href="https://linktr.ee/sportsdada" target="_blank">Donate/Follow</a>
      </h6> -->
      <!-- <div class="powder-footer_buttons">
        <button class = "" onclick="location.href = 'https://venmo.com/charden'">Donate</button>
        <button class = "" onclick="location.href = 'https://twitter.com/SportsDada'">Follow</button>
      </div> -->
      <div style="width: 100%"><a href="https://hi.volley.app/talktome?tk=SWhSzZrhYRX0penTYVAngX-tk"><img src="https://pieces.volley.app/icons/talkToMeBadge.png" alt=" " style="width:104px;height:44px;min-width:104px;min-height:44px;border-radius:12px;-webkit-border-radius:12px;-moz-border-radius:12px;background-size:contain;background-image:url('data:image/png;base64,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')"></a></div>
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
