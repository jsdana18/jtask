<script>
// import { mapState, mapGetters, mapActions } from "vuex";
// const ax = require("axios");

export default {
  data: function () {
    return {
      qua: 1,
      tprice: 50,
    };
  },
  props: {
    price: {
      type: Number,
      default: 50,
    },
  },
  methods: {
    quaCount: function (qtype) {
      if (qtype == "inc") {
        this.qua++;
      }
      if (qtype == "dec") {
        this.qua--;
      }
      this.tprice = this.price * this.qua;
    },
    // quaax: _.debounce(function (value) {
    //     // this.counterQuantityChange(value)
    //     console.log("debounce -- bpost:" + this.bpost)
    //     if (this.bpost=='true'){
    //         var _this = this
    //         var spath = "/cart/cntcart/" + this.id
    //         ax.post(spath, { id: this.id, quantity: this.qua, spec: this.spec, measure: this.measure })
    //         .then(function(res) {
    //             // _this.citemQuantityChange({id: _this.id, quantity: value, spec: _this.spec, measure: _this.measure })
    //             _this.citemReset()
    //         })
    //     }
    // }, 400)
  },
  // watch: {
  //     qua(newVal) {
  //         if (newVal=='') { this.qua = 1}
  //         if (this.spec!="" && this.measure !="") { this.quaax(newVal) }
  //         // console.log("watch qua spec:" + this.spec + " measure:" + this.measure + " bpost:" + this.bpost)
  //     }
  // },
};
</script>