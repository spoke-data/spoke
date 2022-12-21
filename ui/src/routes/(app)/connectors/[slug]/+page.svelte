<script lang="ts">
	/** @type {import('./$types').PageData} */
	export let data;
</script>

<div>
	<div class="flex items-center gap-2">
		<a href="/connectors" class="h3 font-medium opacity-75">Connectors</a>
		<span class="text-2xl text-surface-300 font-medium">/</span>
		<h1 class="h3">{data.connector.name}</h1>
	</div>

	<div class="mt-8">TODO... connector overview dashboard</div>
</div>
