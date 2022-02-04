<template>
  <div class="the101">
    <PowderHead />
    <div class="nonflex">
      <h1 class="construction">!Currently Under Construction!</h1>
      <br><br>
      <h3>Welcome to the stats page for the Powder League!</h3>
      <h3>Here you can learn all about how we operate and how we put together what we do. Have a look around!</h3>
      <p>Statistical Minimums</p>
      <p>Glossary</p>
      <p>Rulebook</p>
    </div>
    <PowderFoot />
  </div>
</template>

<script>
import PowderFoot from '@/components/PowderFoot.vue';
import PowderHead from '@/components/PowderHead.vue';

export default {
  name: 'The101',
  title: 'BPL: 101',
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
