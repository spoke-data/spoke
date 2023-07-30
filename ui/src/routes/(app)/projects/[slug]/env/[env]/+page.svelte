<script lang="ts">
	/** @type {import('./$types').PageData} */
	export let data;
</script>

<div class="flex items-center gap-2 mb-4">
	<a href="/projects" class="h4 font-medium opacity-50">Projects</a>
	<span class="text-xl text-surface-300 font-medium">/</span>
	<a href={`/projects/${data.project.slug}`} class="h4 font-medium opacity-75"
		>{data.project.name}</a
	>
	<span class="text-xl text-surface-300 font-medium">/</span>
	<h1 class="h4">{data.environment.name}</h1>
</div>
<hr class="!border-t-2" />

<div class="mt-8">TODO... environment details</div>
