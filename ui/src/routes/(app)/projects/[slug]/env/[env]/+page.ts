/** @type {import('./$types').PageLoad} */
export function load({ params }) {
	return {
		project: {
			slug: params.slug,
			name: params.slug
		},
		environment: {
			name: params.env,
			slug: params.env
		}
	};
}
