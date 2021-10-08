<template>
  <div class="text-input">
    <textarea
      v-model="message"
      placeholder="Place the message here"
      rows="3"
    ></textarea>
  </div>
</template>

<script>
export default {
  name: "TextInput",
  props: {
    msg: String,
    handleChange: Function,
  },
  data: function() {
    return { message: this.msg };
  },
  watch: {
    message: function(val) {
      this.handleChange(val);
    },
  },
};
</script>

<style scoped>
h1 {
  margin: 40px 0 0;
}
</style>
