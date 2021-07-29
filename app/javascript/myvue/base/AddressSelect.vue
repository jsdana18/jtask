<template>
    <div class="s2 text-gray-650 my-1">
        <select name="address[county]" id="address_county" v-model="cselected" class="w-full px-3 py-3 border tracking-wider text-gray-650">
                <option class="py-4 text-gray-550 hover:text-white hover:bg-gray-550" v-for="(lst,idx) in list" v-if="list.length!=0" :value="lst.county">{{lst.county}}</option>
        </select>

        <div class="py-2 px-3"> 區鄉鎮 </div>

        <select name="address[section]" id="address_section" v-model="sselected" class="w-full px-3 py-3 border tracking-wider text-gray-650">
                <option class="py-4 text-gray-550 hover:text-white hover:bg-gray-550" v-for="(lst,idx) in slist" v-if="slist.length!=0" :value="lst[0]">{{lst[0]}}</option>
        </select>

        <div class="py-2 px-3"> 郵遞區號 </div>
        <input type="text" name="address[post_code]" id="address_post_code" :value="pcode">
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            cselected: '',
            sselected: '',
        }
    },
    props: {
        list: {
            type: Array,
            default: []
        },
        county: {
            type: String,
            default: ''
        },
        section: {
            type: String,
            default: ''
        }
    },
    mounted() {
        // this.cselected = this.list.length==0 ? '' : this.list[0].county
        // this.sselected = this.slist.length==0 ? '' : this.slist
        this.cselected = this.county
        this.sselected = this.section
    },
    computed: {
        pcode() {
            return this.sslist.length==0 ? '' : this.sslist[0][1]
        },
        slist() {
            var sl = this.list.filter( e => e.county == this.cselected)
            return sl.length==0 ? [] : sl[0].section
        },
        sslist() {
            var sl = this.slist.filter( e => e[0]== this.sselected)
            return sl.length==0 ? [] : sl
        }
    }

    
}
</script>