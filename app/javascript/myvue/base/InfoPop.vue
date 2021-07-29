<template>
    <transition mode="out-in">
        <div class="relative align-middle pr-1">
            <div class="cursor-pointer text-gray-700 align-middle" @mouseenter="popseen=true" @mouseleave="popseen=false">{{msg}}</div>
            <div class="absolute right-0 w-64 rounded z-10 bg-white border py-4 px-4 text-gray-700 border-gray-700" v-if="popseen"> {{msghover}} </div>
        </div>
    </transition>
</template>

<script>

export default {
    data: function() {
        return {
            popseen: false,
        }
    },
    props: {
        msg: {
            type: String,
            default: "hover 前訊息"
        },
        msghover: {
            type: String, 
            default: "hover後訊息"
        }
    },
    computed: {
        nowmsg() {
            return (this.popseen==true) ? this.msg : this.msghover
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
