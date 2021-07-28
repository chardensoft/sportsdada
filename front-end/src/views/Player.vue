<template>
  <div class="player">
    <PowderHead />
    <div class="nonflex">
      <!-- <h1 class="construction">!Currently Under Construction!</h1> -->
      <h3>Basketball Powder League Player Rankings</h3>
      <p>Sort a column by clicking on its header</p>
      <table class="player-table" id="myTable2">
        <thead class="thead-player">
          <tr>
            <th class="th-player" @click="sortFirst('first')"><h5 class="h5-player">First</h5></th>
            <th class="th-player" @click="sortFirst('last')"><h5 class="h5-player">Last</h5></th>
            <th class="th-player" @click="sortFirst('team')"><h5 class="h5-player">Team</h5></th>
            <th class="th-player" @click="sortFirst('g')"><h5 class="h5-player">GP</h5></th>
            <th class="th-player" @click="sortFirst('mp')"><h5 class="h5-player">MP</h5></th>
            <th class="th-player" @click="sortFirst('pts')"><h5 class="h5-player">PTS</h5></th>
            <th class="th-player" @click="sortFirst('treb')"><h5 class="h5-player">REB</h5></th>
            <th class="th-player" @click="sortFirst('ast')"><h5 class="h5-player">AST</h5></th>
            <th class="th-player" @click="sortFirst('fgp')"><h5 class="h5-player">FG%</h5></th>
            <th class="th-player" @click="sortFirst('thpp')"><h5 class="h5-player">3P%</h5></th>
            <th class="th-player" @click="sortFirst('oreb')"><h5 class="h5-player">OREB</h5></th>
            <th class="th-player" @click="sortFirst('dreb')"><h5 class="h5-player">DREB</h5></th>
            <th class="th-player" @click="sortFirst('stl')"><h5 class="h5-player">STL</h5></th>
            <th class="th-player" @click="sortFirst('blk')"><h5 class="h5-player">BLK</h5></th>
            <th class="th-player" @click="sortFirst('fga')"><h5 class="h5-player">FGA</h5></th>
            <th class="th-player" @click="sortFirst('fgm')"><h5 class="h5-player">FGM</h5></th>
            <th class="th-player" @click="sortFirst('thpa')"><h5 class="h5-player">3PA</h5></th>
            <th class="th-player" @click="sortFirst('thpm')"><h5 class="h5-player">3PM</h5></th>
            <th class="th-player" @click="sortFirst('tov')"><h5 class="h5-player">TOV</h5></th>
            <th class="th-player" @click="sortFirst('ftp')"><h5 class="h5-player">FT%</h5></th>
            <th class="th-player" @click="sortFirst('fta')"><h5 class="h5-player">FTA</h5></th>
            <th class="th-player" @click="sortFirst('ftm')"><h5 class="h5-player">FTM</h5></th>
            <th class="th-player" @click="sortFirst('pf')"><h5 class="h5-player">PF</h5></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="stat in stats" :key="stat.id">
            <td class="td-player">{{stat.first}}</td>
            <td class="td-player">{{stat.last}}</td>
            <td class="td-player">{{stat.team}}</td>
            <td class="td-player">{{stat.g}}</td>
            <td class="td-player">{{stat.mp}}</td>
            <td class="td-player">{{stat.pts}}</td>
            <td class="td-player">{{stat.treb}}</td>
            <td class="td-player">{{stat.ast}}</td>
            <td class="td-player">{{stat.fgp}}%</td>
            <td class="td-player">{{stat.thpp}}%</td>
            <td class="td-player">{{stat.oreb}}</td>
            <td class="td-player">{{stat.dreb}}</td>
            <td class="td-player">{{stat.stl}}</td>
            <td class="td-player">{{stat.blk}}</td>
            <td class="td-player">{{stat.fga}}</td>
            <td class="td-player">{{stat.fgm}}</td>
            <td class="td-player">{{stat.thpa}}</td>
            <td class="td-player">{{stat.thpm}}</td>
            <td class="td-player">{{stat.tov}}</td>
            <td class="td-player">{{stat.ftp}}%</td>
            <td class="td-player">{{stat.fta}}</td>
            <td class="td-player">{{stat.ftm}}</td>
            <td class="td-player">{{stat.pf}}</td>
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
import player_stats from '../../../back-end/players.json';

