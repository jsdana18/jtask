<template>

    <transition mode="out-in">
    <div class="max-w-6xl ml-auto mr-auto">

        <div class="tracking-widest text-purpled-700 py-6 s6 text-center " v-if="list.length==0"> 無任何資料 </div>

        <div class="w-full">
            <div v-for="(lst, idx) in list">
                <div class="flex flex-wrap">
                    <div class="w-full s3">
                        <div class="flex-wrap flex w-full justify-between s2 sm:pl-2 lg:pl-16 rounded">
                            <div class="flex-grow pl-6 cursor-pointer align-bottom tracking-wider break-all text-gray-700 "> 
                                <a :href="surl(lst.id, lst.title)" class="max-w-4xl align-bottom hover:text-white hover:bg-yellowd-550" v-if="lst.title"><span class="text-yellowd-550 rounded py-1 px-2 text-center">{{idx+1}}</span> {{ lst.title | truncate(24) }}</a>
                                <a :href="surl(lst.id, lst.name)" class="max-w-4xl align-bottom hover:text-white hover:bg-yellowd-550" v-if="lst.name"><span class="text-yellowd-550 rounded py-1 px-2 text-center">{{idx+1}}</span> {{lst.name}} || {{ lst.email | truncate(24) }}</a>
                            </div>
                            
                            <div class="flex-shrink ml-6 pr-4 s1 py-2 text-gray-700"><i class="material-icons align-middle pb-1 pr-1">access_time</i>{{lst.created_at | mdate}} </div>
                            <div class="flex-shrink pr-4"> <show-my-edit :cname="cname" :id="lst.id" :idx="idx" v-if="lst.user_id==myid"></show-my-edit></div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

    </div>
    </transition>

</template>

<script>
import moment from 'moment'
import { mapState, mapActions } from 'vuex'
const ax=require('axios')

export default {
    data: function() {
        return {
            listSeen: [],
        }
    },
    props: {
        cname: { type: String,default: '' }, 
        list: { type: Array, default: [] },
        myid: { type: String, default: -1 },
        pclass: { type: String, default: 'h-full'}
    },
    filters: {
        mdate: function(value) {
            return moment(String(value)).format("YYYY-MM-DD")
        },
        // {{ lst.content | truncate(42) }}
        truncate: function(value, limit) {
            if (value.length > limit) {
                value = value.substring(0, (limit - 3)) + '...'
            }
            return value
        },
    },
    computed: {
        ...mapState('info',[
            'modalYes',
            'modalYesMsg',
        ]),
        murl: function() {
            return '/' + this.cname + "/selids"
        },
        slotSeenAllText() {
            return this.slotSeenAll==true ? "收起全部" : "展開全部"
        },
        slotSeenAll() {
            return this.listSeen.length==0 ? false : true
        }
        
    },
    methods: {
        surl: function(sid, stitle) {
            // return ( this.cname=="art" ? '/' + this.cname + "/" + stitle : '/' + this.cname + "/" + sid)
            return '/' + this.cname + "/" + sid
        },
        curl: function(sid) {
            return '/' + this.cname + "/" + sid + "/toggled"
        },
        slotname: function(lstid) {
            return 'slot_' + lstid
        },
        forceRerender() {
          this.componentKey += 1
        },
        openedf: function(idx) {
            var _this = this
            var id = this.list[idx].id
            ax.post(this.curl(id), {})
              .then(function (res) {
                _this.list.splice(idx, 1)
                _this.$forceUpdate()  
              }) 
            
        },
        slotSeen: function(idx) {
            // console.log('slotSeen listSeen:' + this.listSeen + '  slotSeenAll:' + this.slotSeenAll)
            if (this.slotSeenAll == false) { return false }
            else {
                var index = this.listSeen.findIndex(e=> e == idx)
                return index != -1 ? true : false
            } 
        },
        slotSeenToggle(idx) {
            var index = this.listSeen.findIndex(e=> e == idx)
            if (index==-1) { this.listSeen.push(idx) }
            else { this.listSeen.splice(index, 1)}
            // console.log('slotSeenToggle listSeen:' + this.listSeen + ' idx:' + idx + " index:" + index)
        },
        slotSeenAllToggle: function() {
            if (this.slotSeenAll==true) {
                this.listSeen = []   
            } else {
                this.listSeen = []
                this.list.forEach( (e, index)=>
                    this.listSeen.push(index)
                )
            }
            
        }
    },
    watch: {
        modalYes: {
            handler(newValue, oldValue) {
                if ( newValue == true ) {
                    const msg = this.modalYesMsg
                    if (msg > -1 ) { this.openedf(msg)}
                }
            } 
        }
    }

}
</script>

<style>
.adown {
  transform: rotate(0deg);
}

.aup {
  transform: rotate(180deg);
}

.asdown {
    @apply w-full h-full overflow-hidden;
    transition: height 0.6s ease-in-out;
}
.asup {
    @apply w-full h-0 overflow-hidden;
    text-overflow: ellipsis;
    transition: height 0.6s ease-in-out;
} 



</style>