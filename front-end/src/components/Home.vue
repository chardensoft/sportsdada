<template>
  <div class="home">
    <div class="content-header">
      <h1 class="content-title">Current Projects</h1>
    </div>
    <div class="home-content">

      <!-- <div class="company">
        <a class="comp_link" href="https://www.tiktok.com/@chrisandkemi" target="_blank">
          <img class="comp_logo" src="../assets/tiktok.png" />
          <p class="comp_text">TikTok: Sharing videos about my journey to ESPN and my family</p>
        </a>
      </div> -->
      <div class="company">
          <a class ="comp_link" href="https://www.espn.com/espn/feature/story/_/id/40638387/2024-college-football-allstate-playoff-bracket-predictor" target="_blank">
            <img class="comp_logo" src="../assets/allstate.png" />
            <p class="comp_text">CFB Allstate Playoff Predictor</p>
          </a>
        </div>
        <!-- <div class="company">
          <a class ="comp_link comp_link_party" href="https://hardensoulparty.com/" target="_blank">
            <img class="comp_logo_party" src="../assets/Hardensoul Party cropped white.png" />
            <p class="comp_text">Hardensoul Party</p>
          </a>
        </div> -->
        
        <div class="company">
          <a class ="comp_link" href="https://espnanalytics.com/receivers" target="_blank">
            <img class="comp_logo_rec" src="../assets/receiver.png" />
            <p class="comp_text">NFL Receiver Scores</p>
          </a>
        </div>
        <div class="company">
          <a class ="comp_link" href="https://www.espn.com/nfl/story/_/id/40617435/2024-nfl-playoff-picture-afc-nfc-seed-predictions-odds-super-bowl" target="_blank">
            <img class="comp_logo_nfl" src="../assets/nfl_playoffs.png" />
            <p class="comp_text">NFL Playoff Projections</p>
          </a>
        </div>
        <div class="company">
          <a class ="comp_link" href="https://www.espn.com/wnba/story/_/id/40847083/2024-wnba-playoffs-tracker-making-biggest-impact-more" target="_blank">
            <img class="comp_logo" src="https://a.espncdn.com/i/infographics/wnba_wpa/wpa_top5_line.jpg" />
            <p class="comp_text">WNBA Player Metrics</p>
          </a>
        </div>
      <div class="company">
          <a class ="comp_link" href="https://espn.com/nba/bpi" target="_blank">
            <img class="comp_logo_espn" src="../assets/red_espn.png" />
            <p class="comp_text">NBA Power Index</p>
          </a>
        </div>
        <div class="company">
          <router-link class ="comp_link" to="/ESPN">
            <img class="comp_logo" src="../assets/ESPN_ANALYTICS_1.png" />
            <p class="comp_text">Other ESPN Analytics Projects</p>
          </router-link>
        </div> 
        
      <!-- <div class="company">
          <router-link class ="comp_link" to="/ESPN">
            <img class="comp_logo" src="../assets/ESPN_ANALYTICS_1.png" />
            <p class="comp_text">Working on projects and articles for the ESPN Analytics Team</p>
          </router-link>
        </div> -->
        <!-- <div class="company">
          <a class="comp_link" href="https://me.volley.app/chris-harden">
            <img class="comp_logo" src="../assets/volley.png" />
            <p class="comp_text">Helping aspiring sports analysts get noticed, set up a chat with me!</p>
          </a>
        </div> -->
      <!-- <div class="company">
        <a class="comp_link" href="https://www.twitter.com/SportsDada/" target="_blank">
          <img class="comp_logo" src="../assets/twitter.png" />
          <p class="comp_text">Tweeting data viz &amp; interesting stats</p>
        </a>
      </div> -->
        <!-- <div class="company">
          <a class="comp_link" href="https://letterboxd.com/charden/" target="_blank">
            <img class="comp_logo" src="../assets/letterboxd.png" />
            <p class="comp_text">Watching movies :)</p>
          </a>
        </div> -->
      <!-- <div class="company">
        <a class="comp_link" href="https://sportsdada.substack.com/" target="_blank">
          <img class="comp_logo" src="../assets/headshot.png" />
          <p class="comp_text">Writing about what I love + tips along the way on Substack</p>
        </a>
      </div> -->
        
      <!-- <div class="company">
          <a class="comp_link" href="https://www.linkedin.com/in/chris-harden/" target="_blank">
            <img class="comp_logo" src="../assets/linkedin.png" />
            <p class="comp_text">Hanging on LinkedIn</p>
          </a>
        </div> -->
    </div>
  </div>
</template>

<script>

export default {
  name: 'Home',
  components: {
  }
}
</script>

<style>
.home {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-align: center;
}

.content-title {
  padding-top: 30px;
  color: #4670B4;
  font-weight: bold;
}

.content-page-subtitle {

}

.content-page-title {
  padding-left: 0px;
  font-weight: bold;
}

.content-subtitle {
  color: black;
}

.articles,
.projects {
  padding-top: 10px;
  color: #4670B4;
}

a,
a:active {
  color: #24ADF2;
  text-decoration: underline;
}

a:hover,
a:active:hover {
  color: #CE663D;
}

.list {
  padding-left: 25px;
  padding-top: 10px;
}

.citystreetstrat-title {
  color: #4670B4;
}

.links-list {
  padding-left: 25px;
  padding-top: 10px;
  list-style: none;
}

.home-content {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  padding-right: 0px;
}

.company {
  padding: 25px;
  margin: 25px;
  border: 1px solid #CE663D;
  border-radius: 25px;
}

.comp_text {
  padding-top: 5px;
  width: 250px;
}

.comp_link:active,
.comp_link {
  color: #4670B4;
  text-decoration: none;
  text-align: center;
}

.comp_link:active:hover,
.comp_link:hover {
  color: #4670B4;
  text-decoration: underline;
}

.comp_logo {
  width: 250px;
  height: 250px;
}

.comp_logo_party {
  width: 250px;
  padding-top: 46.875px;
  padding-bottom: 46.875px;
}

.comp_logo_espn {
  width: 250px;
  padding-top: 92.325px;
  padding-bottom: 92.325px;
}

.comp_logo_rec {
  width: 250px;
  padding-top: 58.855px;
  padding-bottom: 58.855px;
}

.comp_logo_nfl {
  width: 250px;
  padding-top: 20.705px;
  padding-bottom: 20.705px;
}

/* Mobile Styles */
@media only screen and (max-width: 600px) {
  .home {
    width: 100%;
    text-align: center;
    padding-left: 5px;
    padding-right: 5px;
  }
  .current-content {
    padding-right: 0px;
  }
  .list {
    padding-left: 5px;
    padding-right: 5px;
  }
  .links-list {
    padding-left: 5px;
    padding-right: 5px;
  }
  .articles-title,
  .projects-title {
    text-decoration: underline;
  }

}
/* Tablet Styles */
@media only screen and (min-width: 451px) and (max-width: 700px) {

}



</style>
