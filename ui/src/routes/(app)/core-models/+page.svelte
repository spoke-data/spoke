<script lang="ts">
	import Fa from 'svelte-fa';
	import { faSquarePlus } from '@fortawesome/free-solid-svg-icons';
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Core Models' }];
</script>

<PageHeader {breadcrumbs}>
	<a
		href="/core-models/new"
		title="New Core Model"
		class="opacity-60 dark:opacity-75 group-hover:opacity-100"
	>
		<Fa icon={faSquarePlus} size="2x" />
	</a>
</PageHeader>

<div class="mt-8">TODO... core model overview dashboard</div>
