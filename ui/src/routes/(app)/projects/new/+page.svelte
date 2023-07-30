<script lang="ts">
	function handleSubmit() {
		console.log('submit');
	}
</script>

<div class="flex items-center gap-2 mb-4">
	<a href="/projects" class="h4 font-medium opacity-75">Projects</a>
	<span class="text-xl text-surface-300 font-medium">/</span>
	<h1 class="h4">New</h1>
</div>
<hr class="!border-t-2" />

<form on:submit|preventDefault={handleSubmit} class="flex flex-col gap-4 mt-8">
	<label class="label">
		<span class="inline-block w-[70px] font-bold">Cluster</span>
		<select name="project[cluster]" class="select w-[400px]">
			<option value="abc123">Local</option>
			<option value="xyz123">Remote</option>
		</select>
	</label>
	<label class="label">
		<span class="inline-block w-[70px] font-bold">Name</span>
		<input type="text" name="project[name]" class="input w-[500px]" />
	</label>
	<label class="label">
		<span class="inline-block w-[70px] font-bold">Slug</span>
		<input type="text" name="project[slug]" class="input w-[500px]" />
	</label>
	<button type="submit" class="btn variant-filled mt-4 w-[100px]"> Create </button>
</form>
