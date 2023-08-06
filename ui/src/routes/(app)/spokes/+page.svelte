<script lang="ts">
	import Fa from 'svelte-fa';
	import { faSquarePlus } from '@fortawesome/free-solid-svg-icons';
	import PageHeader from '../../../components/PageHeader.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Spokes' }];
</script>

<PageHeader {breadcrumbs} />

<div class="flex gap-4 mt-8">Connect to other remote Spoke nodes</div>
