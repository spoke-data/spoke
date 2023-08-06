<script lang="ts">
	import Pipeline from '../../../../../../components/Pipeline.svelte';

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

<div class="flex flex-col gap-8 mt-8">
	<div>
		<div>
			<h3 id="pipelines" class="inline-block h4">
				<span>Pipelines</span>
				<hr class="opacity-75" />
			</h3>
		</div>
		<div class="flex flex-col gap-4 mt-2">
			<div>
				<Pipeline />
			</div>
		</div>
	</div>

	<div>
		<div>
			<h3 id="models" class="inline-block h4">
				<span>Models</span>
				<hr class="opacity-75" />
			</h3>
		</div>
		<div class="flex flex-col gap-4 mt-2">
			<div>
				<div class="flex gap-4">
					<div class="card p-4">
						<div clas="card-header">Madden</div>
						<div class="">TODO... training/inference stats of model</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div>
			<h3 id="apis" class="inline-block h4">
				<span>APIs</span>
				<hr class="opacity-75" />
			</h3>
		</div>
		<div class="flex flex-col gap-4 mt-2">
			<div>
				<div class="flex gap-4">
					<div class="card p-4">
						<div clas="card-header">/api/v1/sports</div>
						<div class="">TODO... p95, p99 over time</div>
					</div>
					<div class="card p-4">
						<div clas="card-header">/api/v1/sports/:sport/players</div>
						<div class="">TODO... p95, p99 over time</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
