<template>
  <div class="powder">
    <PowderHead2022 />
    <!-- <Featured /> -->
    <div class="nonflex">
      <h3>2022 Powder League Leaderboards</h3>
      <!-- <button @click="getPts">Refresh</button> -->
      <div class = "leaderboards">
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Points Per Game</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(pt, index) in pts" :key="pt.id">
            <p class = "firsthalf">{{index + 1}}. {{pt.first}} {{pt.last}}</p>
            <p class = "secondhalf">{{pt.pts}}</p>
          </div>
        </div>
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Rebounds Per Game</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(rb, index) in reb" :key="rb.id">
            <p class = "firsthalf">{{index + 1}}. {{rb.first}} {{rb.last}}</p>
            <p class = "secondhalf">{{rb.treb}}</p>
          </div>
        </div>
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Assists Per Game</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(at, index) in ast" :key="at.id">
            <p class = "firsthalf">{{index + 1}}. {{at.first}} {{at.last}}</p>
            <p class = "secondhalf">{{at.ast}}</p>
          </div>
        </div>
        <!-- <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Minutes Played</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(m, index) in mp" :key="m.id">
            <p class = "firsthalf">{{index + 1}}. {{m.first}} {{m.last}}</p>
            <p class = "secondhalf">{{m.mp}} mpg</p>
          </div>
        </div> -->
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Blocks Per Game</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(bk, index) in blk" :key="bk.id">
            <p class = "firsthalf">{{index + 1}}. {{bk.first}} {{bk.last}}</p>
            <p class = "secondhalf">{{bk.blk}}</p>
          </div>
        </div>
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Steals Per Game</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(st, index) in stl" :key="st.id">
            <p class = "firsthalf">{{index + 1}}. {{st.first}} {{st.last}}</p>
            <p class = "secondhalf">{{st.stl}}</p>
          </div>
        </div>
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Field Goal %</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(fgp, index) in fg" :key="fgp.id">
            <p class = "firsthalf">{{index + 1}}. {{fgp.first}} {{fgp.last}}</p>
            <p class = "secondhalf">{{fgp.fg}}%</p>
          </div>
        </div>
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Three Pointers Made</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(tot3p, index) in tot3" :key="tot3p.id">
            <p class = "firsthalf">{{index + 1}}. {{tot3p.first}} {{tot3p.last}}</p>
            <p class = "secondhalf">{{tot3p.tot3}}</p>
          </div>
        </div>
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Three Point %</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(p3p, index) in p3" :key="p3p.id">
            <p class = "firsthalf">{{index + 1}}. {{p3p.first}} {{p3p.last}}</p>
            <p class = "secondhalf">{{p3p.p3}}%</p>
          </div>
        </div>
        <div class="leaderboard">
          <div class="leaderboard_head">
            <h5>Free Throw %</h5>
            <hr>
          </div>
          <div class="leaderboard_body" v-for="(ftp, index) in ft" :key="ftp.id">
            <p class = "firsthalf">{{index + 1}}. {{ftp.first}} {{ftp.last}}</p>
            <p class = "secondhalf">{{ftp.ft}}%</p>
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
import pts_json from '../../../back-end/pts.json';
import ast_json from '../../../back-end/ast.json';
import reb_json from '../../../back-end/reb.json';
import mp_json from '../../../back-end/mp.json';
import blk_json from '../../../back-end/blk.json';
import stl_json from '../../../back-end/stl.json';
import fg_json from '../../../back-end/fg.json';
import p3_json from '../../../back-end/pth.json';
import ft_json from '../../../back-end/ft.json';
import tot3_json from '../../../back-end/thtot.json';
import Featured from '@/components/Featured.vue';

export default {
  name: 'PowderStats',
  title: 'BPL: Leaderboards',
  components: {
    PowderFoot,
    PowderHead2022,
    Featured,
  },
  data() {
    return {
      pts: [],
      ast: [],
      reb: [],
      mp: [],
      stl: [],
      blk: [],
      fg: [],
      p3: [],
      ft: [],
      error: '',
      tot3: [],
    }
  },
  created() {
    this.getStats();
  },
  methods: {
    async getStats() {
      try {
        this.pts = pts_json;
        this.ast = ast_json;
        this.reb = reb_json;
        this.mp = mp_json;
        this.stl = stl_json;
        this.blk = blk_json;
        this.fg = fg_json;
        this.p3 = p3_json;
        this.ft = ft_json;
        this.tot3 = tot3_json;

        for (let i = 0; i < 10; i++) {

          if (this.reb[i].treb != Math.round(this.reb[i].treb)) {
            this.reb[i].treb = this.reb[i].treb.toFixed(1);
          }
          if (this.ast[i].ast != Math.round(this.ast[i].ast)) {
            this.ast[i].ast = this.ast[i].ast.toFixed(1);
          }
          if (this.pts[i].pts != Math.round(this.pts[i].pts)) {
            this.pts[i].pts = this.pts[i].pts.toFixed(1);
          }
          if (this.blk[i].blk != Math.round(this.blk[i].blk)) {
            this.blk[i].blk = this.blk[i].blk.toFixed(1);
          }
          if (this.stl[i].stl != Math.round(this.stl[i].stl)) {
           this.stl[i].stl = this.stl[i].stl.toFixed(1);
          }
          this.tot3[i].tot3 = this.tot3[i].tot3.toFixed(0);

            this.fg[i].fg = (100 * this.fg[i].fg.toFixed(3)).toFixed(1);

          // }
          // if (this.p3[i].p3 != Math.round(this.p3[i].p3)) {
            this.p3[i].p3 = (100 * this.p3[i].p3.toFixed(3)).toFixed(1);
          // }
          // if (this.ft[i].ft != Math.round(this.ft[i].ft)) {
            this.ft[i].ft = (100 * this.ft[i].ft.toFixed(3)).toFixed(1);
          if (this.mp[i].mp != Math.round(this.mp[i].mp)) {
            this.mp[i].mp = this.mp[i].mp.toFixed(1);
          }
          // // console.log(this.p3);
          // this.fg[i].fg = 100 * this.fg[i].fg
          // this.p3[i].p3 = 100 * this.fg[i].p3
          // this.ft[i].ft = 100 * this.fg[i].ft
          // if (this.fg[i].fg != Math.round(this.fg[i].fg)) {

          // }
        }
      } catch (error) {
        this.error = error;
      }
    },
  }
}
</script>

<style>
.nonflex {
  background-color: #F8F9FA;
}
.leaderboards {
  margin-left: 100px;
  margin-right: 100px;
  margin-top: 20px;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  flex-wrap: wrap;
}
.leaderboard {
  width: 300px;
  margin: 10px;
  display: flex;
  flex-direction: column;
  /* border: solid #616161 2px; */
  border-radius: 5px;
}
.leaderboard_head {
  padding-top: 5px;
  /* border: solid #616161 4px; */
  border-radius: 5px;
}
/*color: #CE663D; <- orange*/
/*color: #83C4E7; <- light blue*/
/*color: #4670B4; <- dark blue */
.leaderboard_body {
  padding: 2px;
}
.firsthalf {
  float: left;
  text-align: left;
}
.secondhalf {
  float: right;
  text-align: right;
}
h3 {
  padding-top: 20px;
  color: #4670B4;
}

/* Mobile Styles */
@media only screen and (max-width: 991px) {
  .leaderboards {
    margin-left: 20px;
    margin-right: 20px;
    flex-wrap: wrap;
  }
  .leaderboard {
    margin-right: 10px;
    margin-top: 10px;
  }
}

</style>
