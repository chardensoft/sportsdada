team.<template>
  <div class="team">
    <PowderHead />
    <div class="nonflex">
      <h3 class="h3-tmstat">Basketball Powder League Team Stats</h3>
      <p>Sort a column by clicking on its header</p>
      <table class="tmstat-table" id="myTable3">
        <thead class="thead-tmstat">
          <tr>
            <th class="th-tmstat" @click="sortFirst('team')"><h5 class="h5-tmstat">Team</h5></th>
            <th class="th-tmstat" @click="sortFirst('ppg')"><h5 class="h5-tmstat">PPG</h5></th>
            <th class="th-tmstat" @click="sortFirst('treb')"><h5 class="h5-tmstat">REB</h5></th>
            <th class="th-tmstat" @click="sortFirst('ast')"><h5 class="h5-tmstat">AST</h5></th>
            <th class="th-tmstat" @click="sortFirst('fgp')"><h5 class="h5-tmstat">FG%</h5></th>
            <th class="th-tmstat" @click="sortFirst('thpp')"><h5 class="h5-tmstat">3P%</h5></th>
            <th class="th-tmstat" @click="sortFirst('oreb')"><h5 class="h5-tmstat">OREB</h5></th>
            <th class="th-tmstat" @click="sortFirst('dreb')"><h5 class="h5-tmstat">DREB</h5></th>
            <th class="th-tmstat" @click="sortFirst('stl')"><h5 class="h5-tmstat">STL</h5></th>
            <th class="th-tmstat" @click="sortFirst('blk')"><h5 class="h5-tmstat">BLK</h5></th>
            <th class="th-tmstat" @click="sortFirst('fga')"><h5 class="h5-tmstat">FGA</h5></th>
            <th class="th-tmstat" @click="sortFirst('fgm')"><h5 class="h5-tmstat">FGM</h5></th>
            <th class="th-tmstat" @click="sortFirst('thpa')"><h5 class="h5-tmstat">3PA</h5></th>
            <th class="th-tmstat" @click="sortFirst('thpm')"><h5 class="h5-tmstat">3PM</h5></th>
            <th class="th-tmstat" @click="sortFirst('tov')"><h5 class="h5-tmstat">TOV</h5></th>
            <th class="th-tmstat" @click="sortFirst('ftp')"><h5 class="h5-tmstat">FT%</h5></th>
            <th class="th-tmstat" @click="sortFirst('fta')"><h5 class="h5-tmstat">FTA</h5></th>
            <th class="th-tmstat" @click="sortFirst('ftm')"><h5 class="h5-tmstat">FTM</h5></th>
            <th class="th-tmstat" @click="sortFirst('pf')"><h5 class="h5-tmstat">PF</h5></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="team in teams">
            <td class="td-tmstat">{{team.team}}</td>
            <td class="td-tmstat">{{team.ppg}}</td>
            <td class="td-tmstat">{{team.treb}}</td>
            <td class="td-tmstat">{{team.ast}}</td>
            <td class="td-tmstat">{{team.fgp}}%</td>
            <td class="td-tmstat">{{team.thpp}}%</td>
            <td class="td-tmstat">{{team.oreb}}</td>
            <td class="td-tmstat">{{team.dreb}}</td>
            <td class="td-tmstat">{{team.stl}}</td>
            <td class="td-tmstat">{{team.blk}}</td>
            <td class="td-tmstat">{{team.fga}}</td>
            <td class="td-tmstat">{{team.fgm}}</td>
            <td class="td-tmstat">{{team.thpa}}</td>
            <td class="td-tmstat">{{team.thpm}}</td>
            <td class="td-tmstat">{{team.tov}}</td>
            <td class="td-tmstat">{{team.ftp}}%</td>
            <td class="td-tmstat">{{team.fta}}</td>
            <td class="td-tmstat">{{team.ftm}}</td>
            <td class="td-tmstat">{{team.pf}}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <PowderFoot />
  </div>
</template>

<script>
import PowderFoot from '@/components/PowderFoot.vue';
import PowderHead from '@/components/PowderHead.vue';
import tmstat from '../../../back-end/team_stats.json';

export default {
  name: 'Standings',
  title: 'BPL: Teams',
  components: {
    PowderFoot,
    PowderHead,
  },
  data() {
    return {
      teams: [],
      error: '',
      first: true,
      lastcol: '',
    }
  },
  created() {
    this.getTeams();
  },
  methods: {
    async getTeams() {
      this.teams = tmstat;
      this.sortFirst('ppg');
    },
    async mySort(col, order) {
      col = col.toLowerCase();
      if((col != 'team')) {
        if (order) {
          this.teams.sort(function (a, b) {
            return b[col] - a[col];
          })
        } else {
          this.teams.sort(function (a, b) {
            return a[col] - b[col];
          })
        }
      } else {
        if (order) {
          this.teams.sort(function (a, b) {
            return ('' + a[col]).localeCompare(b[col]);
          })
        } else {
          this.teams.sort(function (a, b) {
            return ('' + b[col]).localeCompare(a[col]);
          })
        }
      }
    },
    async sortFirst(col) {
      if (this.lastcol == col) {
        this.mySort(col, this.first);
        this.first = !this.first;
        this.lastcol = col;
      } else {
        this.mySort(col, true);
        this.first = false;
        this.lastcol = col;
      }
    },
  },
}
</script>

<style>
.construction {
  color: #CE663D;
}
.h3-tmstat {
  padding-top: 20px;
  color: #4670B4;
}
.tmstat-table {
  text-align: left;
  margin: auto;
  /* border: 1px solid #616161; */
  margin-top: 20px;
}
.td-tmstat {
  padding: 5px;
}
.th-tmstat {
  cursor: pointer;
  padding: 5px;
}
#myTable3 th {
  background: white;
}
#myTable3 tr:nth-child(odd) {
  background: #F8F9FA;
}
#myTable3 tr:nth-child(even) {
  background: white;
}
.h5-tmstat {
  padding: 0;
}
.thead-tmstat {
  border-bottom: 1px solid #616161;
}

</style>
