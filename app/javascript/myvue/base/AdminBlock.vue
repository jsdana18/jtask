<template>
    <transition mode="out-in">
     <div class="mt-4 mb-8 relative border border border-redd-250" v-if="isAdmin">
        <div class="text-center text-white bg-redd-250 py-3"> hi, 管理者！這是只有管理者看得到的區塊 </div>
            <div class="absolute right-0 top-0 inline-flex px-1 mr-1">
                <div class="mt-1 pr-1"> <show-edit :cname="cname" :id="id" :opened="opened" :ismine="-1"></show-edit> </div>
                <div class="mt-1 pt-1"> <button @click="cshow=!cshow" class="rounded text-right bg-white" :class="{adown : cshow, aup: !cshow}">
                    <i class="material-icons align-middle text-">expand_more</i> 
                </button>
                </div>
            </div>
            <div class="" :class="{sadown : !cshow, saup: cshow}">
                <slot></slot>
            </div>

        </div>

     </div>
     </transition>
</template>

<script>
import { mapState, mapActions } from 'vuex'
// const axios=require('axios')

export default {
    data: function() {
        return {
            cshow: true,
        }
    },
    props: {
        cname: String,
        id: Number,
        opened: { type: Boolean, default: "true" },
    },
    computed: {
        ...mapState('current',[
            'isAdmin',
            'uid',
        ]),
    }
}
</script>

<style>
.adown {
  transform: rotate(0deg);
  transition: transform .400ms linear;
}

.aup {
  transform: rotate(180deg);
  transition: transform .400ms linear;
}

.sadown {
    @apply h-auto w-auto px-4 pt-4 pb-6 overflow-visible inline-block;
    transition: height 3.2s ease-out;
}
.saup {
    @apply h-0 w-auto overflow-hidden;
    text-overflow: ellipsis;
    transition: height 3.2s ease-out;
}  
</style>