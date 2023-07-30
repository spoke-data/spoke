import { join } from 'path';
import forms from '@tailwindcss/forms';
import typography from '@tailwindcss/typography';
import skeleton from '@skeletonlabs/skeleton/tailwind/skeleton.cjs';

/** @type {import('tailwindcss').Config} */
module.exports = {
	darkMode: 'class',
	content: [
		'./src/**/*.{html,js,svelte,ts}',
		join(require.resolve('@skeletonlabs/skeleton'), '../**/*.{html,js,svelte,ts}')
	],
	theme: {
		extend: {},
		screens: {
			sm: '640px',
			// => @media (min-width: 640px) { ... }

			md: '768px',
			// => @media (min-width: 768px) { ... }

			lg: '1024px',
			// => @media (min-width: 1024px) { ... }

			xl: '1280px',
			// => @media (min-width: 1280px) { ... }

			'2xl': '1536px',
			// => @media (min-width: 1536px) { ... }

			'3xl': '1842px',
			// => @media (min-width: 1842px) { ... }

			'4xl': '2210px'
			// => @media (min-width: 2210px) { ... }
		},
		fontSize: {
			xs: ['0.625rem', '1rem'],
			sm: ['0.75rem', '1rem'],
			base: ['0.875rem', '1.25rem'],
			lg: ['1rem', '1.5rem'],
			xl: ['1.125rem', '1.75rem'],
			'2xl': ['1.25rem', '1.75rem'],
			'3xl': ['1.5rem', '2rem'],
			'4xl': ['1.875rem', '2.25rem'],
			'5xl': ['2.25rem', '1'],
			'6xl': ['3rem', '1'],
			'7xl': ['3.75rem', '1'],
			'8xl': ['4.5rem', '1'],
			'9xl': ['6rem', '1']
		}
	},
	plugins: [forms, typography, ...skeleton()]
};
