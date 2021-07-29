<script>
export default {
    data: function() {
        return {
            sid: '',
            addrSeen: false,
        }
    },
    props: {
        list: {
            type: Array,
            default: []
        },
        selid: {
            type: Number,
            default: -1
        }
    },
    mounted() {
        this.sid = this.selid
    },
    computed: {
        slist() {
            var sl = this.list.filter( e => e.id == this.sid)
            return sl.length==0 ? [] : sl[0]
        },
    },
    methods: {
        setdefault: function(id) {
            return this.selid==id ? "＊＊預設＊＊" : ''
        },
        addrSeenToggle: function() {
            this.addrSeen = !this.addrSeen
        }
    }

    
}
</script>