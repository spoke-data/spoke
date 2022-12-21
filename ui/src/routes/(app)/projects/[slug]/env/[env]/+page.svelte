<script lang="ts">
	/** @type {import('./$types').PageData} */
	export let data;
</script>

<div>
	<div class="flex items-center gap-2">
		<a href="/projects" class="h3 font-medium opacity-50">Projects</a>
		<span class="text-2xl text-surface-300 font-medium">/</span>
		<a href={`/projects/${data.project.slug}`} class="h3 font-medium opacity-75"
			>{data.project.name}</a
		>
		<span class="text-2xl text-surface-300 font-medium">/</span>
		<h1 class="h3">{data.environment.name}</h1>
	</div>

	<div class="mt-8">TODO... environment details</div>
</div>
