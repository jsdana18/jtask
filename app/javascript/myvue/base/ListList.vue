<template>

    <transition mode="out-in">
    <section class="block max-w-5xl mr-auto ml-auto mb-16">

    <div class="font-semibold s3 mb-2 align-middle text-center">{{title}}</div>

    <div class="grid grid-cols-1 lg:grid-cols-2 col-gap-4 row-gap-1">
        
            <div class="max-w-3xl inline-flex overflow-hidden s2 border-dotted align-middle" v-for="(lst, idx) in list"> 
                <div class="flex-grow">
                    <i class="material-icons align-middle pr-1" :class="cr(idx) | text">donut_large</i> 
                    <a class="text-gray-650 align-middle" :class="cr(idx) | htext" :href="surl(lst.id, lst.title)"> {{lst.title | truncate(15) }} </a>
                </div>
                <div class="flex-shrink text-right  text-sm rounded pt-3 pr-3 overflow-hidden leading-relaxed text-gray-650">
                     {{lst.created_at | mdate}}
                </div>
            </div>
        
    </div>

        <div class="w-full s2 text-right pr-2 mt-8 text-purpled-600 hover:text-purpled-700"><a :href="murl">更多{{title}} >> </a> </div>
    </section>
    </transition>
</template>

<script>
import moment from 'moment'
import { mapState, mapActions } from 'vuex'
const ax=require('axios')

export default {
    props: {
        cname: { type: String, default: '' }, 
        title: { type: String, default: ''},
        list: { type: Array, default: [] },
    },
    filters: {
        mdate: function(value) {
            return moment(String(value)).format("YYYY-MM-DD")
        },
        text: function(cr) {
            return "text-" + cr + "-650"
        },
        htext: function(cr) {
            return "hover:bg-" + cr + "-650 hover:text-white"
        },
        truncate: function(value, limit) { // {{ lst.content | truncate(42) }}
            if (value.length > limit) {
                value = value.substring(0, (limit - 3)) + '...'
            }
            return value
        },
    },
    computed: {
        ...mapState('current',[
            'color',
        ]),
        murl: function() {
            return '/' + this.cname 
        },
    },
    methods: {
        cr: function(index) {
            return this.color[((index+1) % 5)]
        },
        surl: function(sid, stitle) {
            // return (this.cname=="art" ? '/' + this.cname + "/" + stitle : '/' + this.cname + "/" + sid)
            return  '/' + this.cname + "/" + sid
        },
    },
    
}
</script>

<style>

</style>