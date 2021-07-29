<template>
    <transition mode="out-in">
    <div class="loading-mask fade-mask grid gap-10" :class="showMask" v-if="isLoading"> 
        <div class="text-right pr-32 text-6xl cursor-pointer text-gray-100 hover:text-gray-300" @click.prevent="changeisLoading" v-if="isLoadingClose" >×</div> 
        <div class="text-center" v-else> &nbsp; </div>
        
        <div class="spinner" v-if="isLoadingType==1 || isLoadingShowAllType==true">
            <div class="lo-rotate-circle lo-fade-circle" v-for="n in 12"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==2 || isLoadingShowAllType==true">
            <div class="lo-rotate-circle lo-bounce" v-for="n in 12"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==3 || isLoadingShowAllType==true">
            <div class="lo-chase">
                <div class="lo-chase-dot" v-for="n in 6"></div>
            </div>
        </div>

        <div class="spinner lo-dot" v-if="isLoadingType==4 || isLoadingShowAllType==true">
            <div class="lo-dot-ball" v-for="n in 2"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==5 || isLoadingShowAllType==true">
            <div class="lo-double-bounce lo-double-bounce-ball" v-for="n in 2"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==6 || isLoadingShowAllType==true">
            <div class="lo-scaleout"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==7 || isLoadingShowAllType==true">
            <div class="lo-cube1"></div>
            <div class="lo-cube2"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==8 || isLoadingShowAllType==true">
            <div class="lo-bounced lo-bounced-ball" v-for="n in 3"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==9 || isLoadingShowAllType==true">
            <div class="lo-cube-grid lo-cubes" v-for="n in 9"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==10 ||  isLoadingShowAllType==true">
            <div class="lo-fold lo-fold-cubes" v-for="n in 4"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==11 || isLoadingShowAllType==true">
            <div class="lo-stretch lo-stretch-cubes" v-for="n in 6"></div>
        </div>

        <div class="spinner" v-if="isLoadingType==12 || isLoadingShowAllType==true">
            <div class="lo-plane"></div>
        </div>

    </div>
    </transition>
    
</template>

<script>
import { mapState, mapActions, mapGetters } from 'vuex'

export default {
    data: function() {
        return {
            isLoadingShowAllType: false,
            cr: ['indigod', 'greend', 'yellowd', 'purpled', 'pinkd'],
        }
    },
    computed: {
        ...mapState('info',[
            'isLoading',
            'isLoadingClose',
        ]),
        ...mapGetters('info',[
            'isLoadingType',
        ]),
        showMask() {
            if (this.isLoadingShowAllType == true ) 
                { return 'grid-cols-3 ' + 'bg-' + this.cr[Math.floor(Math.random() * (this.cr.length-1))] + '-700' }
            else 
                { return 'grid-rows-3 ' + 'bg-' + this.cr[Math.floor(Math.random() * (this.cr.length-1))] + '-700' }  
        },

    },
    methods: {
      ...mapActions('info',[
            "isLoadingToggle",
        ]),
      changeisLoading: function() {
        this.isLoadingToggle('toggle')
      }
    },
}
</script>

<style>

.loading-mask {
  @apply fixed w-full h-full z-50 top-0 left-0 opacity-90;
}

.spinner {
    @apply w-32 h-32 overflow-hidden relative mr-auto ml-auto; }

/* 1 */

 .lo-fade-circle {
     @apply w-full h-full absolute left-0 top-0; }

 .lo-fade-circle:before {
     @apply block m-auto w-6 h-6 bg-white rounded-full;
     content: '';
     -webkit-animation: lo-circleFadeDelay 1.2s infinite ease-in-out both;
             animation: lo-circleFadeDelay 1.2s infinite ease-in-out both;
}

