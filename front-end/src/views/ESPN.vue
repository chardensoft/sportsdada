<template>
  <div>
    <Header />
    <!-- <Featured /> -->

    <div class="espn-content">
      <!-- <div class="content-header">
        <h1 class="content-title">ESPN Analytics</h1>
      </div> -->
      <img class="espn-page-comp-logo" src="../assets/ESPN_ANALYTICS_1.png" />
      <div class="page-key"> 
        <h4>Key:  </h4> 
        <div class="model-box key-box">
          <p class="model-link key_text">Model</p>
        </div>
        <div class="viz-box key-box">
          <p class="viz-link key_text">Viz</p>
        </div>
        <div class="article-box key-box">
          <p class="article-link key_text">Article</p>
        </div>
      </div>
      <div class="espn-current-content">
        
        <!-- <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://www.espn.com/nba/statistics/rpm" target="_blank">
            <p class="espn_comp_text">NBA RPM</p>
          </a>
        </div> -->
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/nba/story?id=40406806&_slug_=2024-nba-draft-day-predictor-forecasting-round-1-picks-risers-fallers-fan-mock" target="_blank">
            <p class="espn_comp_text">Forecasting the 2024 NBA Draft</p>
          </a>
        </div>
        <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://espnanalytics.com/nba-draft-predictor" target="_blank">
            <p class="espn_comp_text">2024 NBA Draft Predictor Model</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/nba-draft-sim" target="_blank">
            <p class="espn_comp_text">2024 NBA Draft Predictor, Simulator, & Mock Draft Builder</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/mock-draft" target="_blank">
            <p class="espn_comp_text">2024 NFL Draft Mock Draft Builder</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/draft-sim" target="_blank">
            <p class="espn_comp_text">2024 NFL Mock Draft Simulator</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/draft-predictor" target="_blank">
            <p class="espn_comp_text">2024 NFL Draft Day Predictor</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/wcbbAll" target="_blank">
            <p class="espn_comp_text">2024 Live March Madness Projections</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/wcbbGames" target="_blank">
            <p class="espn_comp_text">2024 Live March Madness Win Probability</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://www.espn.com/espn/feature/story?id=39603240" target="_blank">
            <p class="espn_comp_text">Live March Madness Projections Over Time</p>
          </a>
        </div>
        <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://www.espn.com/mens-college-basketball/insider/story/_/id/39761076/mens-march-madness-2024-giant-killers-top-10-first-round-upset-predictions" target="_blank">
            <p class="espn_comp_text">Men's BPI Giant Killers Model</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/womens-college-basketball/insider/story/_/id/39718515/womens-bubble-watch-2024-ncaa-tournament-march-madness-bracket-predictions" target="_blank">
            <p class="espn_comp_text">Women's Bubble Watch Post-Conf Tournaments</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/womens-college-basketball/story/_/id/39709186/women-march-madness-ncaa-tournament-bpi-south-carolina" target="_blank">
            <p class="espn_comp_text">Women's Top Contenders</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://twitter.com/SportsDada/status/1769531648251445565?s=20" target="_blank">
            <p class="espn_comp_text">Graphic for Women's Top Contenders</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/womens-college-basketball/insider/story/_/id/39663602/womens-bubble-watch-2024-ncaa-tournament-march-madness-bracket-predictions" target="_blank">
            <p class="espn_comp_text">Women's Bubble Watch Pre-Conf Tournaments</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/" target="_blank">
            <p class="espn_comp_text">ESPN Analytics website</p>
          </a>
        </div>
        <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://web.archive.org/web/20240321142314/https://www.espn.com/womens-college-basketball/game/_/gameId/401637542/arizona-auburn" target="_blank">
            <p class="espn_comp_text">2023-24 Women's College Basketball Power Index</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/draft-order" target="_blank">
            <p class="espn_comp_text">Live 2024 NFL Draft Pick Projections</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://www.espn.com/nfl/story/_/id/38890147/2023-nfl-playoffs-afc-nfc-seed-projections-predictions-super-bowl" target="_blank">
            <p class="espn_comp_text">2023 NFL Playoff Probability Graphics</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.youtube.com/watch?v=pflImydtuus" target="_blank">
            <p class="espn_comp_text">2023 ESPN Edge Conference</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://twitter.com/SportsDada/status/1737246114191974792" target="_blank">
            <p class="espn_comp_text">NFL RTM Player Cards</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://vimeo.com/901944245" target="_blank">
            <p class="espn_comp_text">CFB 4th Down Recommendation Stoplight</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/rtm" target="_blank">
            <p class="espn_comp_text">NFL Receiver Tracking Metrics</p>
          </a>
        </div>
        <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://www.espn.com/mens-college-basketball/bpi/_/season/2024" target="_blank">
            <p class="espn_comp_text">2023-24 Men's College Basketball Power Index</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://www.espn.com/mlb/story/_/id/38340689/2023-mlb-playoffs-clinching-scenarios-bracket-schedule" target="_blank">
            <p class="espn_comp_text">2023 MLB Playoff Probability Graphics</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnanalytics.com/decision" target="_blank">
            <p class="espn_comp_text">NFL 4th Down Decision Analysis</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/nba/insider/insider/story/_/id/37875763/2023-nba-draft-projections-best-prospects-most-overrated-underrated" target="_blank">
            <p class="espn_comp_text">2023 NBA Draft: Best prospects, most overrated, underrated</p>
          </a>
        </div>
        <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://www.espn.com/nba/draft/projections" target="_blank">
            <p class="espn_comp_text">2023 NBA Draft Projections</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnsportsanalytics.com/nfl-sim" target="_blank">
            <p class="espn_comp_text">2023 NFL Draft Simulator</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnsportsanalytics.com/nfl-draft/conference_over_under.html" target="_blank">
            <p class="espn_comp_text">2023 NFL Draft Betting Tool</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnsportsanalytics.com/nfl-draft" target="_blank">
            <p class="espn_comp_text">2023 NFL Draft Predictor</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://espnsportsanalytics.com/wcbb" target="_blank">
            <p class="espn_comp_text">2023 Live March Madness Projections, Win Probability</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/mens-college-basketball/story/_/id/35805801/champ-week-games-shape-ncaa-tournament-bubble-according-bpi" target="_blank">
            <p class="espn_comp_text">Champ Week Games that Could Shape the Bubble</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/mens-college-basketball/story/_/id/35594002/bpi-stats-backed-strengths-weaknesses-powerhouses-texas-kansas-2022-23" target="_blank">
            <p class="espn_comp_text">Texas @ Kansas is one of the best matchups this season and here's why</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/mens-college-basketball/story/_/id/35460227/the-big-12-best-conference-men-college-basketball-2022-23" target="_blank">
            <p class="espn_comp_text">Top to bottom, the Big 12 is the best conference in men's college basketball</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/mens-college-basketball/story/_/id/35287917/even-jumpman-invitational-michigan-men-basketball-season-over" target="_blank">
            <p class="espn_comp_text">Jumpman Invitational: Is Michigan's season already over?</p>
          </a>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/mens-college-basketball/story/_/id/35092437/at-phil-knight-invitational-north-carolina-worse-alabama" target="_blank">
            <p class="espn_comp_text">Phil Knight Invitational: North Carolina is worse than you think, but Alabama is better</p>
          </a>
        </div>
        <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://www.espn.com/mens-college-basketball/bpi/_/season/2023" target="_blank">
            <p class="espn_comp_text">2022 Men's College BPI</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://vimeo.com/901935070" target="_blank">
            <p class="espn_comp_text">NFL 4th Down Recommendations</p>
          </a>
          <div class="links_two">
            <a class="espn-page-comp-link viz-link" href="https://vimeo.com/901935070" target="_blank">
              <p class="">Video</p>
            </a>
            <a class="espn-page-comp-link viz-link" href="https://twitter.com/bburkeESPN/status/1579642318671708160" target="_blank">
              <p class="">Graphic</p>
            </a>
          </div>
        </div>
        <div class="espn-company-box article-box">
          <a class="espn-page-comp-link article-link" href="https://www.espn.com/nba/insider/story/_/id/34122501/2022-nba-draft-projections-best-prospects-most-overrated-most-underrated" target="_blank">
            <p class="espn_comp_text">2022 NBA Draft: Best prospects, most overrated, underrated</p>
          </a>
        </div>
        <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://web.archive.org/web/20220622164552/https://www.espn.com/nba/draft/projections" target="_blank">
            <p class="espn_comp_text">2022 NBA Draft Projections</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="https://web.archive.org/web/20220415170521/http://www.espnsportsanalytics.com/about.html" target="_blank">
            <p class="espn_comp_text">2022 NFL Draft Predictor & Betting Tool</p>
          </a>
        </div>
        <!-- <div class="espn-company-box model-box">
          <a class="espn-page-comp-link model-link" href="https://www.espn.com/nba/draft/projections" target="_blank">
            <p class="espn_comp_text">2022 NBA Draft Projections</p>
          </a>
        </div>
        <div class="espn-company-box viz-box">
          <a class="espn-page-comp-link viz-link" href="http://espnsportsanalytics.com/nfl-draft/" target="_blank">
            <p class="espn_comp_text">2022 NFL Draft Predictor</p>
          </a>
        </div> -->
      </div>

    </div>
    <Footer />
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
import Featured from '@/components/Featured.vue';

