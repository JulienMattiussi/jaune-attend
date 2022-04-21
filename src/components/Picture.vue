<template>
  <div class="picture">
    <svg
      id="meme"
      width="100%"
      height="100%"
      :viewBox="`0 0 ${options.blame ? '143 80' : '67 100'}`"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:xlink="http://www.w3.org/1999/xlink"
    >
      <image
        v-if="!options.marine"
        xlink:href="../assets/JonathanPaillassonVierge.png"
        :x="options.blame ? 38 : 0"
        y="0"
        height="100"
        width="67"
      />
      <image
        v-if="options.marine"
        xlink:href="../assets/MarineFeuille.png"
        :x="options.blame ? 38 : 0"
        y="0"
        height="100"
        width="67"
      />
      <text
        v-for="(message, index) in messages"
        v-bind:key="message"
        v-bind:index="index"
        :x="options.blame ? 69 : 32"
        :y="getYPosition(index)"
        text-anchor="middle"
        :transform="
          options.marine
            ? 'translate(1, 76) rotate(-5)'
            : 'translate(4, 53) rotate(1.6)'
        "
        :style="getFont()"
        class="message"
      >
        {{ message }}
      </text>
      <image
        v-if="options.hat === 'christmas'"
        xlink:href="../assets/christmasHat.png"
        :x="options.blame ? 60 : 22"
        :y="options.blame ? 14.8 : 11.5"
        height="18"
        width="25"
        :transform="
          options.marine
            ? options.blame
              ? 'scale(2.3) translate(-40, -6) rotate(-10)'
              : 'scale(2.3) translate(-19, -10) rotate(-10)'
            : 'rotate(-5)'
        "
      />
      <image
        v-if="options.hat === 'cowboy'"
        xlink:href="../assets/cowboyHat.png"
        :x="options.blame ? 50 : 12.5"
        :y="options.blame ? 14.3 : 11"
        height="26"
        width="38"
        :transform="
          options.marine
            ? options.blame
              ? 'scale(2.3) translate(-33.5, -25) rotate(5)'
              : 'scale(2.3) translate(-13.5, -18) rotate(5)'
            : 'rotate(-5)'
        "
      />
      <image
        v-if="options.glasses"
        xlink:href="../assets/glasses.png"
        :x="options.blame ? 63.5 : 25.5"
        :y="options.blame ? 25 : 21.5"
        height="5"
        width="11.5"
        :transform="
          options.marine
            ? options.blame
              ? 'scale(1.8) translate(-29, -18) rotate(1)'
              : 'scale(1.8) translate(-12, -13.8) rotate(1)'
            : 'rotate(-5)'
        "
      />
      <image
        v-if="options.blame"
        xlink:href="../assets/blameZyhou.jpeg"
        x="104"
        y="0"
        height="80"
        width="39"
      />
      <image
        v-if="options.blame"
        xlink:href="../assets/blameHyriel.jpeg"
        x="0"
        y="0"
        height="80"
        width="39"
      />
    </svg>
  </div>
</template>

<script>
export default {
  name: "Picture",
  props: {
    messages: Array,
    color: String,
    options: Object,
  },
  methods: {
    getYPosition: function(index) {
      if (this.messages.length === 2) {
        return index === 0 ? -5 : 5;
      }
      if (this.messages.length === 3) {
        return index === 0 ? -9 : index === 1 ? -1 : 7;
      }
      if (this.messages.length === 4) {
        return index === 0 ? -11 : index === 1 ? -5 : index === 2 ? 2 : 9;
      }
      return index;
    },
    getFont: function() {
      const rowSize = getMaxRowSize(this.messages);
      const rowNumber = this.messages.length;
      return `font-family: 'Comfortaa', sans-serif; font-size: ${
        rowSize > 15 ? 5 : rowSize > 13 || rowNumber > 3 ? 6 : 8
      }px; fill:${this.color};`;
    },
  },
};

const getMaxRowSize = (messages) => {
  return messages.reduce((size, message) => {
    const currentSize = message.trim().length;
    return size > currentSize ? size : currentSize;
  }, 0);
};
</script>

<style scoped>
@font-face {
  font-family: "Comfortaa";
  font-style: bold;
  font-weight: 400;
  src: url(../assets/Comfortaa-Bold.ttf) format("truetype");
}

.picture {
  width: 50%;
}

@media (max-width: 1250px) {
  .picture {
    width: 100%;
  }
}

.message {
  fill: rgba(2, 2, 2, 0.55);
  white-space: pre-line;
}
</style>