.lo-rotate-circle:nth-child(2) { transform: rotate(30deg); -ms-transform: rotate(30deg); -webkit-transform: rotate(30deg);}
.lo-rotate-circle:nth-child(3) { transform: rotate(60deg); -ms-transform: rotate(60deg); -webkit-transform: rotate(60deg);}
.lo-rotate-circle:nth-child(4) { transform: rotate(90deg); -ms-transform: rotate(90deg); -webkit-transform: rotate(90deg);}
.lo-rotate-circle:nth-child(5) { transform: rotate(120deg); -ms-transform: rotate(120deg); -webkit-transform: rotate(120deg);}
.lo-rotate-circle:nth-child(6) { transform: rotate(150deg); -ms-transform: rotate(150deg); -webkit-transform: rotate(150deg);}
.lo-rotate-circle:nth-child(7) { transform: rotate(180deg); -ms-transform: rotate(180deg); -webkit-transform: rotate(180deg);}
.lo-rotate-circle:nth-child(8) { transform: rotate(210deg); -ms-transform: rotate(210deg); -webkit-transform: rotate(210deg);}
.lo-rotate-circle:nth-child(9) { transform: rotate(240deg); -ms-transform: rotate(240deg); -webkit-transform: rotate(240deg);}
.lo-rotate-circle:nth-child(10) { transform: rotate(270deg); -ms-transform: rotate(270deg); -webkit-transform: rotate(270deg);}
.lo-rotate-circle:nth-child(11) { transform: rotate(300deg); -ms-transform: rotate(300deg); -webkit-transform: rotate(300deg);}
.lo-rotate-circle:nth-child(12) { transform: rotate(330deg); -ms-transform: rotate(330deg); -webkit-transform: rotate(330deg);}
.lo-rotate-circle:nth-child(2):before { animation-delay: -1.1s; -webkit-animation-delay: -1.1s;}
.lo-rotate-circle:nth-child(3):before { animation-delay: -1.0s; -webkit-animation-delay: -1.0s;}
.lo-rotate-circle:nth-child(4):before { animation-delay: -0.9s; -webkit-animation-delay: -0.9s;}
.lo-rotate-circle:nth-child(5):before { animation-delay: -0.8s; -webkit-animation-delay: -0.8s;}
.lo-rotate-circle:nth-child(6):before { animation-delay: -0.7s; -webkit-animation-delay: -0.7s;}
.lo-rotate-circle:nth-child(7):before { animation-delay: -0.6s; -webkit-animation-delay: -0.6s;}
.lo-rotate-circle:nth-child(8):before { animation-delay: -0.5s; -webkit-animation-delay: -0.5s;}
.lo-rotate-circle:nth-child(9):before { animation-delay: -0.4s; -webkit-animation-delay: -0.4s;}
.lo-rotate-circle:nth-child(10):before { animation-delay: -0.3s; -webkit-animation-delay: -0.3s;}
.lo-rotate-circle:nth-child(11):before { animation-delay: -0.2s; -webkit-animation-delay: -0.2s;}
.lo-rotate-circle:nth-child(12):before { animation-delay: -0.1s; -webkit-animation-delay: -0.1s;}

@-webkit-keyframes lo-circleFadeDelay {
  0%, 39%, 100% { opacity: 0; }
  40% { opacity: 1; }}

@keyframes lo-circleFadeDelay {
  0%, 39%, 100% { opacity: 0; }
  40% { opacity: 1; } }


/* 2 */
.lo-bounce {
    @apply w-full h-full absolute top-0 left-0; }

.lo-bounce:before {
    @apply block bg-white rounded-full m-auto w-6 h-6;
  content: '';
  -webkit-animation: lo-circleBounceDelay 1.2s infinite ease-in-out both;
          animation: lo-circleBounceDelay 1.2s infinite ease-in-out both;
}

@-webkit-keyframes lo-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0);
  } 40% {
    -webkit-transform: scale(1);
            transform: scale(1); }
}

@keyframes lo-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0);
  } 40% {
    -webkit-transform: scale(1);
            transform: scale(1);}
}

/* 3 */

.lo-chase {
    @apply h-20 w-20 rounded-full m-auto mt-6 ;
  animation: lo-chase-all 2.5s infinite linear both;
}

.lo-chase-dot {
    @apply w-full h-full absolute bottom-0 left-0;
  animation: lo-chase-dot 2.0s infinite ease-in-out both; 
}

.lo-chase-dot:before {
    @apply block w-6 h-6 bg-white rounded-full;
  content: '';
  animation: lo-chase-dot-before 2.0s infinite ease-in-out both; 
}

