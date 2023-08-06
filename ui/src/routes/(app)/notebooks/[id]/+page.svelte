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

<div class="relative">
	<div class="hidden 3xl:block absolute top-0 bottom-[20px] right-[210px] border-r">&nbsp</div>

	<div class="relative z-10">
		<div class="flex gap-4 mt-4">
			<div class="w-full">
				<div class="mb-4">
					<input type="text" value="Notebook A" class="input border-opacity-0 text-2xl font-bold" />
				</div>
			</div>
			<div class="w-[600px] hidden 3xl:block">
				<div class="bg-surface-700 p-2 rounded-sm">
					<strong>init mem:</strong> 32MB, <strong>init cpu</strong>: 0%
				</div>
			</div>
		</div>

		<div class="flex gap-4">
			<div class="w-full">
				<div class="flex flex-col w-full gap-2 mb-4">
					<NotebookBlock code={"SELECT *\nFROM people\nWHERE name ILIKE '%David%'"} lang={'sql'} />
					<div class="table-container rounded-sm">
						<table class="table table-hover rounded-sm">
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
			<div class="w-[600px] hidden 3xl:block">
				<div class="bg-surface-700 p-2 rounded-sm">
					<strong>time:</strong> 0.12s, <strong>mem:</strong> 104MB, <strong>cpu</strong>: 44%
				</div>
			</div>
		</div>

		<div class="flex gap-4">
			<div class="w-full">
				<div class="flex flex-col w-full gap-2 mb-4">
					<NotebookBlock code={'print("Hello Python!")'} lang={'python'} />
					<div class="bg-surface-100 dark:bg-surface-800 p-4 rounded-sm">Hello Python!</div>
					<hr class="!border-t-1 !border-dotted mt-2" />
				</div>
			</div>
			<div class="w-[600px] hidden 3xl:block">
				<div class="bg-surface-700 p-2 rounded-sm">
					<strong>time:</strong> 0.23s, <strong>mem:</strong> 43MB, <strong>cpu</strong>: 21%
				</div>
			</div>
		</div>

		<div class="flex gap-4">
			<div class="w-full">
				<div class="flex flex-col w-full gap-2 mb-4">
					<button type="button" class="btn variant-ghost w-full opacity-75 hover:opacity-100">
						+
					</button>
				</div>
			</div>
			<div class="w-[600px] hidden 3xl:block">
				<div class="bg-surface-700 p-2 rounded-sm">
					<strong>total time:</strong> 0.35s, <strong>total mem:</strong> 179MB,
					<strong>max cpu</strong>: 44%
				</div>
			</div>
		</div>
	</div>
</div>
