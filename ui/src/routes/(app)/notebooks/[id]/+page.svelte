<script lang="ts">
	import PageHeader from '../../../../components/PageHeader.svelte';
	import CodeEditor from '../../../../components/CodeEditor.svelte';
	import NotebookBlock from '../../../../components/NotebookBlock.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	let notebooks = [
		{ id: 'a', name: 'Notebook A' },
		{ id: 'b', name: 'Notebook B' },
		{ id: 'c', name: 'Notebook C' }
	];
	let selectedNotebookId = 'a';

	let people = [{ name: 'David Bowie', age: 69, salary: '400.4' }];
</script>

<div class="col-span-full">
	<div class="flex gap-2">
		{#each notebooks as n}
			<a
				href={`/notebooks/${n.id}`}
				class="chip {selectedNotebookId === n.id ? 'variant-filled' : 'variant-soft'}"
				on:click={() => (selectedNotebookId = n.id)}
				on:keypress
			>
				<span>{n.name}</span>
			</a>
		{/each}
	</div>
</div>

<div class="grid grid-cols-1 3xl:grid-cols-3 mt-4 gap-4">
	<div class="col-span-1 3xl:col-span-2">
		<div class="mb-4">
			<input type="text" value="Notebook A" class="input border-opacity-0 text-2xl font-bold" />
		</div>
	</div>
</div>

<div class="grid grid-cols-1 3xl:grid-cols-3 gap-4">
	<div class="col-span-1 3xl:col-span-2">
		<div class="flex flex-col w-full gap-2 mb-4">
			<NotebookBlock code={"SELECT *\nFROM people\nWHERE name ILIKE '%David%'"} lang={'sql'} />
			<div class="table-container">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Age</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tbody>
						{#each people as row, i}
							<tr>
								<td>{row.name}</td>
								<td>{row.age}</td>
								<td>{row.salary}</td>
							</tr>
						{/each}
					</tbody>
				</table>
			</div>
			<hr class="!border-t-1 !border-dotted mt-2" />
		</div>
	</div>
	<div class="col-span-1 hidden 3xl:block">TODO... vertical execution performance pipeline</div>
</div>

<div class="grid grid-cols-1 3xl:grid-cols-3 gap-4">
	<div class="col-span-1 3xl:col-span-2">
		<div class="flex flex-col w-full gap-2 mb-4">
			<NotebookBlock code={'print("Hello Python!")'} lang={'python'} />
			<hr class="!border-t-1 !border-dotted mt-2" />
		</div>
	</div>
	<div class="col-span-1 hidden 3xl:block">TODO... vertical execution performance pipeline</div>
</div>

<div class="grid grid-cols-1 3xl:grid-cols-3 gap-4">
	<div class="col-span-1 3xl:col-span-2">
		<div>
			<button type="button" class="btn variant-ghost w-full opacity-75 hover:opacity-100">
				+
			</button>
		</div>
	</div>
</div>
