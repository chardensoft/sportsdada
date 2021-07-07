<template>
  <div class="game">
    <PowderHead />
    <div class="nonflex">
      <h1>!Currently Under Construction!</h1>
      <h3>Basketball Powder League Game Box Scores</h3>
      <p>Box Score 1</p>
      <p>Box Score 2</p>
    </div>
    <PowderFoot />
  </div>
</template>

<script>
import PowderFoot from '@/components/PowderFoot.vue';
import PowderHead from '@/components/PowderHead.vue';

export default {
  name: 'Game',
  components: {
    PowderFoot,
    PowderHead,
  }
}
</script>

<style>
h3 {
  padding-top: 20px;
  color: #4670B4;
}

</style>
