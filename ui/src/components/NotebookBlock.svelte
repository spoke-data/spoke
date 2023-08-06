<script lang="ts">
	import CodeEditor from './CodeEditor.svelte';

	export let code;
	export let lang;
</script>

<CodeEditor {code} {lang} tab="\t" class="input w-full min-h-[100px] text-xl p-2 !border-l-8" />
