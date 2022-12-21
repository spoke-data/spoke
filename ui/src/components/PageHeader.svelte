<script lang="ts">
	export let breadcrumbs: { name: string; href?: string }[] = [];
</script>

{#each breadcrumbs as crumb}
	<h1 class="h3 opacity-90 mb-2">{crumb.name}</h1>
{/each}

<hr class="!border-t-2" />
