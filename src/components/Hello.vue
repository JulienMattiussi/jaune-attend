<template>
  <div class="hello">
    <h1>--==[[</h1>
    <h1>{{ msg }}</h1>
    <h1>]]==--</h1>
  </div>
</template>

<script>
export default {
  name: "Hello",
  props: {
    msg: String,
  },
};
</script>

<style scoped>
.hello {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
h1 {
  margin: 40px 10px;
  min-width: 50px;
}

@media (max-width: 1250px) {
  h1 {
    font-size: 20px;
  }
}
</style>
