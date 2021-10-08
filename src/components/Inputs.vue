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
        fonts: [
          {
            url:
              "https://fonts.gstatic.com/s/Helvetica/v20/KFOmCnqEu92Fr1Mu72xKKTU1Kvnz.woff2",
            format: "application/font-woff2",
            text:
              "@font-face {font-family: 'Helvetica';  font-style: normal;  font-weight: 400; src: local('Helvetica'), local('Helvetica'), url(https://fonts.gstatic.com/s/Helvetica/v20/KFOmCnqEu92Fr1Mu72xKKTU1Kvnz.woff2) format('woff2');  unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;}",
          },
        ],
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
  "Rencontre des\n développeurs hot\n de ta région",
  "Marmelab\nrecrute",
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
