<template>
  <div class="main-container">
    <Hello msg="The Greatest Meme Generator" />
    <div class="picture-container">
      <Inputs
        :msg="message"
        :clr="color"
        :options="options"
        :handleChangeText="handleChangeText"
        :handleChangeColor="handleChangeColor"
        :handleChangeOption="handleChangeOption"
      />
      <Picture :messages="messages" :color="color" :options="options" />
    </div>
  </div>
</template>

<script>
import Hello from "./components/Hello.vue";
import Picture from "./components/Picture.vue";
import Inputs from "./components/Inputs.vue";

export default {
  name: "App",
  components: {
    Hello,
    Picture,
    Inputs,
  },
  data: function() {
    return {
      message: "I AM \nSANTA     \nCLAUS      BARBIE",
      messages: ["I AM", "SANTA     ", "CLAUS      BARBIE"],
      color: "rgba(120, 2, 2, 0.55)",
      options: {
        glasses: false,
        hat: "christmas",
        blame: false,
        marine: false,
      },
    };
  },
  methods: {
    handleChangeText: function(message) {
      this.message = message;
      this.messages = message.split("\n").map((text) => text.trim());
    },
    handleChangeColor: function(color) {
      this.color = color;
    },
    handleChangeOption: function(option, value) {
      this.options[option] = value;
    },
  },
};
</script>

<style>
.main-container {
  width: 60%;
  margin: auto;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.picture-container {
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
  align-items: center;
}

@media (max-width: 1250px) {
  .main-container {
    width: 100%;
  }
  .picture-container {
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
  }
}

body {
  background-color: #222;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #e8e8e8;
}
</style>
