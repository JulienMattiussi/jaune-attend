<template>
  <div class="inputs">
    <textarea
      v-model="message"
      placeholder="Place the message here"
      rows="3"
    ></textarea>
    <button v-on:click="setRandom">
      Random
    </button>
    <button v-on:click="save">
      Save
    </button>
  </div>
</template>

<script>
import { saveSvgAsPng } from "save-svg-as-png";

export default {
  name: "Inputs",
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
  methods: {
    save: function() {
      saveSvgAsPng(document.getElementById("meme"), "meme.png", {
        scale: 10,
        /* fonts: [
          {
            url:
              "https://fonts.googleapis.com/css2?family=Nunito&display=swap",
            format: "application/font-woff2",
            text: "@font-face {font-family: 'Nunito';  font-style: normal;  font-weight: 400; src: local('Nunito'), local('Nunito'), url(https://fonts.googleapis.com/css2?family=Nunito&display=swap) format('woff2');}",
          },
        ], */
      });
    },
    setRandom: function() {
      this.handleChange(randomTexts[getRandomInt(randomTexts.length - 1)]);
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
];
</script>

<style scoped>
.inputs {
  display: flex;
  flex-direction: column;
}
button {
  margin: 10px 0;
}
</style>
