<template>

    <transition mode="out-in">
    <div class="max-w-5xl ml-auto mr-auto">
        <div class="s6 tracking-widest text-gray-700 py-6 text-center " v-if="list.length==0"> 無任何資料 </div>
        
        <div class="w-full text-right s2 my-4 " v-if="list.length!=0"> 
            <button @click="iSeenAllToggle" class="outline-none rounded px-2 align-middle text-right text-gray-700">
                {{iSeenAllText}} <i class="material-icons align-middle" :class="iSeenAll ? 'aup' : 'adown'">expand_more</i>
            </button>
        </div>

        <div v-for="(lst, idx) in list">

            <div class="flex flex-wrap py-2">
 
                <div class="w-full">
                    <div class="flex-wrap flex s3 justify-between items-center pl-8 text-gray-700">
                        <div class="pt-3"><list-check :sid="lst.id"></list-check></div>
                        <div class="flex-grow pl-1 cursor-pointer tracking-wider break-all text-gray-700">
                            <span class="px-2 pb-1 rounded ml-4 mr-4 align-middle text-center bg-gray-600 text-white"> #{{(idx+1)}} </span> 
                            <a :href="surl(lst.id)" class="max-w-4xl align-bottom" v-if="lst.title">{{ lst.title | truncate(24) }}</a> 
                            <a :href="surl(lst.id)" class="max-w-4xl align-bottom" v-if="lst.name">{{lst.name}} || {{ lst.email | truncate(24) }}</a>
                        </div>
                        <div class="pt-1"><show-edit :cname="cname" :id="lst.id" :idx="idx" :opened="lst.opened" :cr="cr(idx)" :key="componentKey"></show-edit></div>
                        <div class="mr-2 rounded-b text-white hover:align-middle" v-if="isAdmin">
                            <button @click="iSeenToggle(idx)" class="outline-none rounded align-middle text-right text-gray-700">
                                    <i class="material-icons align-middle" :class="iSeen(idx) ? 'aup' : 'adown'">expand_more</i> 
                            </button>             
                        </div>
                    </div>
                    <div class="pl-8 text-gray-700" :class="iSeen(idx) ? 'asdown' : 'asup'">
                        <div class="mt-10 pl-8 overflow-hidden"> <slot :name="slotname(lst.id)"></slot> </div> 
                    </div>  
                </div>
 

            </div>
        
        </div>
    </div>
    </transition>

</template>

<script>
import { mapState, mapActions } from 'vuex'
const ax=require('axios')

export default {
    data: function() {
        return {
            cshow: false,
            ishow: false,
            componentKey: 0,
            iSeenList: [],
        }
    },
    props: {
        cname: { type: String,default: '' }, 
        list: { type: Array, default: [] },
    },
    filters: {
        Textb: function(cr) {
            return "text-" + cr + "-650 border-" + cr + "-300"
        },
        // {{ lst.content | truncate(42) }}
        truncate: function(value, limit) {
            if (value.length > limit) {
                value = value.substring(0, (limit - 3)) + '...'
            }
            return value
        },
    },
    mounted() {
        this.modalYesToggle(false)
    },
    computed: {
        ...mapState('list',[
            'vcids',
        ]),
        ...mapState('info',[
            //"isAdmin",
            'modalYes',
            'modalYesMsg',
            'modalSeen',
        ]),
        ...mapState('current',[
            'isAdmin',
            'color',
            'uid',
        ]),
        murl: function() {
            return '/' + this.cname + "/selids"
        },
        iSeenAllText() {
            return this.iSeenAll ? "收起全部" : "展開全部"
        },
        iSeenAll() {
            return this.iSeenList.length==0 ? false : true
        }
    },
    methods: {
        ...mapActions('info',[
            "modalYesToggle",
            "modalYesMsgChange",
            "flashChange" 
        ]),
        ...mapActions('list',[
                "idsDelAll" 
            ]),
        cr: function(index) {
            return this.color[((index+1) % 5)]
        },
        surl: function(sid) {
            return '/' + this.cname + "/" + sid
        },
        ismine: function(lstid) {
            return (this.uid==lstid) ? true : false
        },
        slotname: function(lstid) {
            return 'slot_' + lstid
        },
        forceRerender() {
          this.componentKey += 1
        },
        iSeen: function(idx) {
            // console.log('slotSeen listSeen:' + this.listSeen + '  slotSeenAll:' + this.slotSeenAll)
            if (this.iSeenAll == false) { return false }
            else {
                var index = this.iSeenList.findIndex(e=> e == idx)
                return index != -1 ? true : false
            } 
        },
        iSeenToggle(idx) {
            var index = this.iSeenList.findIndex(e=> e == idx)
            if (index==-1) { this.iSeenList.push(idx) }
            else { this.iSeenList.splice(index, 1)}
            // console.log('slotSeenToggle listSeen:' + this.listSeen + ' idx:' + idx + " index:" + index)
        },
        iSeenAllToggle: function() {
            if (this.iSeenAll==true) {
                this.iSeenList = []   
            } else {
                this.iSeenList = []
                this.list.forEach( (e, index)=>
                    this.iSeenList.push(index)
                )
            }
            
        },
        delf: function() {
            var _this = this
            const idx = this.modalYesMsg
            const id = this.list[this.modalYesMsg].id
            this.modalYesMsgChange('')
            this.modalYesToggle(false) 

            if (idx > -1) {
                if (this.isAdmin == true){
                    var durl = '/' + this.cname + "/" + id
                    ax.delete(durl, {}) }
                if (this.isAdmin == false) {
                    var curl = '/' + this.cname + "/" + id + "/toggled"
                    ax.post(curl, {meth: 'off', ids: id})
                      .then(function (res) {
                        _this.list[idx].opened == true
                        _this.list.splice(idx , 1)
                        _this.cshow = !_this.cshow
                        _this.flashChange({ckey: 'success', cmsg: res})
                      })
                }
            } 
        },
        methAllf: function () {

            var _this = this
            const meth = this.modalYesMsg
            this.modalYesMsgChange('') 
            this.modalYesToggle(false)

            if (this.vcids.length > 0) {
                ax.post(this.murl, {ids: this.vcids, meth: meth})
                  .then(function (res) {
                    
                    _this.vcids.forEach((i) => {
                        const idx = _this.list.findIndex( (p)=> {return p.id== i})
                        if (meth=="on") { _this.list[idx].opened = true }
                        if (meth=="off") { _this.list[idx].opened = false }
                        if (meth=="del") { _this.list.splice(idx, 1) }  
                    })  
                _this.idsDelAll()
                _this.forceRerender()
                _this.flashChange({ckey: 'success', cmsg: res})
                })
            }
        }
    },
    watch: {
        modalYes: {
            handler(newValue, oldValue) {
                if ( newValue == true ) {
                    const msg = this.modalYesMsg 
                    if (msg == "on" || msg == "off" || msg == "del") { 
                        this.methAllf() }
                    if (msg > -1 ) { this.delf() }
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