export default {
  name: 'Content',
  title: 'Sports Dada: Content',
  components: {
    Header,
    Footer,
    Featured,
  }
}
</script>

<style>
.espn-content {
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

.page-key {
  width: 250px;
  margin: auto;
  margin-top: 10px;
  margin-bottom: -10px;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-around;
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

.espn-current-content {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  padding-right: 0px;
}

.espn-company-box {
  padding: 25px;
  margin: 25px;
  border-radius: 25px;
}

.key-box {
  width: 65px;
  height: 50px;
  padding: 0px;
  border-radius: 10px;
}

.key_text {
  padding-top: 10px;
}
.links_two {
  margin-top: -50px;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
.model-box {
  border: 1px solid #A32cc4; /*#fd084a #82C3E6*/
}

.viz-box {
  border: 1px solid #1338be; /*#a0fefb #4670B4*/
}

.article-box {
  border: 1px solid #CE663D; /*#494fc1*/
}

.espn_comp_text {
  padding-top: 5px;
  width: 140px;
  height: 140px;
}

.espn-page-comp-link:active,
.espn-page-comp-link {
  text-decoration: none;
  text-align: center;
}

.espn-page-comp-link:active:hover,
.espn-page-comp-link:hover {
  text-decoration: underline;
}

.model-link:active:hover,
.model-link:hover {
  cursor: pointer;
  color: #1338be;
}

.model-link:active,
.model-link {
  color: #CE663D;
}

.viz-link:active:hover,
.viz-link:hover {
  cursor: pointer;
  color: #CE663D;
}

.viz-link:active,
.viz-link {
  color: #A32cc4;
}

.article-link:active:hover,
.article-link:hover {
  color: #A32cc4; 
  cursor: pointer;
}

.article-link:active,
.article-link {
  color: #1338be;
}

.espn-page-comp-logo {
  width: 300px;
  height: 300px;
  margin: -100px;
  padding-top: 25px;
}

/* Mobile Styles */
@media only screen and (max-width: 450px) {
  .content {
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
@media only screen and (min-width: 451px) and (max-width: 850px) {
}


</style>
