/** @type {import('./$types').PageLoad} */

import { redirect } from '@sveltejs/kit';

export const prerender = false;
export const ssr = false;

export function load() {
	throw redirect(307, `/notebooks/a`);
}
