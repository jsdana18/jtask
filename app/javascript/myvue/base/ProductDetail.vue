
<script>
import { mapState, mapGetters, mapActions } from 'vuex'
const ax = require('axios')

export default {
   data: function() {
       return {
           qua: 1,
           ssel: '',
           msel: ''
       }
    },
   props: {
       list: {
           type: Array,
           default: []
       },
       slist: {
           type: Array,
           default: []
       },
       mlist: {
           type: Array,
           default: []
       },
   },
   computed: {
       ...mapState('cart',[
            'citem',
        ]),
        ...mapGetters('cart',[
            'cartCount',
        ]),
       sminventory() {
           var lst = this.list.filter( e=> e.spec==this.ssel && e.measure==this.msel )
           return lst.length==0 ? 0 : lst[0].inventory
       },
       smmlist() {
           var lst = this.list.filter( e=> e.measure==this.msel )
           return lst
       }
   },
   methods: {
       ...mapActions('info',[
            'flashChange',
        ]),
       ...mapActions('cart',[
           'citemReset',
        ]),
        cartAdd: function(id) {
            var _this = this
            var succ = false
            var spath = "/cart/addcart/" + id
            ax.post(spath, { spec: this.ssel, measure: this.msel })
              .then(function (res) {
                _this.flashChange({ckey: 'success', cmsg: res})
                _this.citemReset()
            })
        },
   },
}
</script>