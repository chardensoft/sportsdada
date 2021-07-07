<template>
  <div class="player">
    <PowderHead />
    <div class="nonflex">
      <h1 class="construction">!Currently Under Construction!</h1>
      <h3>Basketball Powder League Players</h3>
      <table class="player-table sortable" id="myTable2">
        <thead>
          <tr>
            <th @onclick="sortTable(0)">First</th>
            <th>Last</th>
            <th>gp</th>
            <th>mp</th>
            <th>pts</th>
            <th>treb</th>
            <th>ast</th>
            <th>fg%</th>
            <th>3p%</th>
            <th>oreb</th>
            <th>dreb</th>
            <th>stl</th>
            <th>blk</th>
            <th>fga</th>
            <th>fgm</th>
            <th>3pa</th>
            <th>3pm</th>
            <th>tov</th>
            <th>ft%</th>
            <th>fta</th>
            <th>ftm</th>
            <th>pf</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="stat in stats" :key="stat.id">
            <td>{{stat.first}}</td>
            <td>{{stat.last}}</td>
            <td>{{stat.g}}</td>
            <td>{{stat.mp}}</td>
            <td>{{stat.pts}}</td>
            <td>{{stat.treb}}</td>
            <td>{{stat.ast}}</td>
            <td>{{stat.fgp}}%</td>
            <td>{{stat.thpp}}%</td>
            <td>{{stat.oreb}}</td>
            <td>{{stat.dreb}}</td>
            <td>{{stat.stl}}</td>
            <td>{{stat.blk}}</td>
            <td>{{stat.fga}}</td>
            <td>{{stat.fgm}}</td>
            <td>{{stat.thpa}}</td>
            <td>{{stat.thpm}}</td>
            <td>{{stat.tov}}</td>
            <td>{{stat.ftp}}%</td>
            <td>{{stat.fta}}</td>
            <td>{{stat.ftm}}</td>
            <td>{{stat.pf}}</td>
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
  components: {
    PowderFoot,
    PowderHead,
  },
  data() {
    return {
      stats: [],
      error: '',
    }
  },
  created() {
    this.getPlayers();
  },
  methods: {
    async getPlayers() {
      this.stats = player_stats;
    },
    // buildTable(data) {
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
  margin: auto;
}
th {
  cursor: pointer;
}

</style>