export default {
  name: 'Player',
  title: 'BPL: Players',
  components: {
    PowderFoot,
    PowderHead,
  },
  data() {
    return {
      stats: [],
      error: '',
      first: true,
      lastcol: '',
      // last: true,
      // pts: true,
      // gp: true,
      // mp: true,
      // treb: true,
      // ast: true,
      // fgp: true,
      // thpp: true,
      // oreb: true,
      // dreb: true,
      // blk: true,
      // stl: true,
      // tov: true,
      // fga: true,
      // fgm: true,
      // thpa: true,
      // thpm: true,
      // ftp: true,
      // fta: true,
      // ftm: true,
      // pf: true,
    }
  },
  created() {
    this.getPlayers();
  },
  methods: {
    async getPlayers() {
      this.stats = player_stats;
      this.sortFirst("pts");
    },
    async mySort(col, order) {
      col = col.toLowerCase();
      if((col != 'first') && (col != 'last') && (col != 'team')) {
        if (order) {
          this.stats.sort(function (a, b) {
            return b[col] - a[col];
          })
        } else {
          this.stats.sort(function (a, b) {
            return a[col] - b[col];
          })
        }
      } else {
        if (order) {
          this.stats.sort(function (a, b) {
            return ('' + a[col]).localeCompare(b[col]);
          })
        } else {
          this.stats.sort(function (a, b) {
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
    // async sortLast(col) {
    //   this.mySort(col, this.last);
    //   this.last = !this.last;
    // },
    // async sortGP(col) {
    //   this.mySort(col, this.gp);
    //   this.gp = !this.gp;
    // },
    // async sortMP(col) {
    //   this.mySort(col, this.mp);
    //   this.mp = !this.mp;
    // },
    // async sortPts(col) {
    //   this.mySort(col, this.pts);
    //   this.pts = !this.pts;
    // },
    // async sortReb(col) {
    //   this.mySort(col, this.treb);
    //   this.treb = !this.treb;
    // },
    // async sortAst(col) {
    //   this.mySort(col, this.ast);
    //   this.ast = !this.ast;
    // },
    // async sortFGP(col) {
    //   this.mySort(col, this.fgp);
    //   this.fgp = !this.fgp;
    // },
    // async sort3PP(col) {
    //   this.mySort(col, this.thpp);
    //   this.thpp = !this.thpp;
    // },
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
.player-table {
  text-align: left;
  margin: auto;
  /* border: 1px solid #616161; */
  margin-top: 20px;
}
.td-player {
  padding: 7.5px;
}
.th-player {
  cursor: pointer;
  padding: 7.5px;
}
#myTable2 th {
  background: white;
}
#myTable2 tr:nth-child(odd) {
  background: #F8F9FA;
}
#myTable2 tr:nth-child(even) {
  background: white;
}
.h5-player {
  padding: 0;
}
.thead-player {
  border-bottom: 1px solid #616161;
}

</style>













<!-- // var swapped = true;
// while (swapped) {
//   var swapped = false;
//   for (var i = 0; i < (this.stats.length - 1); i++) {
//     var num1 = this.stats[i][col];
//     var num2 = this.stats[i+1][col];
//     if (num2 > num1) {
//       var temp1 = this.stats[i];
//       this.stats[i] = this.stats[i+1];
//       this.stats[i+1] = temp1;
//       swapped = true;
//     }
//   }
// } -->
<!-- buildTable(data) {
//   var table = document.getElementById("myTable2");
//
//   for (var i = 0; i < data.length; i++) {
//     var row = '<tr>
//                 <td>${data[i].first}</td>
//                 <td>${data[i].last}</td>
//                 <td>${data[i].g}</td>
//                 <td>${data[i].mp}</td>
//                 <td>${data[i].pts}</td>
//                 <td>${data[i].treb}</td>
//                 <td>${data[i].ast}</td>
//                 <td>${data[i].fgp}%</td>
//                 <td>${data[i].thpp}%</td>
//                 <td>${data[i].oreb}</td>
//                 <td>${data[i].dreb}</td>
//                 <td>${data[i].stl}</td>
//                 <td>${data[i].blk}</td>
//                 <td>${data[i].fga}</td>
//                 <td>${data[i].fgm}</td>
//                 <td>${data[i].thpa}</td>
//                 <td>${data[i].thpm}</td>
//                 <td>${data[i].tov}</td>
//                 <td>${data[i].ftp}%</td>
//                 <td>${data[i].fta}</td>
//                 <td>${data[i].ftm}</td>
//                 <td>${data[i].pf}</td>
//               </tr>';
//     table.innerHTML += row;
//
//   }
// },
// sortTable(n) {
//   var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
//   table = document.getElementById("myTable2");
//   switching = true;
//   // Set the sorting direction to ascending:
//   dir = "asc";
//   /* Make a loop that will continue until
//   no switching has been done: */
//   while (switching) {
//     // Start by saying: no switching is done:
//     switching = false;
//     rows = table.rows;
//     /* Loop through all table rows (except the
//     first, which contains table headers): */
//     for (i = 1; i < (rows.length - 1); i++) {
//       // Start by saying there should be no switching:
//       shouldSwitch = false;
//       /* Get the two elements you want to compare,
//       one from current row and one from the next: */
//       x = rows[i].getElementsByTagName("TD")[n];
//       y = rows[i + 1].getElementsByTagName("TD")[n];
//       /* Check if the two rows should switch place,
//       based on the direction, asc or desc: */
//       if (dir == "asc") {
//         if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
//           // If so, mark as a switch and break the loop:
//           shouldSwitch = true;
//           break;
//         }
//       } else if (dir == "desc") {
//         if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
//           // If so, mark as a switch and break the loop:
//           shouldSwitch = true;
//           break;
//         }
//       }
//     }
//     if (shouldSwitch) {
//       /* If a switch has been marked, make the switch
//       and mark that a switch has been done: */
//       rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
//       switching = true;
//       // Each time a switch is done, increase this count by 1:
//       switchcount ++;
//     } else {
//       /* If no switching has been done AND the direction is "asc",
//       set the direction to "desc" and run the while loop again. */
//       if (switchcount == 0 && dir == "asc") {
//         dir = "desc";
//         switching = true;
//       }
//     }
//   }
// }, -->
