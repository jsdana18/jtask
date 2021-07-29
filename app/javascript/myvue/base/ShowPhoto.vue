<template>
    <div class="relative" :class="pclass" style="clip-path: inset(-1% -1% 0% 0%);">
        <img :src="photo" class="absolute " :class="imgclass">
    </div>
</template>

<script>
// image_tag e.photo, class: "rounded h-24 overflow-hidden object-center object-cover" if e.photo.attached? %>
export default {
    props: {
        photo: {
            type: String,
            default: '/pic/bg.jpg'
        },
        pclass: {
            type: String,
            default: "w-48 rounded",
        }
    },
    computed: {
        imgclass() {
            return  this.pclass + ' object-center object-cover overflow-hidden'
        },
    },
}
</script>

<style>


.slide-photo {
    animation: slide-photo .1s;
    transition-delay: .1s;
}

@keyframes slide-photo {
    0% { bottom: -50%; }
    98% { bottom: 0% }
}
    
</style>