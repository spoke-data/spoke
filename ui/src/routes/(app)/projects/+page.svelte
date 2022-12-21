<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';
	import ProjectActivity from '../../../components/ProjectActivity.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Projects' }];
</script>

<PageHeader {breadcrumbs} />

<div class="mt-8">
	{#each data.environments as env}
		<div class="grid grid-cols-1 mb-12">
			<h3 class="h4 mb-4">{env.name}</h3>

			<ul class="flex flex-wrap gap-4">
				{#each env.projects as proj}
					<li>
						<a
							href={`/projects/${proj.slug}/env/${env.slug}`}
							class="block card card-hover !p-0 text-lg"
						>
							<header class="card-header p-4">{proj.name}</header>
							<section class="bg-surface-500 opacity-50">
								<ProjectActivity classes="h-[80px]" />
							</section>
							<footer class="card-footer" />
						</a>
					</li>
				{/each}
			</ul>
		</div>
	{/each}
</div>
