<script lang="ts">
	import Fa from 'svelte-fa';
	import { faGear } from '@fortawesome/free-solid-svg-icons';
	import PageHeader from '../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Hub' }];
</script>

<PageHeader {breadcrumbs}>
	<a href="/hub/edit" title="New Team" class="opacity-60 dark:opacity-75 group-hover:opacity-100">
		<Fa icon={faGear} size="lg" />
	</a>
</PageHeader>

<div
	class="grid grid-cols-1 md:grid-cols-2 2xl:grid-cols-3 4xl:grid-cols-4 5xl:grid-cols-5 gap-12 mt-8"
>
	<div class="bg-surface-800 p-4">
		<h4 class="h5 mb-4">News</h4>
		<div class="flex flex-col gap-4">
			<div class="bg-surface-700 p-4">
				<p>Meta and Microsoft Introduce the Next Generation of Llama</p>
			</div>
			<div class="bg-surface-700 p-4">
				<p>Falcon AI: The New Open Source Large Language Model</p>
			</div>
		</div>
	</div>

	<div class="hidden md:block bg-surface-800 p-4">
		<h4 class="h5">Orgs/Personal</h4>
	</div>

	<div class="hidden 2xl:block bg-surface-800 p-4">
		<h4 class="h5">Orgs/Spoke</h4>
	</div>

	<div class="hidden 4xl:block bg-surface-800 p-4">
		<h4 class="h5">Object Storage</h4>
	</div>

	<div class="hidden 5xl:block bg-surface-800 p-4">
		<h4 class="h5">Catalogs</h4>
	</div>
</div>
