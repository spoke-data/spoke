<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Clusters' }];
</script>

<PageHeader {breadcrumbs} />

<div class="flex gap-4 mt-8">TODO: clusters overview...</div>
