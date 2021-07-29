<template>
   <transition mode="out-in">
    <div class="text-normal align-middle px-2 py-1">
        <i class="material-icons align-middle text-white rounded" :class="{'bg-greend-350': pcheck==true, 'bg-pinkd-350': pcheck==false}">{{checkValue}}</i>
        <span class="text-normal align-middle"><slot></slot></span> 
    </div>
   </transition>
    
</template>

<script>
export default {
    props: {
        pcheck: {
            type: Boolean,
            default: false },
    },
    computed: {
        checkValue() {
            return (this.pcheck==true) ? 'check' : 'close'
        }
    },
    methods: {
        // ppost: function() {
        //    ax.post(this.purl)
        // }
    }
}
</script>