.lo-chase-dot:nth-child(1) { animation-delay: -1.1s; }
.lo-chase-dot:nth-child(2) { animation-delay: -1.0s; }
.lo-chase-dot:nth-child(3) { animation-delay: -0.9s; }
.lo-chase-dot:nth-child(4) { animation-delay: -0.8s; }
.lo-chase-dot:nth-child(5) { animation-delay: -0.7s; }
.lo-chase-dot:nth-child(6) { animation-delay: -0.6s; }
.lo-chase-dot:nth-child(1):before { animation-delay: -1.1s; }
.lo-chase-dot:nth-child(2):before { animation-delay: -1.0s; }
.lo-chase-dot:nth-child(3):before { animation-delay: -0.9s; }
.lo-chase-dot:nth-child(4):before { animation-delay: -0.8s; }
.lo-chase-dot:nth-child(5):before { animation-delay: -0.7s; }
.lo-chase-dot:nth-child(6):before { animation-delay: -0.6s; }


@keyframes lo-chase-all {
  100% { transform: rotate(360deg); } 
}
 
@keyframes lo-chase-dot {
  80%, 100% { transform: rotate(360deg); } 
}

@keyframes lo-chase-dot-before {
  50% {
    transform: scale(0.4); 
  } 100%, 0% {
    transform: scale(1.0); 
  } 
}

/* 4 */

.lo-dot {
  @apply m-auto text-center;
  -webkit-animation: sk-rotate 2.0s infinite linear;
  animation: lo-dot-rotate 2.0s infinite linear;
}

.lo-dot-ball {
    @apply h-16 w-16 inline-block bg-white absolute top-0 rounded-full;
  -webkit-animation: lo-dot-bounce 2.0s infinite ease-in-out;
  animation: lo-dot-bounce 2.0s infinite ease-in-out;
}

.lo-dot-ball:nth-child(2) { @apply top-auto bottom-0; animation-delay: -1.0s; -webkit-animation-delay: -1.0s;}

@-webkit-keyframes lo-dot-rotate  { 100% { -webkit-transform: rotate(360deg) }}
@keyframes lo-dot-rotate { 100% { transform: rotate(360deg); -webkit-transform: rotate(360deg) }}

@-webkit-keyframes lo-dot-bounce {
  0%, 100% { -webkit-transform: scale(0.0) }
  50% { -webkit-transform: scale(1.0) }
}

@keyframes lo-dot-bounce {
  0%, 100% { 
    transform: scale(0.0);
    -webkit-transform: scale(0.0);
  } 50% { 
    transform: scale(1.0);
    -webkit-transform: scale(1.0);
  }
}

/* 5 */

.lo-double-bounce {
    @apply w-full h-full rounded-full opacity-75 absolute top-0 left-0 bg-white;
    -webkit-animation: lo-double-bounce 2.0s infinite ease-in-out;
    animation: lo-double-bounce 2.0s infinite ease-in-out; }

.lo-double-bounce-ball:nth-child(2) { -webkit-animation-delay: -1.0s; animation-delay: -1.0s; }

@-webkit-keyframes lo-double-bounce {
  0%, 100% { -webkit-transform: scale(0.0) }
  50% { -webkit-transform: scale(1.0) } }

@keyframes lo-double-bounce {
  0%, 100% { 
    transform: scale(0.0);
    -webkit-transform: scale(0.0);
  } 50% { 
    transform: scale(1.0);
    -webkit-transform: scale(1.0);
  } }

/* 6 */
.lo-scaleout {
    @apply bg-white m-auto rounded-full w-full h-full; 
    -webkit-animation: lo-scaleout 1.0s infinite ease-in-out;
    animation: lo-scaleout 1.0s infinite ease-in-out;
}

@-webkit-keyframes lo-scaleout {
  0% { -webkit-transform: scale(0) }
  100% {
    -webkit-transform: scale(1.0);
    opacity: 0; }
}

@keyframes lo-scaleout {
  0% { 
    -webkit-transform: scale(0);
    transform: scale(0);
  } 100% {
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
    opacity: 0; }
}

/* 7 */

.lo-cube1, .lo-cube2 {
    @apply w-12 h-12 absolute mr-auto ml-auto bg-white;
    -webkit-animation: lo-cubemove 1.8s infinite ease-in-out;
    animation: lo-cubemove 1.8s infinite ease-in-out; }

.lo-cube2 {
    -webkit-animation-delay: -0.9s;
    animation-delay: -0.9s; }

@-webkit-keyframes lo-cubemove {
    25% { -webkit-transform: translateX(78px) rotate(-90deg) scale(0.5) }
    50% { -webkit-transform: translateX(78px) translateY(78px) rotate(-180deg)}
    75% { -webkit-transform: translateX(0px) translateY(78px) rotate(-270deg) scale(0.5) }
    100% { -webkit-transform: rotate(-360deg) } }

