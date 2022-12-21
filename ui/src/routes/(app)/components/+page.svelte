<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Components' }];
</script>

<div>
	<PageHeader {breadcrumbs} />

	<div class="mt-8">TODO... components overview dashboard</div>
</div>
