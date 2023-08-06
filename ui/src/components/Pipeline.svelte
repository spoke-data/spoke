<script lang="ts">
	import Fa from 'svelte-fa';
	import { faPlay } from '@fortawesome/free-solid-svg-icons';
</script>

<div class="flex items-stretch gap-2">
	<button
		type="button"
		class="button border variant-filled-surface rounded-tl-lg rounded-bl-lg px-4"
	>
		<Fa icon={faPlay} size="lg" />
	</button>
	<div class="w-full border p-4">TODO: sine wave</div>
</div>
