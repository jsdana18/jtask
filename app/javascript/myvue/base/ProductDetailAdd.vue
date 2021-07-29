<template>
    <div class="grid grid-cols-4 s2">
            <div class="py-4"> 規格﹙如：顏色﹚ </div> 
            <div class="py-4"> 尺寸﹙如：S、M、S、L﹚ </div>
            <div class="py-4"> 庫存量﹙如：S、M、S、L﹚ </div>
            
            <div> <%= f.text_field :spec %> </div>
            <div> <%= f.text_field :measure %> </div> 
            <div> <%= f.text_field :inventory %> </div>
            <div class="py-4 col-span-3 text-right">
                <button><i class="material-icons align-middle font-hairline">add_circle_outline</i></button>
            </div>
    </div>
</template>

<script>
export default {
    
}
</script>