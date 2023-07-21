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
          <a class="comp_link" href="https://www.linkedin.com/in/chris-harden/" target="_blank">
            <img class="comp_logo" src="../assets/linkedin.png" />
            <p class="comp_text">Sharing job tips &amp; such on LinkedIn</p>
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
        <a class="comp_link" href="https://www.twitter.com/SportsDada/" target="_blank">
          <img class="comp_logo" src="../assets/twitter.png" />
          <p class="comp_text">Tweeting data viz &amp; interesting stats</p>
        </a>
      </div>
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
