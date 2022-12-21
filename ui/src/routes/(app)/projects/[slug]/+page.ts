/** @type {import('./$types').PageLoad} */
export function load({ params }) {
	return {
		project: {
			slug: params.slug,
			name: params.slug,
			environments: [
				{
					name: 'Production',
					slug: 'production'
				},
				{
					name: 'Development',
					slug: 'development'
				},
				{
					name: 'Local',
					slug: 'local'
				}
			]
		}
	};
}
