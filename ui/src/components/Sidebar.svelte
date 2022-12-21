<script lang="ts">
	import { AppRailAnchor } from '@skeletonlabs/skeleton';
	import { page } from '$app/stores';
	import {
		isProjectsExpanded,
		isCatalogsExpanded,
		isStorageExpanded,
		isConnectorsExpanded,
		isComponentsExpanded,
		isTeamsExpanded,
		isOrganizationsExpanded
	} from '../lib/stores/sidebar';
	import Logo from './Logo.svelte';

	export let data;

	$: resourceClassesActive = (href: string) =>
		$page.url.pathname === href ? '!bg-tertiary-300 dark:!bg-tertiary-500 opacity-90' : '';
	$: itemClassesActive = (href: string) =>
		$page.url.pathname.startsWith(href) ? '!bg-tertiary-300 dark:!bg-tertiary-500' : '';
</script>

<div id="sidebar-left" class="min-h-full hidden lg:block">
	<div
		class="flex flex-col gap-4 min-h-screen pt-4 pl-2 rounded-b border-r border-slate-200 dark:border-slate-600 bg-surface-100-800-token shadow-2xl"
	>
		<AppRailAnchor href="/" class="hidden lg:block pl-2">
			<div class="flex justify-between mb-1">
				<strong class="flex items-center gap-4 h2">
					<Logo />
					<span>Spoke</span>
				</strong>
				<button class="hidden lg:block btn btn-sm">
					<span>
						<svg viewBox="0 0 100 80" class="fill-token w-4 h-4">
							<rect width="100" height="20" />
							<rect y="30" width="100" height="20" />
							<rect y="60" width="100" height="20" />
						</svg>
					</span>
				</button>
			</div>
		</AppRailAnchor>
		<div class="flex flex-col gap-2 pr-2">
			<nav class="list-nav">
				<h2 class="flex justify-between items-center h4">
					<a href="/projects" class={resourceClassesActive('/projects')}>Projects</a>
					<span
						class="cursor-pointer"
						on:click={() => isProjectsExpanded.update(() => !$isProjectsExpanded)}
					>
						{#if $isProjectsExpanded}&#9660;{:else}&#9650;{/if}
					</span>
				</h2>
				{#if data.projects.length > 0}
					<ul class={`opacity-90 ${$isProjectsExpanded ? '' : 'invisible h-[0px]'}`}>
						{#each data.projects as proj}
							<li>
								<a
									href={`/projects/${proj.slug}`}
									class={itemClassesActive(`/projects/${proj.slug}`)}
								>
									{proj.name}
								</a>
							</li>
						{/each}
					</ul>
				{/if}
			</nav>

			<nav class="list-nav">
				<h2 class="flex justify-between items-center h4">
					<a href="/catalogs" class={resourceClassesActive('/catalogs')}>Catalogs</a>
					<span
						class="cursor-pointer"
						on:click={() => isCatalogsExpanded.update(() => !$isCatalogsExpanded)}
					>
						{#if $isCatalogsExpanded}&#9660;{:else}&#9650;{/if}
					</span>
				</h2>
				{#if data.catalogs.length > 0}
					<ul class={`opacity-90 ${$isCatalogsExpanded ? '' : 'invisible h-[0px]'}`}>
						{#each data.catalogs as cat}
							<li>
								<a
									href={`/catalogs/${cat.slug}`}
									class={itemClassesActive(`/catalogs/${cat.slug}`)}
								>
									{cat.name}
								</a>
							</li>
						{/each}
					</ul>
				{/if}
			</nav>

			<nav class="list-nav">
				<h2 class="flex justify-between items-center h4">
					<a href="/storage" class={resourceClassesActive('/storage')}>Storage</a>
					<span
						class="cursor-pointer"
						on:click={() => isStorageExpanded.update(() => !$isStorageExpanded)}
					>
						{#if $isStorageExpanded}&#9660;{:else}&#9650;{/if}
					</span>
				</h2>
				{#if data.storage.length > 0}
					<ul class={`opacity-90 ${$isStorageExpanded ? '' : 'invisible h-[0px]'}`}>
						{#each data.storage as stor}
							<li>
								<a
									href={`/storage/${stor.slug}`}
									class={itemClassesActive(`/storage/${stor.slug}`)}
								>
									{stor.name}
								</a>
							</li>
						{/each}
					</ul>
				{/if}
			</nav>

			<nav class="list-nav">
				<h2 class="flex justify-between items-center h4">
					<a href="/connectors" class={resourceClassesActive('/connectors')}>Connectors</a>
					<span
						class="cursor-pointer"
						on:click={() => isConnectorsExpanded.update(() => !$isConnectorsExpanded)}
					>
						{#if $isConnectorsExpanded}&#9660;{:else}&#9650;{/if}
					</span>
				</h2>
				{#if data.connectors.length > 0}
					<ul class={`opacity-90 ${$isConnectorsExpanded ? '' : 'invisible h-[0px]'}`}>
						{#each data.connectors as conn}
							<li>
								<a
									href={`/connectors/${conn.slug}`}
									class={itemClassesActive(`/connectors/${conn.slug}`)}>{conn.name}</a
								>
							</li>
						{/each}
					</ul>
				{/if}
			</nav>

			<nav class="list-nav">
				<h2 class="flex justify-between items-center h4">
					<a href="/components" class={resourceClassesActive('/components')}>Components</a>
					<span
						class="cursor-pointer"
						on:click={() => isComponentsExpanded.update(() => !$isComponentsExpanded)}
					>
						{#if $isComponentsExpanded}&#9660;{:else}&#9650;{/if}
					</span>
				</h2>
				{#if data.components.length > 0}
					<ul class={`opacity-90 ${$isComponentsExpanded ? '' : 'invisible h-[0px]'}`}>
						{#each data.components as comp}
							<li>
								<a href={comp.uri} class={itemClassesActive(`/components/${comp.slug}`)}
									>{comp.name}</a
								>
							</li>
						{/each}
					</ul>
				{/if}
			</nav>

			<nav class="list-nav">
				<h2 class="flex justify-between items-center h4">
					<a href="/teams" class={resourceClassesActive('/teams')}>Teams</a>
					<span
						class="cursor-pointer"
						on:click={() => isTeamsExpanded.update(() => !$isTeamsExpanded)}
					>
						{#if $isTeamsExpanded}&#9660;{:else}&#9650;{/if}
					</span>
				</h2>
				{#if data.teams.length > 0}
					<ul class={`opacity-90 ${$isTeamsExpanded ? '' : 'invisible h-[0px]'}`}>
						{#each data.teams as team}
							<li>
								<a href={team.uri} class={itemClassesActive(`/teams/${team.uri}`)}>
									<span class="opacity-75">{team.organization}</span>
									<span class="opacity-50">/</span>
									<span>{team.name}</span>
								</a>
							</li>
						{/each}
					</ul>
				{/if}
			</nav>

			<nav class="list-nav">
				<h2 class="flex justify-between items-center h4">
					<a href="/organizations" class={resourceClassesActive('/organizations')}>Organizations</a>
					<span
						class="cursor-pointer"
						on:click={() => isOrganizationsExpanded.update(() => !$isOrganizationsExpanded)}
					>
						{#if $isOrganizationsExpanded}&#9660;{:else}&#9650;{/if}
					</span>
				</h2>
				{#if data.organizations.length > 0}
					<ul class={`opacity-90 ${$isOrganizationsExpanded ? '' : 'invisible h-[0px]'}`}>
						{#each data.organizations as org}
							<li>
								<a
									href={`/organizations/${org.uri}`}
									class={itemClassesActive(`/organizations/${org.slug}`)}>{org.name}</a
								>
							</li>
						{/each}
					</ul>
				{/if}
			</nav>
		</div>
	</div>
</div>
