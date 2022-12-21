/** @type {import('./$types').PageLoad} */
export function load({ params }) {
	return {
		storage: {
			slug: params.slug,
			name: params.slug
		}
	};
}
