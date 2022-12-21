export function load() {
	return {
		requests: [
			{
				id: 'abc123',
				type: 'provision-aws-s3-bucket',
				detail: 'David wants to provision a new AWS S3 bucket'
			}
		],
		activeProjects: [
			{
				name: 'Database ETL',
				slug: 'database-etl'
			}
		],
		recommendedProjects: [
			{
				name: 'Learned Replication',
				slug: 'learned-replication'
			}
		]
	};
}
