<template>
  <div class="sheet">
    <div class="one-of-3">
      <div class="left-column-one">
        <div class="empty-square">
        </div>
        <div class="empty-square">
        </div>
        <div class="empty-square">
        </div>
      </div>
      <div class="right-side-one">
        <div class="top-squares-one">
          <div class="round-square">
          </div>
          <div class="round-square">
          </div>
          <div class="round-square">
          </div>
          <div class="round-square">
          </div>
          <div class="round-square">
          </div>
          <div class="round-square">
          </div>
        </div>
        <div class="track-squares-one">
          <div class="bonus-rect">
          </div>
          <div class="bonus-rect">
          </div>
        </div>
      </div>
    </div>
    <div class="two-of-3">
      <div class="left-square square-two">
      </div>
      <div class="right-square square-two">
      </div>
    </div>
    <div class="three-of-3">
      <div class="top-rect rect-three">
      </div>
      <div class="middle-rect rect-three">
      </div>
      <div class="bottom-rect rect-three">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PlayGames',
  title: 'SD: Play Games!',
  components: {

  }
}
</script>

<style>

.sheet {
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  border: 1px solid black;
  width: 400px;
  height: 600px;
  margin: auto;
}

.one-of-3 {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  height: 200px;
}

.two-of-3 {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  height: 200px;
}

.three-of-3 {
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  height: 200px;
}

.left-column-one {
  border: 1px solid black;
  margin: auto;
  width: 55px;
  height: 190px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}

.empty-square {
  border: 1px solid black;
  margin: auto;
  width: 55px;
  height: 190px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}

.right-side-one {
  margin: auto;
  width: 335px;
  height: 190px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}

.top-squares-one {
  border: 1px solid black;
  height: 60px;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}

.track-squares-one {
  border: 1px solid black;
  height: 120px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}

.square-two {
  border-radius: 10px;
  border: 1px solid black;
  margin: auto;
  width: 190px;
  height: 190px;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}

.rect-three {
  border-radius: 10px;
  margin: auto;
  border: 1px solid black;
  width: 390px;
  height: 60px;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}

</style>
