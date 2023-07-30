<script lang="ts">
	/** @type {import('./$types').PageData} */
	export let data;
</script>

<div>
	<div class="flex items-center gap-2 mb-4">
		<a href="/projects" class="h4 font-medium opacity-75">Projects</a>
		<span class="text-xl text-surface-300 font-medium">/</span>
		<h1 class="h4">{data.project.name}</h1>
	</div>
	<hr class="!border-t-2" />

	<ul class="mt-8">
		{#each data.project.environments as env}
			<li>
				<a href={`/projects/${data.project.name}/env/${env.slug}`}>{env.name}</a>
			</li>
		{/each}
	</ul>
</div>
