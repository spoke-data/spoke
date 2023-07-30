<script lang="ts">
	import PageHeader from '../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Hub' }];
</script>

<PageHeader {breadcrumbs} />

<div class="grid grid-cols-1 gap-12 mt-8">
	<div>
		<h4 class="h5">Requests</h4>
		<div class="flex gap-4 mt-4">
			{#each data.requests as req}
				<a href={`/requests/${req.id}`} class="block card card-hover p-4 text-lg">
					<header class="card-header p-0">{req.type}</header>
					<section class="p-4">{req.detail}</section>
					<footer class="card-footer">(footer)</footer>
				</a>
			{/each}
		</div>
	</div>

	<div>
		<h4 class="h5">Operations</h4>
		<div class="flex gap-4 mt-4">
			{#each data.activeProjects as proj}
				<a href={`/projects/${proj.slug}`} class="block card card-hover p-4 text-lg">
					<header class="card-header p-0">{proj.name}</header>
					<section class="p-4">(content)</section>
					<footer class="card-footer">(footer)</footer>
				</a>
			{/each}
		</div>
	</div>

	<div>
		<h4 class="h5">Incidents</h4>
		<div class="flex gap-4 mt-4">
			{#each data.activeProjects as proj}
				<a href={`/projects/${proj.slug}`} class="block card card-hover p-4 text-lg">
					<header class="card-header p-0">{proj.name}</header>
					<section class="p-4">(content)</section>
					<footer class="card-footer">(footer)</footer>
				</a>
			{/each}
		</div>
	</div>

	<div>
		<h4 class="h5">Most Active Projects</h4>
		<div class="flex gap-4 mt-4">
			{#each data.activeProjects as proj}
				<a href={`/projects/${proj.slug}`} class="block card card-hover p-4 text-lg">
					<header class="card-header p-0">{proj.name}</header>
					<section class="p-4">(content)</section>
					<footer class="card-footer">(footer)</footer>
				</a>
			{/each}
		</div>
	</div>

	<div>
		<h4 class="h5">Recommended Projects</h4>
		<div class="flex gap-4 mt-4">
			{#each data.recommendedProjects as proj}
				<a href={`/projects/${proj.slug}`} class="block card card-hover p-4 text-lg">
					<header class="card-header p-0">{proj.name}</header>
					<section class="p-4">(content)</section>
					<footer class="card-footer">(footer)</footer>
				</a>
			{/each}
		</div>
	</div>
</div>
