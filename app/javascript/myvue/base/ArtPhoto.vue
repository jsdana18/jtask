<template>
    <div class="relative" :class="pclass" style="clip-path: inset(-1% -1% 0% 0%);">
        <transition>
            <img :src="photo" class="absolute " :class="imgclass">
        </transition>
    </div>
</template>

<script>
// image_tag e.photo, class: "rounded h-24 overflow-hidden object-center object-cover" if e.photo.attached? %>
export default {
    data: function() {
        return {
            pSeen: false,
        }
    },
    props: {
        photo: {
            type: String,
            default: '/pic/bg.jpg'
        },
        pclass: {
            type: String,
            default: "h-64 w-full",
        }
    },
    computed: {
        // photoSeen() {
        //     return (this.pSeen && this.photo2 != '') ? this.photo2 : this.photo1
        // },
        imgclass() {
            return  this.pclass + ' object-center object-cover overflow-hidden'
        },
    },
}
</script>

<style>

    
</style>