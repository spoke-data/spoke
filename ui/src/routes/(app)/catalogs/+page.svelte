<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Catalogs' }];
</script>

<div>
	<PageHeader {breadcrumbs} />

	<div class="mt-8">TODO... catalog overview dashboard</div>
</div>
