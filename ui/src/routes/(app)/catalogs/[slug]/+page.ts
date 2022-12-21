/** @type {import('./$types').PageLoad} */
export function load({ params }) {
	return {
		catalog: {
			slug: params.slug,
			name: params.slug
		}
	};
}
