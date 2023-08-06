<script lang="ts">
	import Fa from 'svelte-fa';
	import { faSquarePlus } from '@fortawesome/free-solid-svg-icons';
	import PageHeader from '../../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Settings' }];
</script>

<PageHeader {breadcrumbs} />

<div class="mt-8">TODO... settings</div>
