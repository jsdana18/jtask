<script>
import { mapState, mapActions, mapGetters } from 'vuex'
const ax = require('axios')

export default {
  data: function() {
    return {
      bSeen: false,
      cSeen: false,
    }
  },
  props: {
      list: {
          type: Array,
          default: []
      },
  },
  // mounted() {
  //       this.citemReset()
  //   },
  // computed: {
  //   ...mapGetters('cart',[
  //       'cartCount',
  //   ]),
  // },
  methods: {
    // ...mapActions('cart',[
    //     'citemReset',
    // ]),
    top: function(value) {
        return "text-" + value + "-700 hover:text-" +　value + "-600"
    },
    cSeenf: function(value) {
      this.cSeen = !this.cSeen
      alert(this.cSeen + " cShow: " + this.cshow)
    },
  } 
}
</script>

<style>

.dr_menu, .dr_links a{ 
  @apply relative inline-block;}

.dr_cont {
  @apply absolute z-10 hidden; }
  
.dr_menu:hover .dr_cont, .dr_cont a{
  @apply block; }

.loading-mask {
  @apply fixed w-full h-full z-10 top-0 left-0 bg-gray-500;
}

.cart-mask {
 animation: cartMask 1.2s ease-in-out;
}

@keyframes cartMask {
    0% { opacity: 1 ;}
    50% { opacity: .5 ;}
    100% { opacity: .9 ;}
}


.cartslide-enter-active {
  animation: cartSlide .2s ease-in;
}
.cartslide-leave-active {
  animation: cartSlide .2s reverse;
}

@keyframes cartSlide {
    from { @apply w-0; }
    to { @apply w-128;}
}

  
</style>