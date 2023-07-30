<script lang="ts">
	import Fa from 'svelte-fa';
	import { faSquarePlus } from '@fortawesome/free-solid-svg-icons';
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Models' }];
</script>

<PageHeader {breadcrumbs}>
	<a
		href="/models/new"
		title="New Model"
		class="opacity-60 dark:opacity-75 group-hover:opacity-100"
	>
		<Fa icon={faSquarePlus} size="2x" />
	</a>
</PageHeader>

<div class="mt-8">TODO... model overview dashboard</div>
