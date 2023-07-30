<script lang="ts">
	/** @type {import('./$types').PageData} */
	export let data;
</script>

<div>
	<div class="flex items-center gap-2 mb-4">
		<a href="/organizations" class="h4 font-medium opacity-50">Organizations</a>
		<span class="text-xl text-surface-300 font-medium">/</span>
		<a
			href={`/organizations/${data.team.organization.slug}/teams`}
			class="h4 font-medium opacity-60">{data.team.organization.name}</a
		>
		<span class="text-xl text-surface-300 font-medium">/</span>
		<a
			href={`/organizations/${data.team.organization.slug}/teams`}
			class="h4 font-medium opacity-75">Teams</a
		>
		<span class="text-xl text-surface-300 font-medium">/</span>
		<h1 class="h4">{data.team.name}</h1>
	</div>
	<hr class="!border-t-2" />

	<div class="mt-8">TODO... organization team overview dashboard</div>
</div>
