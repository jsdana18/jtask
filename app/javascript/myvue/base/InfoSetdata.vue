<template>
    <div>
        
    </div>
</template>

<script>
import { mapState, mapActions, mapGetters } from 'vuex'

export default {
    props: {
        // curl: String,
        cuid: {
            type: Number,
            default: -1
        },
        cadmin: {
            type: Boolean,
            default: false,
        },
        // productlist: {
        //     type: Array,
        //     default: [],
        // },
        // cartlist: {
        //     type: Array,
        //     default: [],
        // },
        cuiaids: {
            type: Array,
            default: []
        },
        // cuwaids: {
        //     type: Array,
        //     default: []
        // },
        // cistatelist: {
        //     type: Array,
        //     default: []
        // }
    },
    mounted() {
        this.isAdminToggle(this.cadmin)
        // this.isUpgradeToggle(this.isupgrade) 
        this.uidChange(this.cuid)
        this.uiaidsChange(this.cuiaids)
        // this.uwaidsChange(this.cuwaids)
        // this.istateListChange(this.cistatelist)
        // this.istateListIstateGet()
        // if (!this.product.length) {
        //     this.productSet(this.productlist)
        //  }
        //  if (!this.citem.length && this.cartlist!=null) {
        //     this.cartSet(this.cartlist)
        //  }
    },
    computed: {
        ...mapState('cart',[
            'citem',
            // 'product'
        ]),
        ...mapState('current',[
            'isAdmin',
            // 'isUpgrade',
            'uid',
            'uiaids',
            // 'uwaids',
            // 'istateList',
        ]),
        ...mapGetters('cart',[
            'cartCount',
        ]),
    },
    methods: {
        ...mapActions('info',[
            'isAdminChange',
        ]),
        // ...mapActions('cart',[
        //     'productSet',
        //     'cartSet'
        // ]),
        ...mapActions('current',[
            'isAdminToggle',
            // 'isUpgradeToggle',
            'uidChange',
            'uiaidsChange',
            // 'uwaidsChange',
            // 'istateListChange',
            // 'istateListIstateGet',
        ]),
    },
}
</script>