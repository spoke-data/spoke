<script lang="ts">
	import { onMount } from 'svelte';
	import { ulid } from 'ulidx';

	export let classes = '';
	export let id = ulid();

	let canvasElement;
	let clientWidth;
	let clientHeight;

	onMount(() => {
		const ctx = canvasElement.getContext('2d');

		// Start a new Path
		ctx.beginPath();
		ctx.moveTo(0, clientHeight / 2);
		ctx.lineTo(clientWidth, clientHeight / 2);

		// Draw the Path
		ctx.stroke();
	});
</script>

<div bind:clientWidth bind:clientHeight class={classes}>
	<canvas id="id" bind:this={canvasElement} />
</div>
