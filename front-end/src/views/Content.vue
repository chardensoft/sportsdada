<template>
  <div>
    <Header />
    <div class="content">
      <div class="content-header">
        <h1 class="content-title">All Content</h1>
        <h5 class="content-subtitle">This page contains all the articles and projects I have worked on</h5>
      </div>
      <div class="articles">
        <h2 class="articles-title content-page-title">Articles</h2>
        <div class="list citystreetstrat">
          <h4 class="citystreetstrat-title content-page-subtitle">City Street Strat</h4>
          <li class="links-list">
            <a href="https://www.citystreetstrat.com/strategies/screw-the-bulls-and-the-bears-lets-turn-to-the-horses-derby-day-09052020-probabilities"
              target="_blank">Predicting the Kentucky Derby</a>
          </li>
        </div>
        <div class="list blog">
          <h4 class="blog-title content-page-subtitle">Sports Dada Blog</h4>
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
      </div>
      <div class="projects">
        <h3 class="projects-title content-page-title">Projects</h3>
        <div class="list pottersports">
          <h4 class="pottersports-title content-page-subtitle">Potter Sports Group</h4>
          <li class="links-list">
            <a href="https://christopher-harden.shinyapps.io/shiny1/"
              target="_blank">Shiny App: Predicting NCAA players going to the NBA</a>
          </li>
        </div>
        <div class="list Dr. Sabin">
          <h4 class="sabin-title content-page-subtitle">Dr. Paul Sabin, ESPN</h4>
          <li class="links-list">
            <a href="https://nbasalary.sportsdadas.net/"
              target="_blank">Research Project: Predicting NBA Success Using Salary Data</a>
          </li>
        </div>
      </div>
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default {
  name: 'Content',
  components: {
    Header,
    Footer,
  }
}
</script>

<style>
.content {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-align: left;
  padding-left: 30px;
}

.content-title {
  padding-top: 30px;
  color: #4670B4;
  font-weight: bold;
}

.content-subtitle {
  color: black;
}

.articles,
.projects {
  padding-top: 30px;
  color: #4670B4;
}

a,
a:active {
  color: #68cbf8;
  text-decoration: underline;
}

a:hover,
a:active:hover {
  color: #CE663D;
}

.list {
  padding-left: 50px;
  padding-top: 10px;
}

.citystreetstrat-title {
  color: #4670B4;
}

.links-list {
  padding-left: 50px;
  padding-top: 10px;
  list-style: none;
}

/* Mobile Styles */
@media only screen and (max-width: 450px) {
  .content {
    width: 100%;
    text-align: center;
    padding-left: 5px;
    padding-right: 5px;
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
