<script lang="ts">
	import CodeEditor from './CodeEditor.svelte';

	export let code;
	export let lang;
</script>

<CodeEditor {code} {lang} tab="\t" class="input w-full min-h-[100px] text-xl p-2 !border-l-8" />
<div class="mt-4 mb-6 border p-2 border-slate-600">TODO... results</div>
