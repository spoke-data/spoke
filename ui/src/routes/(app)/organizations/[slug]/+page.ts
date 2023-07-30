/** @type {import('./$types').PageLoad} */
export function load({ params }) {
	return {
		organization: {
			slug: params.slug,
			name: params.slug
		}
	};
}
