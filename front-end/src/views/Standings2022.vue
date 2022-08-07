<template>
  <div class="standings">
    <PowderHead2022 />
    <div class="nonflex">
      <h3>Season Standings</h3>
      <p>Sort a column by clicking on its header</p>
      <table class="team-table" id="myTable1">
        <thead class="thead-team">
          <tr>
            <th class="th-team" @click="sortFirst('team')"><h5 class="h5-team">Team</h5></th>
            <th class="th-team" @click="sortFirst('w')"><h5 class="h5-team">W</h5></th>
            <th class="th-team" @click="sortFirst('l')"><h5 class="h5-team">L</h5></th>
            <th class="th-team" @click="sortFirst('pct')"><h5 class="h5-team">PCT</h5></th>
            <th class="th-team" @click="sortFirst('gb')"><h5 class="h5-team">GB</h5></th>
            <th class="th-team" @click="sortFirst('home')"><h5 class="h5-team">Home</h5></th>
            <th class="th-team" @click="sortFirst('away')"><h5 class="h5-team">Away</h5></th>
            <th class="th-team" @click="sortFirst('ppg')"><h5 class="h5-team">PPG</h5></th>
            <th class="th-team" @click="sortFirst('oppg')"><h5 class="h5-team">Opp PPG</h5></th>
            <th class="th-team" @click="sortFirst('diff')"><h5 class="h5-team">Diff</h5></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="team in teams">
            <td class="td-team">{{team.team}}</td>
            <td class="td-team">{{team.w}}</td>
            <td class="td-team">{{team.l}}</td>
            <td class="td-team">{{team.pct}}</td>
            <td class="td-team">{{team.gb}}</td>
            <td class="td-team">{{team.home}}</td>
            <td class="td-team">{{team.away}}</td>
            <td class="td-team">{{team.ppg}}</td>
            <td class="td-team">{{team.oppg}}</td>
            <td class="td-team">{{team.diff}}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <PowderFoot />
  </div>
</template>

<script>
import PowderFoot from '@/components/PowderFoot.vue';
import PowderHead2022 from '@/components/PowderHead2022.vue';
import team_stats from '../../../back-end/teams.json';

export default {
  name: 'Standings',
  title: 'BPL: Standings',
  components: {
    PowderFoot,
    PowderHead2022,
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
      this.teams = team_stats;
      this.sortFirst('pct');
    },
    async mySort(col, order) {
      col = col.toLowerCase();
      if((col != 'team') && (col != 'home') && (col != 'away')) {
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
h3 {
  padding-top: 20px;
  color: #4670B4;
}
.team-table {
  text-align: left;
  margin: auto;
  /* border: 1px solid #616161; */
  margin-top: 20px;
}
.td-team {
  padding: 15px;
}
.th-team {
  cursor: pointer;
  padding: 15px;
}
#myTable1 th {
  background: white;
}
#myTable1 tr:nth-child(odd) {
  background: #F8F9FA;
}
#myTable1 tr:nth-child(even) {
  background: white;
}
.h5-team {
  padding: 0;
}
.thead-team {
  border-bottom: 1px solid #616161;
}

</style>
