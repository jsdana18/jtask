<template>
   <transition mode="out-in">
        <a :href="purl" class="transition duration-300 px-3 pt-2 pb-2 rounded border" :class="pclass"> 
            <slot></slot> 
        </a>
   </transition>
    
</template>

<script>
export default {
    data: function() {
        return {

        }
    },
    props: {
        pclass: String,
        purl: String,
    },
    // methods: {
    //     ppost: function() {
    //        ax.post(this.purl)
    //     }
    // }
}
</script>