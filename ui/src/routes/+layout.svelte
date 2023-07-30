<script lang="ts">
	import '../theme.postcss';
	import '@skeletonlabs/skeleton/styles/skeleton.css';
	import '../app.postcss';
	import Prism from 'prismjs';
	import 'prismjs/components/prism-sql';
	import 'prismjs/components/prism-python';
	// import 'prismjs/themes/prism-okaidia.css';
	import 'prismjs/themes/prism-solarizedlight.css';
	import 'codejar-linenumbers/es/codejar-linenumbers.css';
	import { computePosition, autoUpdate, offset, shift, flip, arrow } from '@floating-ui/dom';
	import { storePopup } from '@skeletonlabs/skeleton';

	storePopup.set({ computePosition, autoUpdate, offset, shift, flip, arrow });
</script>

<slot />
