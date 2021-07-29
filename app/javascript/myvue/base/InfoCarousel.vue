<template>
     <transition mode="out-in">
     <div class="relative w-full h-132 mb-10" style="clip-path:inset(0% 0% 0% 0%);" v-if="list">

        <div class="" v-for="(lst, idx) in list" :class="{'hidden': idx != selected}" >
        
            <img :src="photo(idx)" class="absolute z-10 h-132 w-full object-cover object-center align-middle overflow-hidden " > 

            <div class="absolute right-0 mr-12 lg:mr-28 top-0 mt-10 w-100 h-92 rounded z-20 text-3xl border-2 border-purpled-100 text-purpled-600 px-4 opacity-75 slide-text"> 
                <div class="relative h-84 rounded bg-purpled-100 py-3 px-4 my-3 mx-2">
                    <div class="absolute top-0 left-0 overflow-hidden h-20 font-semibold ml-3 mr-4 slide-title"> <a :href="lst.surl"> {{lst.title}} </a></div>
                    <div class="absolute top-0 left-0 s2 ml-4 mt-24 mr-2 pt-2 border-t border-purpled-650 "> {{lst.content}} </div>
                </div>
            </div>

            <div class="cursor-pointer absolute z-20 text-purpled-500 text-3xl h-1/2 opacity-75 pl-2 left-0" style="top: 50%">
                <a class="text-white rounded px-2 hover:bg-greend-900" @click="selected = ((idx-1)<0 ? list.length-1 : idx-1)">&#10094;</a>
            </div>
            <div class="cursor-pointer rounded px-2 absolute z-20 text-indigo-700 text-3xl h-1/2 opacity-75 pr-2 right-0" style="top: 50%">
                <a class="text-white rounded px-2 hover:bg-pinkd-900" @click="selected = ((idx+1)>(list.length-1) ? 0 : idx+1)">&#10095;</a>
            </div>
            
        </div>

        <div class="inline-block w-full flex text-center justify-center z-30 mb-6 absolute bottom-0">
            <div v-for="(lst, idx) in list">
                <span class="rounded-full cursor-pointer my-1 mx-3 px-2 text-center hover:bg-purpled-450" @click="selected = idx" :class="{'bg-purpled-150': selected != idx, 'bg-purpled-350': selected == idx}"> &nbsp; </span>
            </div>
        </div>  

    </div>
    </transition>
</template>


<script>
export default {
    data: function() {
        return {
            seen: false,
            selected: 0,
            bgnumber: 6,
        }
    },
    props: {
        list: Array,
    },
    methods: {
        photo: function(idx) {
            return "/pic/carousel" + ((idx+1) % this.bgnumber) +　".jpg"
        }
    }
}
</script>

<style>

.slide-text {
    animation: slide-text .5s;
    transition-delay: .2s;
}
@keyframes slide-text {
    0% { left: 0%; }
    98% { left:62% }
}

.slide-title {
    animation: slide-title .8s;
    transition-delay: .10s;
}
@keyframes slide-title {
    0% { left: -200%; }
    98% { left: 0% }
}

    
</style>
