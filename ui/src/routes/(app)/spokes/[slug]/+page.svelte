<script lang="ts">
</script>

<div class="flex items-center gap-2 mb-4">
	<a href="/clusters" class="h4 font-medium opacity-75">Clusters</a>
	<span class="text-xl text-surface-300 font-medium">/</span>
	<h1 class="h4">New</h1>
</div>
<hr class="!border-t-2" />

<div class="flex flex-col gap-4 mt-8">
	<label class="label">
		<span class="inline-block w-[70px] font-bold">Name</span>
		<input type="text" name="cluster[name]" class="input w-[500px]" />
	</label>
	<label class="label">
		<span class="inline-block w-[70px] font-bold">URI</span>
		<input type="text" name="cluster[uri]" class="input w-[500px]" />
	</label>
	<button type="button" class="btn variant-filled mt-4 w-[100px]">Create</button>
</div>
