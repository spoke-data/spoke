<script lang="ts">
	import Fa from 'svelte-fa';
	import { faSquarePlus } from '@fortawesome/free-solid-svg-icons';
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Teams' }];
</script>

<PageHeader {breadcrumbs}>
	<a href="/teams/new" title="New Team" class="opacity-60 dark:opacity-75 group-hover:opacity-100">
		<Fa icon={faSquarePlus} size="2x" />
	</a>
</PageHeader>

<div class="mt-8">TODO... teams overview dashboard</div>