@keyframes lo-cubemove {
    25% {
        transform: translateX(78px) rotate(-90deg) scale(0.5);
        -webkit-transform: translateX(78px) rotate(-90deg) scale(0.5); }
    50% {
        transform: translateX(78px) translateY(78px) rotate(-179deg);
        -webkit-transform: translateX(78px) translateY(78px) rotate(-179deg); }
    50.1% {
        transform: translateX(78px) translateY(78px) rotate(-180deg);
        -webkit-transform: translateX(78px) translateY(78px) rotate(-180deg); }
    75% {
        transform: translateX(0px) translateY(78px) rotate(-270deg) scale(0.5);
        -webkit-transform: translateX(0px) translateY(78px) rotate(-270deg) scale(0.5); }
    100% {
        transform: rotate(-360deg);
        -webkit-transform: rotate(-360deg); } }


/* 8 */

.lo-bounced {
  @apply w-10 h-10 rounded-full inline-block bg-white;
  -webkit-animation: lo-bouncedelay 1.4s infinite ease-in-out both;
  animation: lo-bouncedelay 1.4s infinite ease-in-out both; }

.lo-bounced-ball:nth-child(1) { -webkit-animation-delay: -0.32s; animation-delay: -0.32s; }
.lo-bounced-ball:nth-child(2) { -webkit-animation-delay: -0.16s; animation-delay: -0.16s; }

@-webkit-keyframes lo-bouncedelay {
  0%, 80%, 100% { -webkit-transform: scale(0) }
  40% { -webkit-transform: scale(1.0) } }

@keyframes lo-bouncedelay {
  0%, 80%, 100% { 
    -webkit-transform: scale(0);
    transform: scale(0);
  } 40% { 
    -webkit-transform: scale(1.0);
    transform: scale(1.0); }
}

/* 9 */
.lo-cube-grid {
   @apply w-10 h-10 float-left overflow-hidden  bg-white;
  -webkit-animation: lo-cubeGridScaleDelay 1.3s infinite ease-in-out;
          animation: lo-cubeGridScaleDelay 1.3s infinite ease-in-out;  }

.lo-cubes:nth-child(1) { animation-delay: 0.2s; -webkit-animation-delay: 0.2s;}
.lo-cubes:nth-child(2) { animation-delay: 0.3s; -webkit-animation-delay: 0.3s;}
.lo-cubes:nth-child(3) { animation-delay: 0.4s; -webkit-animation-delay: 0.4s;}
.lo-cubes:nth-child(4) { animation-delay: 0.1s; -webkit-animation-delay: 0.1s;}
.lo-cubes:nth-child(5) { animation-delay: 0.2s; -webkit-animation-delay: 0.2s;}
.lo-cubes:nth-child(6) { animation-delay: 0.3s; -webkit-animation-delay: 0.3s;}
.lo-cubes:nth-child(7) { animation-delay: 0.0s; -webkit-animation-delay: 0.0s;}
.lo-cubes:nth-child(8) { animation-delay: 0.1s; -webkit-animation-delay: 0.1s;}
.lo-cubes:nth-child(9) { animation-delay: 0.2s; -webkit-animation-delay: 0.2s;}


@-webkit-keyframes lo-cubeGridScaleDelay {
  0%, 70%, 100% {
    -webkit-transform: scale3D(1, 1, 1);
            transform: scale3D(1, 1, 1);
  } 35% {
    -webkit-transform: scale3D(0, 0, 1);
            transform: scale3D(0, 0, 1); }
}

@keyframes lo-cubeGridScaleDelay {
  0%, 70%, 100% {
    -webkit-transform: scale3D(1, 1, 1);
            transform: scale3D(1, 1, 1);
  } 35% {
    -webkit-transform: scale3D(0, 0, 1);
            transform: scale3D(0, 0, 1);} 
}

/* 10 */

.lo-fold {
  @apply float-left w-12 h-12 relative ;
  -webkit-transform: scale(1.2);
      -ms-transform: scale(1.2);
          transform: scale(1.2);  }

.lo-fold:before {
  @apply w-full h-full absolute top-0 left-0 bg-white;
  content: '';
  -webkit-animation: lo-foldCubeAngle 2.4s infinite linear both;
          animation: lo-foldCubeAngle 2.4s infinite linear both;
  -webkit-transform-origin: 100% 100%;
      -ms-transform-origin: 100% 100%;
          transform-origin: 100% 100%; }

