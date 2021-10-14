<template>
  <div class="container">
    <div class="inputs">
      <textarea
        v-model="message"
        placeholder="Place the message here"
        rows="4"
      ></textarea>
      <color-input class="colors" v-model="color" />
    </div>
    <button v-on:click="setRandom">
      Random
    </button>
    <button v-on:click="save">
      Save
    </button>
  </div>
</template>

<script>
import ColorInput from "vue-color-input";
import { saveSvgAsPng } from "save-svg-as-png";

export default {
  name: "Inputs",
  components: {
    ColorInput,
  },
  props: {
    msg: String,
    clr: String,
    handleChangeText: Function,
    handleChangeColor: Function,
  },
  data: function() {
    return { message: this.msg, color: this.clr };
  },
  watch: {
    message: function(val) {
      this.handleChangeText(val);
    },
    color: function(val) {
      this.handleChangeColor(val);
    },
  },
  methods: {
    save: function() {
      saveSvgAsPng(document.getElementById("meme"), "meme.png", {
        scale: 10,
      });
    },
    setRandom: function() {
      this.handleChangeText(randomTexts[getRandomInt(randomTexts.length - 1)]);
    },
  },
};

const getRandomInt = (max) => {
  return Math.floor(Math.random() * max);
};

const randomTexts = [
  "Voici mon\n paillasson",
  "GIT POULE",
  "Save me !",
  "Rencontre des\n développeurs\n hot de ta région",
  "Marmelab\nrecrute",
  "Kevin, je suis\n ton père",
  "Happy\n birthday",
  "Don't try this\n at home",
  "Bon \n week-end !",
  "Jonathan\n approved",
  "Bonjour,\n je suis\n Jonathan",
  "1 Euro svp,\n pour mangé",
  "❤️",
];
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
}
.inputs {
  display: flex;
  align-items: center;
  gap: 10px;
}
.colors {
  padding: 2px;
  border: solid 1px white;
  border-radius: 10px;
}
button {
  margin: 10px 0;
}
</style>
