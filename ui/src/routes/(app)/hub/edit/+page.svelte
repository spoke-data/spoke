<script lang="ts">
</script>

<div class="flex items-center gap-2 mb-4">
	<a href="/" class="h4 font-medium opacity-75">Hub</a>
	<span class="text-xl text-surface-300 font-medium">/</span>
	<h1 class="h4">Edit</h1>
</div>
<hr class="!border-t-2" />

<div class="flex flex-col gap-4 mt-8">
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Organization</span>
		<select class="select w-[400px]">
			<option value="personal">Personal</option>
			<option value="spoke">Spoke</option>
		</select>
	</label>
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Name</span>
		<input type="text" class="input w-[500px]" />
	</label>
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Slug</span>
		<input type="text" class="input w-[500px]" />
	</label>
	<button type="button" class="btn variant-filled mt-4 w-[100px]">Create</button>
</div>
