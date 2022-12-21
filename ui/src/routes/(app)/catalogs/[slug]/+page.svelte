<script lang="ts">
	/** @type {import('./$types').PageData} */
	export let data;
</script>

<div>
	<div class="flex items-center gap-2 mb-2">
		<a href="/catalogs" class="h3 font-medium opacity-75">Catalogs</a>
		<span class="text-2xl text-surface-300 font-medium">/</span>
		<h1 class="h3">{data.catalog.name}</h1>
	</div>
	<hr class="!border-t-2" />

	<div class="mt-8">TODO... catalog overview dashboard</div>
</div>
