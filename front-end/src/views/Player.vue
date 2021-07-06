<template>
  <div class="player">
    <PowderHead />
    <div class="nonflex">
      <h1>!Currently Under Construction!</h1>
      <h3>Basketball Powder League Players</h3>
      <p>First Last mp pts fga fgm</p>
      <tr v-for="stat in stats" :key="stat.id">
        {{stat.first}} {{stat.last}} {{stat.mp}} {{stat.pts}} {{stat.fga}} {{stat.fgm}}
      </tr>
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
    }
  },
}
</script>

<style>
h3 {
  padding-top: 20px;
  color: #4670B4;
}

</style>
