<template>
  <div class="game">
    <PowderHead2022 />
    <div class="nonflex">
      <!-- <h1>!Currently Under Construction!</h1> -->
      <h3>Box Scores</h3>
      <br>
      <form class="form-game">
        <label class="label-game" for="dates">Choose a date and scroll to the game you want:</label>
        <select class="select-game" name="dates" id="id_dates" @change="getDate($event)">
          <option value="" selected>Select</option>
          <option v-for="game_date in game_dates" :value="game_date.dates" :key="game_date.dates">
            {{game_date.dates}}
          </option>
        </select>
      </form>
      <!-- <p class="p-game">Currently displaying games from: {{this.date}}</p> -->
      <br>
                                                <!--|| (this.date == "7/30/21")-->
      <div v-if='(this.date == "7/23 Showcase") || (this.date == "8/9 Showcase")' class = "allbsflex">
        <div class="bsflex">
          <div class="tableheader">
            <h5 class="teamtitle">7:00 PM Game Results:</h5>
            <h5 class="teamtitle1" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:00 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}} {{mast.pts}}</h5>
            <h5 class="teamtitle2" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:00 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">- {{mast.pts}} {{mast.team}}</h5>
          </div>
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <!-- <th class="th-game" v-if="(master.date===date)
                  && (master.time =='6:00 PM') && (master.team_id==master.winner)">{{master.team}} -->
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="(mast,index) in master" v-if="(mast.date===date)
                && (mast.time =='7:00 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <!-- <td class="td-game" v-if="mast.num == 'Total:'"> -->
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='7:00 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h5 class="teamtitle">Game 1 Away Team</h5> -->
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time =='7:00 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='7:00 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <br><br>

      </div>
      <div v-else-if='(this.date == "Championship")' class = "allbsflex">
        <div class="bsflex">
          <div class="tableheader">
            <h5 class="teamtitle">7:00 PM Game Results:</h5>
            <h5 class="teamtitle1" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:00 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}} {{mast.pts}}</h5>
            <h5 class="teamtitle2" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:00 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">- {{mast.pts}} {{mast.team}}</h5>
          </div>
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <!-- <th class="th-game" v-if="(master.date===date)
                  && (master.time =='6:00 PM') && (master.team_id==master.winner)">{{master.team}} -->
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="(mast,index) in master" v-if="(mast.date===date)
                && (mast.time =='7:00 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <!-- <td class="td-game" v-if="mast.num == 'Total:'"> -->
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='7:00 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h5 class="teamtitle">Game 1 Away Team</h5> -->
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time =='7:00 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='7:00 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <br><br>

      </div>
      <div v-else-if='(this.date == "Playoffs Day 1")' class = "allbsflex">
        <div class="bsflex">
          <div class="tableheader">
            <h5 class="teamtitle">6:00 PM Game Results:</h5>
            <h5 class="teamtitle1" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='6:00 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}} {{mast.pts}}</h5>
            <h5 class="teamtitle2" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='6:00 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">- {{mast.pts}} {{mast.team}}</h5>
          </div>
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <!-- <th class="th-game" v-if="(master.date===date)
                  && (master.time =='6:00 PM') && (master.team_id==master.winner)">{{master.team}} -->
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="(mast,index) in master" v-if="(mast.date===date)
                && (mast.time =='6:00 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <!-- <td class="td-game" v-if="mast.num == 'Total:'"> -->
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='6:00 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h5 class="teamtitle">Game 1 Away Team</h5> -->
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time =='6:00 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='6:00 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <br><br>
        <div class="bsflex">
          <div class="tableheader">
            <h5 class="teamtitle">7:15 PM Game Results:</h5>
            <h5 class="teamtitle1" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:15 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}} {{mast.pts}}</h5>
            <h5 class="teamtitle2" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:15 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">- {{mast.pts}} {{mast.team}}</h5>
          </div>
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <!-- <th class="th-game" v-if="(master.date===date)
                  && (master.time =='6:00 PM') && (master.team_id==master.winner)">{{master.team}} -->
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="(mast,index) in master" v-if="(mast.date===date)
                && (mast.time =='7:15 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <!-- <td class="td-game" v-if="mast.num == 'Total:'"> -->
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='7:15 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h5 class="teamtitle">Game 1 Away Team</h5> -->
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time =='7:15 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='7:15 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <br><br>
        <div class="bsflex">
          <div class="tableheader">
            <h5 class="teamtitle">8:45 PM Game Results:</h5>
            <h5 class="teamtitle1" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='8:45 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}} {{mast.pts}}</h5>
            <h5 class="teamtitle2" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='8:45 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">- {{mast.pts}} {{mast.team}}</h5>
          </div>
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <!-- <th class="th-game" v-if="(master.date===date)
                  && (master.time =='8:45 PM') && (master.team_id==master.winner)">{{master.team}} -->
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="(mast,index) in master" v-if="(mast.date===date)
                && (mast.time =='8:45 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <!-- <td class="td-game" v-if="mast.num == 'Total:'"> -->
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='8:45 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h5 class="teamtitle">Game 1 Away Team</h5> -->
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time =='8:45 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='8:45 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div v-else class="allbsflex">
        <div class="bsflex">
          <div class="tableheader">
            <h5 class="teamtitle">7:00 PM Game Results:</h5>
            <h5 class="teamtitle1" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:00 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}} {{mast.pts}}</h5>
            <h5 class="teamtitle2" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:00 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">- {{mast.pts}} {{mast.team}}</h5>
          </div>
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game" v-if="(master.date===date)
                  && (master.time =='7:00 PM') && (master.team_id==master.winner)">{{master.team}}</th>
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="(mast,index) in master" v-if="(mast.date===date)
                && (mast.time =='7:00 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <!-- <td class="td-game" v-if="mast.num == 'Total:'"> -->
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='7:00 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h5 class="teamtitle">Game 1 Away Team</h5> -->
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time =='7:00 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='7:00 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <br><br>
        <div class="bsflex">
          <div class="tableheader">
            <h5 class="teamtitle">8:30 PM Game Results:</h5>
            <h5 class="teamtitle1" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='8:30 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}} {{mast.pts}}</h5>
            <h5 class="teamtitle2" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='8:30 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">- {{mast.pts}} {{mast.team}}</h5>
          </div>
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='8:30 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='8:30 PM') && (mast.team_id==mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h5 class="teamtitle">Game 2 Away Team</h5> -->
          <div class="bsstats-holder">
            <div class="bsstats">
              <table class="table-game boxinfo">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">Team</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">First</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">Last</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">#</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='8:30 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game" v-if="mast.num == 'Total:'">{{mast.team}}</td>
                  <td class="td-game" v-else></td>
                  <td class="td-game">{{mast.first}}</td>
                  <td class="td-game">{{mast.last}}</td>
                  <td class="td-game">{{mast.num}}</td>
                </tr>
              </table>
              <table class="table-game boxscore">
                <tr class="labels">
                  <th class="th-game"><h5 class="teamtitle3">PTS</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FG</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">3PT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">FT</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">OREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">DREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TREB</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">AST</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">STL</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">BLK</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">TOV</h5></th>
                  <th class="th-game"><h5 class="teamtitle3">PF</h5></th>
                </tr>
                <tr v-for="mast in master" v-if="(mast.date===date)
                && (mast.time ==='8:30 PM') && (mast.team_id!=mast.winner)">
                  <td class="td-game">{{mast.pts}}</td>
                  <td class="td-game">{{mast.fgm}}-{{mast.fga}}</td>
                  <td class="td-game">{{mast.thpm}}-{{mast.thpa}}</td>
                  <td class="td-game">{{mast.ftm}}-{{mast.fta}}</td>
                  <td class="td-game">{{mast.oreb}}</td>
                  <td class="td-game">{{mast.dreb}}</td>
                  <td class="td-game">{{mast.treb}}</td>
                  <td class="td-game">{{mast.ast}}</td>
                  <td class="td-game">{{mast.stl}}</td>
                  <td class="td-game">{{mast.blk}}</td>
                  <td class="td-game">{{mast.tov}}</td>
                  <td class="td-game">{{mast.pf}}</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <PowderFoot />
  </div>
</template>

<script>
import PowderFoot from '@/components/PowderFoot.vue';
import PowderHead2022 from '@/components/PowderHead2022.vue';
import master from '../../../back-end/master.json';
import game_dates from '../../../back-end/game_dates.json'

export default {
  name: 'Game',
  title: 'BPL: Games',
  components: {
    PowderFoot,
    PowderHead2022,
  },
  // computed: {
  //   using_master() {
  //     return this.master.filter(mast => {
  //       return mast.date.
  //     })
  //   },
  // },
  data() {
    return {
      master: [],
      game_dates: [],
      // using_master: [],
      date: 'All Dates',
      game_date: '',
      error: '',
    }
  },
  created() {
    this.getData();
  },
  methods: {
    async getData() {
      this.master = master;
      this.game_dates = game_dates;
      console.log()
    },
    getDate(event) {
      if (event.target.value != "") {
        this.date = event.target.value;
        this.game_date = 'on ' + event.target.value;
      } else {
        this.date = "All Dates";
        this.game_date = '';
      }
      // this.using_master =
      // console.log(master.filter(obj => this.selectedFilters.every(val => obj.stack.indexOf(val) >= 0)));
    },
  },
}
</script>

<style>
.game {
  /* color: #CE663D; */
  text-align: center;
}
.tableheader {
  display: flex;
  flex-direction: row;
  justify-content: center;
}
.label-game {
  color: #616161;
}
.boxinfo {
  width: 350px;
}
.boxscore {
  width: 700px;
}
h3 {
  padding-top: 20px;
  padding-left: 20px;
  color: #4670B4;
}
.boxinfo th {
  background: white;
}
.boxinfo tr:nth-child(odd) {
  background: white;
}
.boxinfo tr:nth-child(even) {
  background: #F8F9FA;
}
.boxscore th {
  background: white;
}
.boxscore tr:nth-child(odd) {
  background: white;
}
.boxscore tr:nth-child(even) {
  background: #F8F9FA;
}
.table-game {
  /* border: 2px solid black; */
  margin: 20px;
}
.th-game {
  color: #4670B4;
}

.th-game, .td-game {
  /* border: 1px solid gray; */
  text-align: center;
  padding: 5px;
}
.total {

}
.labels {
  border-bottom: 1px solid #616161;
  padding-left: 20px;
}
.teamtitle {
  color: #2C3D4F;
  padding-left: 20px;
}
.teamtitle3 {
  color: #2C3D4F;
  font-size: 12.5px;
}
.teamtitle1 {
  color: #2C3D4F;
  padding-left: 20px;
}
.teamtitle2 {
  color: #2C3D4F;
  padding-left: 7.5px;
}
.allbsflex {
  /* border: 1px solid black; */
}
.bsflex {
  /* border: 1px solid green; */
}
.bsstats-holder {
  display: flex;
  justify-content: center;
}
.bsstats {
  /* border: 1px solid red; */
  display: flex;
  flex-direction: row;
}
.p-game {
  padding-left: 20px;
}
.form-game {
  padding-left: 20px;
}
.select-game {
  margin-left: 10px;
}

@media only screen and (max-width: 991px) {
  .bsstats-holder {
    justify-content: flex-start;
  }
  .boxinfo {
    width: 350px;
  }
  .boxscore {
    width: 700px;
  }
}



</style>
