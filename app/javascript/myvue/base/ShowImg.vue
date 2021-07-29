<template>
    <div class="relative" :class="pclass" @mouseenter="pSeen=true" @mouseleave="pSeen=false" style="clip-path: inset(-1% -1% 0% 0%);">
        <img :src="photoSeen" class="absolute slide-photo" :class="imgclass">
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
        img1: {
            type: String,
            default: '/pic/bg.jpg'
        },
        img2: {
            type: String,
            default: ''
        },
        pclass: {
            type: String,
            default: "w-48 rounded",
        }
    },
    computed: {
        photoSeen() {
            return (this.pSeen==true && this.img2 != '') ? this.img2 : this.img1
        },
        imgclass() {
            return  this.pclass + 'object-top object-cover overflow-hidden'
        },
    },
}
</script>

<style>


.slide-photo {
    animation: slide-photo .8s;
    transition-delay: .10s;
}

@keyframes slide-photo {
    0% { bottom: -100%; }
    98% { bottom: 0% }
}
    
</style>