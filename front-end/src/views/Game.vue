<template>
  <div class="game">
    <PowderHead />
    <div class="nonflex">
      <!-- <h1>!Currently Under Construction!</h1> -->
      <h3>Basketball Powder League Game Box Scores</h3>
      <form>
        <label for="dates">Choose the date of the game you're looking for:</label>
        <select name="dates" id="id_dates" @change="getDate($event)">
          <option value="" selected>Select</option>
          <option v-for="game_date in game_dates" :value="game_date.dates" :key="game_date.dates">
            {{game_date.dates}}
          </option>
        </select>
      </form>
      <!-- <p>Currently displaying games from: {{this.date}}</p> -->
      <br>
      <div class = "allbsflex">
        <div class="bsflex">
          <div class="tableheader">
            <h4 class="teamtitle">7:00 Game</h4>
            <h4 class="teamtitle" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:00 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}}: {{mast.pts}}</h4>
            <h4 class="teamtitle" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='7:00 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">{{mast.team}}: {{mast.pts}}</h4>
          </div>
          <div class="bsstats">
            <table class="boxinfo">
              <tr class="labels">
                <!-- <th v-if="(master.date===date)
                && (master.time =='7:00 PM') && (master.team_id==master.winner)">{{master.team}} -->
                <th>Team</th>
                <th>First</th>
                <th>Last</th>
                <th>#</th>
              </tr>
              <tr v-for="(mast,index) in master" v-if="(mast.date===date)
              && (mast.time =='7:00 PM') && (mast.team_id==mast.winner)">
                <td v-if="mast.num == 'Total:'">{{mast.team}}</td>
                <td v-else></td>
                <!-- <td v-if="mast.num == 'Total:'"> -->
                <td>{{mast.first}}</td>
                <td>{{mast.last}}</td>
                <td>{{mast.num}}</td>
              </tr>
            </table>
            <table class="boxscore">
              <tr class="labels">
                <th>MP</th>
                <th>PTS</th>
                <th>FG</th>
                <th>3PT</th>
                <th>FT</th>
                <th>OREB</th>
                <th>DREB</th>
                <th>TREB</th>
                <th>AST</th>
                <th>STL</th>
                <th>BLK</th>
                <th>TOV</th>
                <th>PF</th>
              </tr>
              <tr v-for="mast in master" v-if="(mast.date===date)
              && (mast.time ==='7:00 PM') && (mast.team_id==mast.winner)">
                <td>{{mast.mp}}</td>
                <td>{{mast.pts}}</td>
                <td>{{mast.fgm}}-{{mast.fga}}</td>
                <td>{{mast.thpm}}-{{mast.thpa}}</td>
                <td>{{mast.ftm}}-{{mast.fta}}</td>
                <td>{{mast.oreb}}</td>
                <td>{{mast.dreb}}</td>
                <td>{{mast.treb}}</td>
                <td>{{mast.ast}}</td>
                <td>{{mast.stl}}</td>
                <td>{{mast.blk}}</td>
                <td>{{mast.tov}}</td>
                <td>{{mast.pf}}</td>
              </tr>
            </table>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h4 class="teamtitle">Game 1 Away Team</h4> -->
          <div class="bsstats">
            <table class="boxinfo">
              <tr class="labels">
                <th>Team</th>
                <th>First</th>
                <th>Last</th>
                <th>#</th>
              </tr>
              <tr v-for="mast in master" v-if="(mast.date===date)
              && (mast.time =='7:00 PM') && (mast.team_id!=mast.winner)">
                <td v-if="mast.num == 'Total:'">{{mast.team}}</td>
                <td v-else></td>
                <td>{{mast.first}}</td>
                <td>{{mast.last}}</td>
                <td>{{mast.num}}</td>
              </tr>
            </table>
            <table class="boxscore">
              <tr class="labels">
                <th>MP</th>
                <th>PTS</th>
                <th>FG</th>
                <th>3PT</th>
                <th>FT</th>
                <th>OREB</th>
                <th>DREB</th>
                <th>TREB</th>
                <th>AST</th>
                <th>STL</th>
                <th>BLK</th>
                <th>TOV</th>
                <th>PF</th>
              </tr>
              <tr v-for="mast in master" v-if="(mast.date===date)
              && (mast.time ==='7:00 PM') && (mast.team_id!=mast.winner)">
                <td>{{mast.mp}}</td>
                <td>{{mast.pts}}</td>
                <td>{{mast.fgm}}-{{mast.fga}}</td>
                <td>{{mast.thpm}}-{{mast.thpa}}</td>
                <td>{{mast.ftm}}-{{mast.fta}}</td>
                <td>{{mast.oreb}}</td>
                <td>{{mast.dreb}}</td>
                <td>{{mast.treb}}</td>
                <td>{{mast.ast}}</td>
                <td>{{mast.stl}}</td>
                <td>{{mast.blk}}</td>
                <td>{{mast.tov}}</td>
                <td>{{mast.pf}}</td>
              </tr>
            </table>
          </div>
        </div>
        <br>
        <div class="bsflex">
          <div class="tableheader">
            <h4 class="teamtitle">8:30 Game</h4>
            <h4 class="teamtitle" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='8:30 PM') && (mast.team_id==mast.winner)
            && (mast.num == 'Total:')">{{mast.team}}: {{mast.pts}}</h4>
            <h4 class="teamtitle" v-for="(mast,index) in master" v-if="(mast.date===date)
            && (mast.time =='8:30 PM') && (mast.team_id!=mast.winner)
            && (mast.num == 'Total:')">{{mast.team}}: {{mast.pts}}</h4>
          </div>
          <div class="bsstats">
            <table class="boxinfo">
              <tr class="labels">
                <th>Team</th>
                <th>First</th>
                <th>Last</th>
                <th>#</th>
              </tr>
              <tr v-for="mast in master" v-if="(mast.date===date)
              && (mast.time ==='8:30 PM') && (mast.team_id==mast.winner)">
                <td v-if="mast.num == 'Total:'">{{mast.team}}</td>
                <td v-else></td>
                <td>{{mast.first}}</td>
                <td>{{mast.last}}</td>
                <td>{{mast.num}}</td>
              </tr>
            </table>
            <table class="boxscore">
              <tr class="labels">
                <th>MP</th>
                <th>PTS</th>
                <th>FG</th>
                <th>3PT</th>
                <th>FT</th>
                <th>OREB</th>
                <th>DREB</th>
                <th>TREB</th>
                <th>AST</th>
                <th>STL</th>
                <th>BLK</th>
                <th>TOV</th>
                <th>PF</th>
              </tr>
              <tr v-for="mast in master" v-if="(mast.date===date)
              && (mast.time ==='8:30 PM') && (mast.team_id==mast.winner)">
                <td>{{mast.mp}}</td>
                <td>{{mast.pts}}</td>
                <td>{{mast.fgm}}-{{mast.fga}}</td>
                <td>{{mast.thpm}}-{{mast.thpa}}</td>
                <td>{{mast.ftm}}-{{mast.fta}}</td>
                <td>{{mast.oreb}}</td>
                <td>{{mast.dreb}}</td>
                <td>{{mast.treb}}</td>
                <td>{{mast.ast}}</td>
                <td>{{mast.stl}}</td>
                <td>{{mast.blk}}</td>
                <td>{{mast.tov}}</td>
                <td>{{mast.pf}}</td>
              </tr>
            </table>
          </div>
        </div>
        <div class="bsflex">
          <!-- <h4 class="teamtitle">Game 2 Away Team</h4> -->
          <div class="bsstats">
            <table class="boxinfo">
              <tr class="labels">
                <th>Team</th>
                <th>First</th>
                <th>Last</th>
                <th>#</th>
              </tr>
              <tr v-for="mast in master" v-if="(mast.date===date)
              && (mast.time ==='8:30 PM') && (mast.team_id!=mast.winner)">
                <td v-if="mast.num == 'Total:'">{{mast.team}}</td>
                <td v-else></td>
                <td>{{mast.first}}</td>
                <td>{{mast.last}}</td>
                <td>{{mast.num}}</td>
              </tr>
            </table>
            <table class="boxscore">
              <tr class="labels">
                <th>MP</th>
                <th>PTS</th>
                <th>FG</th>
                <th>3PT</th>
                <th>FT</th>
                <th>OREB</th>
                <th>DREB</th>
                <th>TREB</th>
                <th>AST</th>
                <th>STL</th>
                <th>BLK</th>
                <th>TOV</th>
                <th>PF</th>
              </tr>
              <tr v-for="mast in master" v-if="(mast.date===date)
              && (mast.time ==='8:30 PM') && (mast.team_id!=mast.winner)">
                <td>{{mast.mp}}</td>
                <td>{{mast.pts}}</td>
                <td>{{mast.fgm}}-{{mast.fga}}</td>
                <td>{{mast.thpm}}-{{mast.thpa}}</td>
                <td>{{mast.ftm}}-{{mast.fta}}</td>
                <td>{{mast.oreb}}</td>
                <td>{{mast.dreb}}</td>
                <td>{{mast.treb}}</td>
                <td>{{mast.ast}}</td>
                <td>{{mast.stl}}</td>
                <td>{{mast.blk}}</td>
                <td>{{mast.tov}}</td>
                <td>{{mast.pf}}</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <PowderFoot />
  </div>
