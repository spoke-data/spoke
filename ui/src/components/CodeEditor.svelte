<script context="module">
	import { CodeJar } from 'codejar';
	import { withLineNumbers } from 'codejar-linenumbers';

	export function codedit(node, { code, lang, autofocus = false, loc, ...options }) {
		const highlightBase = (editor) => {
			let code = editor.textContent;
			code = Prism.highlight(code, Prism.languages[lang], lang);
			editor.innerHTML = code;
		};
		const highlight = loc ? withLineNumbers(highlightBase) : highlightBase;

		const editor = CodeJar(node, highlight, options);

		editor.onUpdate((code) => fire(node, 'change', code));

		function update({ code, autofocus = false, loc, ...options }) {
			editor.updateOptions(options);
			editor.updateCode(code);
		}

		update({ code, ...options });

		autofocus && node.focus();

		return {
			update,
			destroy() {
				editor.destroy();
			}
		};
	}

	function fire(el, name, detail) {
		const e = new CustomEvent(name, { detail });
		el.dispatchEvent(e);
	}
</script>

<script>
	export let code = '';
	export let loc = false;
	export let lang;
</script>

<div use:codedit={{ code, lang, loc, $$restProps }} class={$$props.class} />
