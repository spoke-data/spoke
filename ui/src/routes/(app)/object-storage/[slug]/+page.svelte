<script lang="ts">
	/** @type {import('./$types').PageData} */
	export let data;
</script>

<div>
	<div class="flex items-center gap-2 mb-4">
		<a href="/object-storage" class="h4 font-medium opacity-75">Object Storage</a>
		<span class="text-xl text-surface-300 font-medium">/</span>
		<h1 class="h4">{data.objectStorage.name}</h1>
	</div>
	<hr class="!border-t-2" />

	<div class="mt-8">TODO: object storage item...</div>
</div>
