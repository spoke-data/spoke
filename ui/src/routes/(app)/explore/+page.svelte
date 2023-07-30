<script lang="ts">
	import PageHeader from '../../../components/PageHeader.svelte';
	import CodeEditor from '../../../components/CodeEditor.svelte';
	import NotebookBlock from '../../../components/NotebookBlock.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	const breadcrumbs = [{ name: 'Explore' }];
</script>

<PageHeader {breadcrumbs} />

<div class="grid grid-cols-1 3xl:grid-cols-3 gap-4 mt-8">
	<div class="col-span-1 3xl:col-span-2">
		<div class="mb-4">
			<input type="text" value="Notebook A" class="input border-opacity-0 text-2xl font-bold" />
		</div>
		<div class="flex flex-col w-full mb-4">
			<NotebookBlock code={'SELECT * FROM foo'} lang={'sql'} />
			<hr class="!border-t-1 !border-dotted" />
		</div>
		<div class="flex flex-col w-full mb-4">
			<NotebookBlock code={'print("Hello Python!")'} lang={'python'} />
			<hr class="!border-t-1 !border-dotted" />
		</div>
		<div>
			<button type="button" class="btn variant-ghost w-full opacity-75 hover:opacity-100">
				+
			</button>
		</div>
	</div>

	<div class="col-span-1 hidden 3xl:block">TODO... vertical pipeline</div>
</div>
