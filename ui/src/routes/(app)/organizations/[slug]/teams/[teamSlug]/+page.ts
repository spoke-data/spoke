/** @type {import('./$types').PageLoad} */
export function load({ params }) {
	return {
		team: {
			slug: params.teamSlug,
			name: params.teamSlug,
			organization: {
				slug: params.slug,
				name: params.slug
			}
		}
	};
}
