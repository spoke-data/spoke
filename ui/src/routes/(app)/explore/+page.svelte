<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Explore' }];
</script>

<div>
	<PageHeader {breadcrumbs} />

	<div class="mt-8">TODO... explore overview dashboard</div>
</div>
