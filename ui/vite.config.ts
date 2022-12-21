import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vitest/config';

const port = (process.env.PORT && parseInt(process.env.PORT, 10)) || 3000;

export default defineConfig({
	plugins: [sveltekit()],
	test: {
		include: ['src/**/*.{test,spec}.{js,ts}']
	},
	server: {
		port: port
	}
});
