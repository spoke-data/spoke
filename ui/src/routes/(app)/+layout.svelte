<script lang="ts">
	import {
		AppBar,
		AppRail,
		AppRailAnchor,
		AppRailTile,
		AppShell,
		Avatar,
		Drawer,
		LightSwitch,
		drawerStore
	} from '@skeletonlabs/skeleton';
	import type { DrawerSettings } from '@skeletonlabs/skeleton';
	import FocusKey from 'svelte-focus-key';
	import Sidebar from '../../components/Sidebar.svelte';
	import Logo from '../../components/Logo.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	let searchElement;
</script>

<AppShell>
	<svelte:fragment slot="pageHeader">
		<AppBar
			gridColumns="grid-cols-1"
			slotDefault="flex flex-col sm:flex-row justify-between gap-4 items-center"
			slotTrail="place-content-end"
			class="border-b border-slate-200 dark:border-slate-600 shadow-lg"
		>
			<div class="flex items-center">
				<button class="lg:hidden btn btn-sm mr-6">
					<span>
						<svg viewBox="0 0 100 80" class="fill-token w-4 h-4">
							<rect width="100" height="20" />
							<rect y="30" width="100" height="20" />
							<rect y="60" width="100" height="20" />
						</svg>
					</span>
				</button>
				<AppRailAnchor href="/" class="lg:hidden">
					<Logo />
					<strong class="h2">Spoke</strong>
				</AppRailAnchor>
			</div>
			<div>
				<input
					type="text"
					placeholder="/"
					bind:this={searchElement}
					class="w-[500px] sm:w-[300px] md:w-[400px] lg:w-[450px] xl:w-[600px] 2xl:w-[700px] 3xl:w-[900px] 4xl:w-[1000px] rounded text-sm 3xl:text-2xl font-medium placeholder:text-slate-300"
				/>
				<FocusKey element={searchElement} />
			</div>
			<div class="flex items-center gap-4">
				{#if false}
					<a href="/explore">explore</a>
				{/if}
				<LightSwitch />
				<div class="ring-outline-token rounded-full p-1">
					<Avatar
						src="https://images.unsplash.com/photo-1617296538902-887900d9b592?ixid=M3w0Njc5ODF8MHwxfGFsbHx8fHx8fHx8fDE2ODc5NzExMDB8&ixlib=rb-4.0.3&w=128&h=128&auto=format&fit=crop"
						width="w-8 2xl:w-10"
						rounded="rounded-full"
					/>
				</div>
			</div>
		</AppBar>
	</svelte:fragment>

	<svelte:fragment slot="lead" />

	<svelte:fragment slot="sidebarLeft">
		<Sidebar {data} />
	</svelte:fragment>

	<div
		class="min-h-full bg-surface-50 dark:bg-surface-900 m-2 2xl:m-4 mb-0 p-8 border border-slate-200 dark:border-slate-600 rounded-md shadow-lg"
	>
		<slot />
	</div>
</AppShell>
