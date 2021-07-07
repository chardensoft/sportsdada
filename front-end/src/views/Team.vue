<template>
  <div class="team">
    <PowderHead />
    <div class="nonflex">
      <h1 class="construction">!Currently Under Construction!</h1>
      <h3>Basketball Powder League Teams</h3>
      <p>Team Win Loss Win% Home Away</p>
    </div>
    <PowderFoot />
  </div>
</template>

<script>
import PowderFoot from '@/components/PowderFoot.vue';
import PowderHead from '@/components/PowderHead.vue';

export default {
  name: 'Team',
  components: {
    PowderFoot,
    PowderHead,
  }
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

</style>
