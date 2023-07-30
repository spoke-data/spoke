/** @type {import('./$types').PageLoad} */
export function load({ params }) {
	return {
		objectStorage: {
			slug: params.slug,
			name: params.slug
		}
	};
}
