export function load() {
	return {
		environments: [
			{
				name: 'Production',
				slug: 'production',
				projects: [
					{ name: 'Fantasy Sportsball', slug: 'fantasy-sportsball' },
					{ name: 'Database ETL', slug: 'database-etl' }
				]
			},
			{
				name: 'Development',
				slug: 'development',
				projects: [
					{ name: 'Fantasy Sportsball', slug: 'fantasy-sportsball' },
					{ name: 'Database ETL', slug: 'database-etl' },
					{ name: 'Memphis/Debezium CDC Replication', slug: 'memphis-debezium-cdc-replication' },
					{ name: 'Learned Replication', slug: 'learned-replication' }
				]
			},
			{
				name: 'Local',
				slug: 'local',
				projects: [
					{ name: 'Fantasy Sportsball', slug: 'fantasy-sportsball' },
					{ name: 'AI Movie Recommendations', slug: 'ai-movie-recommendations' },
					{ name: 'Stock Forecasting', slug: 'stock-forecasting' },
					{ name: 'NFT Pricing', slug: 'nft-pricing' },
					{ name: 'Database ETL', slug: 'database-etl' },
					{ name: 'Kafka/Debezium CDC Replication', slug: 'kafka-debezium-cdc-replication' },
					{ name: 'Memphis/Debezium CDC Replication', slug: 'memphis-debezium-cdc-replication' },
					{ name: 'Learned Replication', slug: 'learned-replication' }
				]
			},
			{
				name: 'Research',
				slug: 'research',
				projects: [
					{ name: 'Fantasy Sportsball', slug: 'fantasy-sportsball' },
					{ name: 'Learned Replication', slug: 'learned-replication' }
				]
			}
		]
	};
}
