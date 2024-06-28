<template>
  <div>
    <Header />
    <!-- <Featured /> -->

    <div class="content">
      <div class="content-header">
        <h1 class="content-title">Currently I'm:</h1>
        <!-- <h5 class="content-subtitle">All my content that I'm currently creating</h5> -->
      </div>
      <div class="current-content">

        <!-- <div class="company">
          <a class="comp_link" href="https://www.tiktok.com/@chrisandkemi" target="_blank">
            <img class="comp_logo" src="../assets/tiktok.png" />
            <p class="comp_text">TikTok: Sharing videos about my journey to ESPN and my family</p>
          </a>
        </div> -->
        <!-- <div class="company">
          <a class="comp_link" href="https://discord.gg/FMHTDgrjxc" target="_blank">
            <img class="comp_logo" src="../assets/discord.png" />
            <p class="comp_text">Discord: Join the community if you're an aspiring sports analyst or just enjoy sports!</p>
          </a>
        </div> -->
        <div class="company">
          <router-link class ="comp_link" to="/ESPN">
            <img class="comp_logo" src="../assets/ESPN_ANALYTICS_1.png" />
            <p class="comp_text">Working on projects and articles for the ESPN Analytics Team</p>
          </router-link>
        </div>
        <!-- <div class="company">
          <a class="comp_link" href="https://me.volley.app/chris-harden">
            <img class="comp_logo" src="../assets/volley.png" />
            <p class="comp_text">Helping aspiring sports analysts get noticed, set up a chat with me!</p>
          </a>
        </div> -->
        <div class="company">
          <a class="comp_link" href="https://www.twitter.com/SportsDada/" target="_blank">
            <img class="comp_logo" src="../assets/twitter.png" />
            <p class="comp_text">Tweeting data viz &amp; interesting stats</p>
          </a>
        </div>
        <div class="company">
          <a class="comp_link" href="https://letterboxd.com/charden/" target="_blank">
            <img class="comp_logo" src="../assets/letterboxd.png" />
            <p class="comp_text">Watching movies :)</p>
          </a>
        </div>
        <!-- <div class="company">
          <a class="comp_link" href="https://sportsdada.substack.com/" target="_blank">
            <img class="comp_logo" src="../assets/headshot.png" />
            <p class="comp_text">Writing about what I love + tips along the way on Substack</p>
          </a>
        </div> -->
        
        <div class="company">
          <a class="comp_link" href="https://www.linkedin.com/in/chris-harden/" target="_blank">
            <img class="comp_logo" src="../assets/linkedin.png" />
            <p class="comp_text">Hanging on LinkedIn</p>
          </a>
        </div>
      </div>
      <br>
      <!-- <h5 class="content-subtitle">I also continue to help run the data processes for The Wood Report and the Powder League</h5> -->

      <div class="content-header">
        <h1 class="content-title">Graveyard:</h1>
        <!-- <h5 class="content-subtitle">Links to everything I worked on prior to starting at ESPN</h5> -->
      </div>
      <div class="projects">
        <h3 class="projects-title content-page-title">Projects</h3>
        <div class="list pottersports">
          <h4 class="pottersports-title content-page-subtitle">Professional Stuff</h4>
            <li class="links-list">
              <a href="https://www.instagram.com/p/CKl_nLhnKkj/"
                target="_blank"><strong>The Wood Report:</strong> Ranking and Tracking Men's and Women's XC </a>
                <span><a href="https://x.com/Wood_Report/status/1699452640357396598"> (unfortunately ended)</a></span>
            </li>
            <li class="links-list">
              <a href="http://sportsdada.net/PowderStats"
                target="_blank"><strong>The Powder League 2022:</strong> Ranking and Tracking Pro-Am Basketball League</a>
            </li>
            <li class="links-list">
              <a href="http://sportsdada.net/PowderStats2021"
                target="_blank"><strong>The Powder League 2021:</strong> Ranking and Tracking Pro-Am Basketball League</a>
            </li>
        </div>
        <div class="list DrSabin">
          <h4 class="sabin-title content-page-subtitle">College Stuff</h4>
          <li class="links-list">
            <a href="https://nbasalary.sportsdada.net/"
              target="_blank"><strong>Research Project:</strong> Predicting NBA Success Using Salary Data</a>
          </li>
          <li class="links-list">
            <a href="https://christopher-harden.shinyapps.io/NbaSalary/"
              target="_blank"><strong>Shiny App:</strong> Exploring NBA Salary Data</a>
          </li>
          <li class="links-list">
            <a href="https://github.com/chardensoft/nbasalary/blob/main/Presentation.pdf"
              target="_blank"><strong>Presentation:</strong> Using NBA Salary Data to Improve Success</a>
          </li>
          <li class="links-list">
            <a href="https://christopher-harden.shinyapps.io/shiny1/"
              target="_blank"><strong>Shiny App:</strong> Predicting NCAA Players in the NBA</a>
          </li>
          <li class="links-list">
            <a href="https://github.com/chardensoft/potter/blob/main/PotterProject.pdf"
              target="_blank"><strong>Presentation:</strong> Predicting NCAA Players in the NBA</a>
          </li>
        </div>
        <!-- <div class="list bpl">
          <h4 class="bpl-title content-page-subtitle">The Powder League</h4>
          <li class="links-list">
            <a href="https://www.sportsdada.net/PowderStats"
              target="_blank">Project: Management of All Live Stats (see menu option "BPL")</a>
          </li>
        </div>
        <div class="list wr">
          <h4 class="wr-title content-page-subtitle">The Wood Report</h4>
          <li class="links-list">
            <a href="https://www.thewoodreportxc.com/"
              target="_blank">Project: Management of All Stats (see menu option "WR")</a>
          </li>
        </div> -->
        <div class="list social">
          <h4 class="sabin-title content-page-subtitle">Social Media</h4>
          <li class="links-list">
            <a href="https://twitter.com/SportsDada/status/1424847608288210947?s=20"
              target="_blank">My fav ridiculous tweet</a>
          </li>
          <li class="links-list">
            <a href="https://sportsdada.substack.com/"
              target="_blank">I tried Substack regularly once</a>
          </li>
          <li class="links-list">
            <a href="https://www.twitter.com/SportsDada/"
              target="_blank">I still dabble with Twitter sometimes</a>
          </li>
          <li class="links-list">
            <a href="https://www.instagram.com/sports.dada/"
              target="_blank">This Instagram was fire during Powder League</a>
          </li>
          <!-- <li class="links-list">
            <a href="https://discord.gg/FMHTDgrjxc"
              target="_blank">Sometimes I'm on this Discord</a>
          </li> -->
        </div>
      </div>
      <div class="articles">
        <h2 class="articles-title content-page-title">Articles</h2>
        <div class="list citystreetstrat">
          <h4 class="citystreetstrat-title content-page-subtitle">City Street Strat</h4>
          <li class="links-list">
            <a href="https://www.citystreetstrat.com/articles/screw-the-bulls-and-the-bears-lets-turn-to-the-horses-derby-day-09052020-probabilities"
              target="_blank">Predicting the Kentucky Derby</a>
          </li>
        </div>
        <div class="list blog">
          <h4 class="blog-title content-page-subtitle">Old SportsDada Blog</h4>
          <li class="links-list">
            <a href="https://sportsdadas.blogspot.com/2020/10/world-series-guide-everything-you-need.html"
              target="_blank">World Series Guide: Everything you need to know for 2020's Fall Classic</a>
          </li>
          <li class="links-list">
            <a href="https://sportsdadas.blogspot.com/2020/10/the-arena-effect.html"
              target="_blank">The Arena Effect</a>
          </li>
          <li class="links-list">
            <a href="https://sportsdadas.blogspot.com/2020/10/ppg-vs-all-star-votes.html"
              target="_blank">PPG vs. All Star Votes</a>
          </li>
          <li class="links-list">
            <a href="https://sportsdadas.blogspot.com/2020/09/nuggets-vs-clippers-game-7.html"
              target="_blank">Nuggets vs. Clippers - Game 7</a>
          </li>
          <li class="links-list">
            <a href="https://sportsdadas.blogspot.com/2020/09/blog-post_12.html"
              target="_blank">Betting Rockets v. Lakers Game 5</a>
          </li>
          <li class="links-list">
            <a href="https://sportsdadas.blogspot.com/2019/11/nfl-daily-fantasy-keys.html"
              target="_blank">NFL: Daily Fantasy Keys</a>
          </li>
          <li class="links-list">
            <a href="https://sportsdadas.blogspot.com/2019/07/less-than-five-percent-i-love-nba-my.html"
              target="_blank">NBA: Less Than Five Percent</a>
          </li>
        </div>
        <div class="list DrSabin">
          <h4 class="sabin-title content-page-subtitle">College Sports Analytics Project</h4>
          <li class="links-list">
            <a href="https://github.com/chardensoft/nbasalary/blob/main/Final%20Paper.pdf"
              target="_blank">The Effect of Salary Allocation on Team Success in the NBA</a>
          </li>
        </div>
        <div class="list bpl">
          <h4 class="bpl-title content-page-subtitle">The Powder League</h4>
          <li class="links-list">
            <a href="https://sportsdadas.blogspot.com/2021/07/sports-dadas-powder-league-mvp-ladder.html"
              target="_blank">MVP Ladder - July 28th, 2021</a>
          </li>
          <!-- <li class="links-list">
            <a href="https://www.sportsdada.net/Articles"
              target="_blank">Powder League Power Rankings</a>
          </li> -->
        </div>
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
.content {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-align: left;
  padding-left: 10px;
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

.current-content {
  display: flex;
  justify-content: left;
  flex-wrap: wrap;
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

/* Mobile Styles */
@media only screen and (max-width: 450px) {
  .content {
    width: 100%;
    text-align: center;
    padding-left: 5px;
    padding-right: 5px;
  }
  .current-content {
    justify-content: space-around;
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
