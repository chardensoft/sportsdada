<template>
  <div class="featured">
    <a class="featured-link" href="https://fantasy.espn.com/games/basketball-draft-challenge-2022/group?id=1e633ff5-ceb8-4e61-8b2c-174fee5dda0d&joining=true" target="_blank">
    <div class="featured-content">
      <h3 class ="featured-header">Featured: Come Join My NBA Draft Group</h3>
    </div></a>
  </div>
</template>

<style>
.featured-header,
.featured-header:active {
  padding: 10px 10px 5px 10px;
  color: white;
}

.featured-header:hover,
.featured-header:hover:active {
  color: #2056A7;
}

.featured {
  /* margin-top: -30px; */
  padding-bottom: 10px;
}

.featured-link,
.featured-link:active {
  text-decoration: none;
  /* text-decoration-color: #fff; */
}

.featured-link:hover,
.featured-link:hover:active {
  text-decoration: none;
  /* text-decoration-color: #2056A7; */
}

.featured-content {
  border: solid 2px #4570B4;
  /* margin: 2% 5% 1% 5%; */
  /* border-radius: 15px; */
  background-color: #4570B4;
  color: #fff;
  box-shadow: 0 0 40px 40px #4570B4 inset, 0 0 0 0 #4570B4;
  -webkit-transition: all 150ms ease-in-out;
  transition: all 150ms ease-in-out;
}

.featured-content:hover {
  background-color: #fff;
  color: #2056A7;
  box-shadow: 0 0 10px 0 #2056A7 inset, 0 0 10px 4px #2056A7;
}

.third {
  border-color: #3498db;
  color: #fff;
  box-shadow: 0 0 40px 40px #3498db inset, 0 0 0 0 #3498db;
  -webkit-transition: all 150ms ease-in-out;
  transition: all 150ms ease-in-out;
}

.third:hover {
  box-shadow: 0 0 10px 0 #3498db inset, 0 0 10px 4px #3498db;
}


</style>