</template>

<script>
import PowderFoot from '@/components/PowderFoot.vue';
import PowderHead from '@/components/PowderHead.vue';
import master from '../../../back-end/master.json';
import game_dates from '../../../back-end/game_dates.json'

export default {
  name: 'Game',
  components: {
    PowderFoot,
    PowderHead,
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
      console.log(master.length);
    },
    getDate(event) {
      if (event.target.value != "") {
        this.date = event.target.value;
      } else {
        this.date = "All Dates";
      }
      // this.using_master =
      // console.log(master.filter(obj => this.selectedFilters.every(val => obj.stack.indexOf(val) >= 0)));
    },
  },
}
</script>

<style>
.game {
  color: #CE663D;
  text-align: left;
}
.tableheader {
  display: flex;
  flex-direction: row;
}
h3 {
  padding-top: 20px;
  padding-left: 20px;
  color: #4670B4;
}
table {
  border: 2px solid black;
  margin: 20px;
}
th {
  color: #4670B4;
}
th, td {
  /* border: 1px solid gray; */
  text-align: left;
  padding: 5px;
}
.total {

}
.labels {
  border-bottom: 1px solid #616161;
  padding-left: 20px;
}
.teamtitle {
  color: #4670B4;
  padding-left: 20px;
}
.allbsflex {
  display: flex;
  flex-direction: column;
}
.bsflex {

}
.bsstats {
  display: flex;
  flex-direction: row;
}
p {
  padding-left: 20px;
}
form {
  padding-left: 20px;
}
select {
  margin-left: 10px;
}


</style>
