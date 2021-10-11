<template>
  <div class="picture">
    <svg
      id="meme"
      width="100%"
      height="100%"
      viewBox="0 0 67 100"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:xlink="http://www.w3.org/1999/xlink"
    >
      <image
        xlink:href="../assets/JonathanPaillassonVierge.png"
        x="0"
        y="0"
        height="100"
        width="67"
      />
      <text
        v-for="(message, index) in messages"
        v-bind:key="message"
        v-bind:index="index"
        x="32"
        :y="getYPosition(index)"
        text-anchor="middle"
        transform="translate(4, 53) rotate(1.6)"
        :style="getFont()"
        class="message"
      >
        {{ message }}
      </text>
    </svg>
  </div>
</template>

<script>
export default {
  name: "Picture",
  props: {
    messages: Array,
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
      }px`;
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
