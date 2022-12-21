/** @type {import('./$types').PageLoad} */
export function load({ params }) {
	return {
		connector: {
			slug: params.slug,
			name: params.slug
		}
	};
}
