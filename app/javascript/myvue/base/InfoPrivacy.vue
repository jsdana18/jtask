<template>
    <transition mode="out-in">
        <div class= "border block my-2 mx-2 text-xl px-2 py-2 mb-2 rounded relative" :class="clsdiv" v-if="pSeen">
            <div class="text-center"> {{msg}} </div>
            <div class="flex justify-center mt-4 mb-2 align-middle">
                <div class="mr-8 pt-1"><a href="/ro/privacy" class="text-red-650 px-2 align-middle"> 本站隱私權條款</a></div>
                <div class=""><button type="button" class="rounded py-1 px-2 border border-red-700 text-white bg-red-650" @click="privacy">{{isPrivacy}}我知道了</button></div>
            </div>
        </div>   
    </transition>
</template>

<script>
import { mapState, mapActions } from 'vuex'
const ax = require('axios')

export default {
    data: function() {
        return {
            msg : '為提供更好的優質內容，本網站使用cookies分析技術及相關技術來改善使用者體驗，若繼續閱覽本網站內容， 即表示您同意我們使用 cookies，特此提出聲明。關於相關資訊，請閱讀我們的隱私權和使用條款。',
            pSeen: true,
        }
    },
    computed: {
        color() {
            return 'red'
        },
        clsdiv() {
            return "bg-" + this.color + "-100 border-" + this.color + "-150 text-gray-750"
        },
        purl() {
            return "/ro/isprivacy"
        }
    },
    methods: {
        privacy: function() {
            var _this = this
            ax.put(this.purl)
              .then(function (res) {
                  _this.pSeen = false
            })
        }
    }
}
</script>

<style>

.v-enter { opacity: 0; }
.v-enter-active  { transition: opacity .2s }
.v-enter-to { opacity: 1; }
.v-leave { opacity: 1 ; }
.v-leave-active { transition: opacity .2s }
.v-leave-to { opacity: 0; }
    
</style>