.lo-fold-cubes:nth-child(2) { -webkit-transform: scale(1.2) rotateZ(90deg); transform: scale(1.2) rotateZ(90deg); }
.lo-fold-cubes:nth-child(3) { -webkit-transform: scale(1.2) rotateZ(180deg); transform: scale(1.2) rotateZ(180deg); }
.lo-fold-cubes:nth-child(4) { -webkit-transform: scale(1.2) rotateZ(270deg); transform: scale(1.2) rotateZ(270deg); }
.lo-fold-cubes:nth-child(2):before { -webkit-animation-delay: 0.4s; animation-delay: 0.4s; }
.lo-fold-cubes:nth-child(3):before { -webkit-animation-delay: 0.8s; animation-delay: 0.8s; }
.lo-fold-cubes:nth-child(4):before { -webkit-animation-delay: 1.2s; animation-delay: 1.2s; }

@-webkit-keyframes lo-foldCubeAngle {
  0%, 10% {
    -webkit-transform: perspective(140px) rotateX(-180deg);
            transform: perspective(140px) rotateX(-180deg);
    opacity: 0; 
  } 25%, 75% {
    -webkit-transform: perspective(140px) rotateX(0deg);
            transform: perspective(140px) rotateX(0deg);
    opacity: 1; 
  } 90%, 100% {
    -webkit-transform: perspective(140px) rotateY(180deg);
            transform: perspective(140px) rotateY(180deg);
    opacity: 0; 
  } 
}

@keyframes lo-foldCubeAngle {
  0%, 10% {
    -webkit-transform: perspective(140px) rotateX(-180deg);
            transform: perspective(140px) rotateX(-180deg);
    opacity: 0; 
  } 25%, 75% {
    -webkit-transform: perspective(140px) rotateX(0deg);
            transform: perspective(140px) rotateX(0deg);
    opacity: 1; 
  } 90%, 100% {
    -webkit-transform: perspective(140px) rotateY(180deg);
            transform: perspective(140px) rotateY(180deg);
    opacity: 0; 
  }
}

/* 11 */

.lo-stretch {
    @apply bg-white h-full w-4 mr-1 inline-block;
  -webkit-animation: lo-stretchdelay 1.2s infinite ease-in-out;
  animation: lo-stretchdelay 1.2s infinite ease-in-out;
}

.lo-stretch-cubes:nth-child(2) { animation-delay: -1.1s; -webkit-animation-delay: -1.1s;}
.lo-stretch-cubes:nth-child(3) { animation-delay: -1.0s; -webkit-animation-delay: -1.0s;}
.lo-stretch-cubes:nth-child(4) { animation-delay: -0.9s; -webkit-animation-delay: -0.9s;}
.lo-stretch-cubes:nth-child(5) { animation-delay: -0.8s; -webkit-animation-delay: -0.8s;}

@-webkit-keyframes lo-stretchdelay {
  0%, 40%, 100% { -webkit-transform: scaleY(0.4) }  
  20% { -webkit-transform: scaleY(1.0) }
}

@keyframes lo-stretchdelay {
  0%, 40%, 100% { 
    transform: scaleY(0.4);
    -webkit-transform: scaleY(0.4);
  }  20% { 
    transform: scaleY(1.0);
    -webkit-transform: scaleY(1.0);
  }
}

/* 12 */
.lo-plane {
    @apply bg-white w-full h-full m-auto;
  -webkit-animation: lo-rotateplane 1.2s infinite ease-in-out;
  animation: lo-rotateplane 1.2s infinite ease-in-out;
}

@-webkit-keyframes lo-rotateplane {
  0% { -webkit-transform: perspective(120px) }
  50% { -webkit-transform: perspective(120px) rotateY(180deg) }
  100% { -webkit-transform: perspective(120px) rotateY(180deg)  rotateX(180deg) }
}

@keyframes lo-rotateplane {
  0% { 
    transform: perspective(120px) rotateX(0deg) rotateY(0deg);
    -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg) 
  } 50% { 
    transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
    -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg) 
  } 100% { 
    transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
    -webkit-transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
  }
}

/* fade-mask */

.fade-mask {
 animation: fadeMask 1.2s ease-in-out;
}

@keyframes fadeMask {
    0% { opacity: 1 ;}
    50% { opacity: .5 ;}
    100% { opacity: .9 ;}
}
    
</style>