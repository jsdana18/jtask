<template> 

<section class="flex-wrap flex justify-center mb-16 mr-auto ml-auto max-w-6xl">
    
    <div class="s6 text-center max-w-5xl mt-20 mr-auto ml-auto text-gray-650" v-if="list.length==0"> 沒有任何資料 </div>
    <div class="inline-flex shadow rounded-lg border-2 max-w-md mx-4 my-4"  :class="cr(idx) | crcard" v-for="(lst,idx) in list" v-else>
        <div class="flex-shrink w-10 rounded-l-lg text-white text-4xl py-2 px-2" :class="cr(idx) | crleft"> </div>

        <div class="flex-grow flip_box text-redd-700 mx-3 pt-3">
            <div class="w-64 s5 h-20 overflow-hidden text-gray-650 leading-snug tracking-wide pb-1" :class="cr(idx) | crtitle"> 
                <a :href="surl(lst.id)"> {{lst.title}} </a>
            </div>

            <div class="flex-none w-full text-right s2 pb-1 pr-2 mb-3" :class="cr(idx) | text">
                <item-book :id="lst.id" :cr="cr(idx)"></item-book>
            </div>

            <div class="w-full s2 text-right pb-1 pr-2">
                <div class="font-normal" :class="cr(idx) | crhtext"><i class="material-icons align-middle pb-1">people</i> <span class="">人數：</span>
                <a :href="surl(lst.id)" class="text-white px-2 pb-1 pt-1 rounded border hover:bg-white" :class="cr(idx) | crcount"> {{lst.user_count.toLocaleString('en')}}</a></div>
            </div>

            <div class="w-full s2 text-right py-1 mb-3 mt-2 pr-2">
                <div class="font-normal" :class="cr(idx) | crhtext"><i class="material-icons align-middle pb-1">domain</i> <span class="">統計：</span>
                <a :href="surl(lst.id)" class="text-white px-2 py-1 rounded border hover:bg-white"  :class="cr(idx) | crcount"> {{lst.all_count | formatN}}</a></div>
            </div>

            <div class="flip_inner w-full h-32 mb-6">
                <div class="flip_front w-64 rounded pt-3 pb-4 px-4 overflow-hidden leading-relaxed text-white" :class="cr(idx) | crcontent1">
                    {{lst.content | truncate(48)}}
                </div>

                <div class="flip_back w-64 rounded leading-relaxed pt-3 pb-4 px-4 overflow-hidden text-gray-650 border" :class="cr(idx) | crcontent2">
                    {{lst.content | truncate(48)}}
                </div>
            </div>

        </div>
    </div>
</section>

</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
    data: function() {
        return {
            cname: 'item',
        }
    },
    props: {
        list: {
            type: Array,
            default: []
        },
    },
    filters: {
        truncate: function(value, limit) {
            if (value.length > limit) {
                value = value.substring(0, (limit - 3)) + '...'
            }
            return value
        },
        text: function(cr) {
            return "border-" + cr + "-100 text-" + cr + "-450" },
        crcount: function(cr) {
            return 'text-white bg-' + cr + '-450 border-' + cr + '-450 hover:text-' + cr + '-450 hover:bg-white hover:border-' + cr + '-450'
        },
        crcontent1: function(cr) {
            return  "bg-" + cr + "-450 text-white border-" + cr + "-450"
        },
        crcontent2: function(cr) {
            return  "text-gray-650 border-" + cr + "-450"
        },
        crhtext: function(cr) {
            return "text-" + cr + "-450 hover:text-" + cr + "-450"
        },
        crcard: function(cr) {
            return "border border-" + cr + "-450 hover:text-" + cr + "-450"
        },
        crtitle: function(cr) {
            return "text-gray-450 hover:text-" + cr + "-450"
        },
        crleft: function(cr) {
            return "bg-" + cr + "-450"
        },
        formatN: function(cnt) {
            var fNo = cnt.toLocaleString('en')
            var ranges = [
                { divider: 1e3 , suffix: '千' },
                { divider: 1e6 , suffix: '百萬' },
                { divider: 1e9 , suffix: '十億' },
                { divider: 1e12 , suffix: '兆' },
                { divider: 1e15 , suffix: '千兆' },
                { divider: 1e18 , suffix: '百京' }
            ]
            ranges.forEach((e) => {
                if (cnt > e.divider) {
                    fNo = (cnt / e.divider).toFixed(1).toString() + " " + e.suffix
            }})
            return fNo
        }
    },
    computed: {
        ...mapState('current',[
            'isAdmin',
            'color',
            'uid',
        ]),
        purl() { return this.cname + this.id + '/book' },
        meth() { return this.selmeth ? 'off' : 'on' },
        mico() { return this.selmeth ? "remove" : "add" },
        pop() { return this.selmeth ? '取消' : '新增' },
    },
    methods: {
        cr: function(index) {
            return this.color[((index+1) % 5)]
        },
        surl: function(id) { 
            return '/' + this.cname + "/" + id 
        },
        
    }
    
}
</script>