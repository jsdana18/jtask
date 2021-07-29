<template>
    <input type="checkbox" @click="sel(sid)" v-model="selected" :id="sid" class="w-8" v-if="isAdmin">
</template>

<script>
import { mapState, mapMutations } from 'vuex'

export default {
    data: function() {
        return {
            selected: false,
        }
    },
    props: {
        sid: {
            type: Number,
            default: 0 },
    },
    computed: {
        ...mapState('list',[
            'vcids',
            'vcidss'
        ]),
        // ...mapState('info',[
        //     'isAdmin',
        // ]),
        ...mapState('current',[
            'isAdmin',
        ]),
    },
    created: function() {
      this.vcidssAdd(this.sid)
    },
    methods: {
        sel: function(sid) {
            if (!this.selected) {
                this.idsAdd(sid)
            } else {
                this.idsDel(sid)
            }
        },
        ...mapMutations('list',[
                "idsAdd" ,
                "idsDel"
            ]),
        ...mapMutations('list',{
                vcidssAdd: "idssAdd",
            }),
    },
    
    watch: {
        vcids(newValue, oldValue) {
            var result = newValue.indexOf(this.sid)
            this.selected = (result==-1) ? false : true 
        }
    }

}
</script>
