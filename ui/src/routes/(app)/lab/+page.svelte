<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';
	import CodeEditor from '../../../components/CodeEditor.svelte';
	import NotebookBlock from '../../../components/NotebookBlock.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Lab' }];
</script>

<PageHeader {breadcrumbs} />

<div class="flex gap-4 mt-8">TODO: lab overview...</div>
