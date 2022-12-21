<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Storage' }];
</script>

<div>
	<PageHeader {breadcrumbs} />

	<div class="mt-8">TODO... storage overview dashboard</div>
</div>
