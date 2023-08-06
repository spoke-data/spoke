<script lang="ts">
	import logoLight from '$lib/assets/spokey-light.png';
	import logoDark from '$lib/assets/spokey-dark.png';
</script>

<div class="h-[60px] overflow-hidden">
	<img alt="Spokey" src={logoLight} width="80" height="80" class="hidden dark:inline" />
	<img alt="Spokey" src={logoDark} width="80" height="80" class="inline dark:hidden" />
</div>
