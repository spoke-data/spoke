<script lang="ts">
	import Fa from 'svelte-fa';
	import { faSquarePlus } from '@fortawesome/free-solid-svg-icons';
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Labs' }];
</script>

<PageHeader {breadcrumbs}>
	<a href="/labs/new" title="New Lab" class="opacity-60 dark:opacity-75 group-hover:opacity-100">
		<Fa icon={faSquarePlus} size="2x" />
	</a>
</PageHeader>

<div class="flex gap-4 mt-8">TODO: lab overview...</div>
