<template>
    <transition mode="out-in">
    <div class="align-middle" v-if="uid!=-1">
        <span class="pr-3 align-middle pt-1" v-if="bookseen"> {{pop}}共修 </span>
        <span class="align-middle px-1 pb-2 pt-1 rounded cursor-pointer hover:text-white" :class="cr | htext" @click.prevent="book" @mouseenter="bookseen=true" @mouseleave="bookseen=false">
            <i class="material-icons s3 align-middle">{{mico}}</i>
        </span>
    </div>
    <div class="align-middle" v-else>
        <span class="pr-3 align-middle py-1 pl-3 rounded border" :class="cr | border"> 登入後才可參加共修 </span>
    </div>
    </transition>
</template>

<script>
import { mapState, mapActions } from 'vuex'
const ax=require('axios')

export default {
    data: function() {
        return {
            selmeth: false,
            bookseen: false,
            cname: 'item',
        }
    },
    props: {
        id: {type: Number,
             default: 0, },
        cr: {
            type: String,
            default: 'gray',
        }
    },
    filters: {
        htext(cr) {
            return " hover:bg-" + cr + "-450"
        },
        border(cr) {
            return "border-" + cr + "-300"
        }
    },
    mounted() {
        this.selmeth = this.uiaids.indexOf(this.id)!=-1
    },
    computed: {
          ...mapState('current',[
            'color',
            'uid',
            'uiaids',
        ]),
        purl() { return '/item/' + this.id + '/book' },
        meth() { return this.selmeth ? 'off' : 'on' },
        mico() { return this.selmeth ? "remove" : "add" },
        pop() { return this.selmeth ? '取消' : '新增' },
    },
    methods: {
        book: function() {
            var _this = this
            ax.post(this.purl, {id: this.id})
              .then(function (res) {
                _this.selmeth = !_this.selmeth
            })
        }
    },
}
</script>
