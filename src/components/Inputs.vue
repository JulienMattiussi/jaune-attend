<template>
  <div class="container">
    <div class="inputs">
      <textarea
        v-model="message"
        placeholder="Place the message here"
        rows="4"
      ></textarea>
      <color-input class="colorButton" v-model="color" />
      <button class="moreButton" v-on:click="showMore">
        {{ displayMore ? "-" : "+" }}
      </button>
    </div>
    <div :style="`display: ${displayMore ? 'flex' : 'none'}`" class="more">
      <div>
        <input type="checkbox" name="glasses" v-model="glasses" />
        <label for="glasses">With glasses</label>
      </div>
      <div>
        <fieldset class="hatfieldset">
          <legend>With hat</legend>
          <div class="wrapper">
            <div class="grid-row">
              <input
                type="radio"
                name="hat"
                id="nohat"
                value="nohat"
                v-model="hat"
              />
              <label for="nohat">No hat</label>
            </div>
            <div class="grid-row">
              <input
                type="radio"
                name="hat"
                id="christmas"
                value="christmas"
                v-model="hat"
              />
              <label for="christmas">Special christmas</label>
            </div>
            <div class="grid-row">
              <input
                type="radio"
                name="hat"
                id="cowboy"
                value="cowboy"
                v-model="hat"
              />
              <label for="cowboy">Cowboy hat</label>
            </div>
          </div>
        </fieldset>
      </div>
      <div>
        <input type="checkbox" name="blame" v-model="blame" />
        <label for="blame">With blame</label>
      </div>
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
    options: Object,
    handleChangeText: Function,
    handleChangeColor: Function,
    handleChangeOption: Function,
  },
  data: function() {
    return {
      message: this.msg,
      color: this.clr,
      displayMore: false,
      glasses: this.options.glasses,
      hat: this.options.hat,
      blame: this.options.blame,
    };
  },
  watch: {
    message: function(val) {
      this.handleChangeText(val);
    },
    color: function(val) {
      this.handleChangeColor(val);
    },
    glasses: function(val) {
      this.handleChangeOption("glasses", val);
    },
    hat: function(val) {
      this.handleChangeOption("hat", val);
    },
    blame: function(val) {
      this.handleChangeOption("blame", val);
    },
  },
  methods: {
    showMore: function() {
      this.displayMore = !this.displayMore;
    },
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
.colorButton {
  padding: 2px;
  border: solid 1px white;
  border-radius: 10px;
}
.moreButton {
  border: solid 1px white;
  border-radius: 10px;
  width: 46px;
  height: 46px;
  font-size: x-large;
  font-weight: 800;
  color: green;
}
.more {
  margin: 10px 0;
  flex-direction: column;
  justify-content: flex-start;
}
.more > div {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  gap: 10px;
}
button {
  margin: 10px 0;
}
.hatfieldset {
  margin-top: 10px;
  margin-bottom: 10px;
}
.hatfieldset .wrapper {
  display: flex;
  flex-direction: column;
}
.hatfieldset .grid-row {
  display: flex;
  margin-top: 5px;
  margin-bottom: 5px;
}
.hatfieldset > legend {
  margin-left: -30px;
  width: 80px;
}
</style>
