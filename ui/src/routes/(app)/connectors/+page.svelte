<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Connectors' }];
</script>

<div>
	<PageHeader {breadcrumbs} />

	<div class="mt-8">TODO... connectors overview dashboard</div>
</div>
