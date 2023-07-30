<script lang="ts">
	export let breadcrumbs: { name: string; href?: string }[] = [];
</script>

<div class="group flex justify-between mb-4">
	{#each breadcrumbs as crumb}
		<h1 class="h4 opacity-90">{crumb.name}</h1>
	{/each}
	<slot />
</div>

<hr class="!border-t-2" />
