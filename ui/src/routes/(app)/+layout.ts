export function load() {
	return {
		projects: [
			{ name: 'Fantasy Sportsball', slug: 'fantasy-sportsball' },
			{ name: 'AI Movie Recommendations', slug: 'ai-movie-recommendations' },
			{ name: 'Stock Forecasting', slug: 'stock-forecasting' },
			{ name: 'NFT Pricing', slug: 'nft-pricing' },
			{ name: 'Database ETL', slug: 'database-etl' },
			{ name: 'Kafka/Debezium CDC Replication', slug: 'kafka-debezium-cdc-replication' },
			{ name: 'Learned Replication', slug: 'learned-replication' }
		],
		catalogs: [
			{ name: 'Postgres', slug: 'postgres' },
			{ name: 'MariaDB', slug: 'mariadb' },
			{ name: 'AWS Bucket 1', slug: 'aws-bucket-1' },
			{ name: 'GCP Bucket 1', slug: 'gcp-bucket-1' },
			{ name: 'Azure Bucket 1', slug: 'azure-bucket-1' },
			{ name: 'Kafka Cluster', slug: 'kafka-cluster' },
			{ name: 'FTP', slug: 'ftp' },
			{ name: 'SFTP', slug: 'sftp' },
			{ name: 'MotherDuck', slug: 'mother-duck' },
			{ name: 'Spoke', slug: 'spoke' }
		],
		storage: [
			{ name: 'MinIO', slug: 'minio' },
			{ name: 'AWS Lake 1', slug: 'aws-lake-1' },
			{ name: 'GCP Lake 1', slug: 'gcp-lake-1' },
			{ name: 'Azuke Lake 1', slug: 'azure-lake-1' },
			{ name: 'R2 Lake 1', slug: 'r2-lake-1' }
		],
		connectors: [
			{ name: 'OpenSea HTTP Source', slug: 'open-sea-http-source' },
			{ name: 'MLB HTTP Source', slug: 'mlb-http-source' },
			{ name: 'NFL HTTP Source', slug: 'nfl-http-source' },
			{ name: 'NBA HTTP Source', slug: 'nba-http-source' },
			{ name: 'IMDB HTTP Source', slug: 'imdb-http-source' },
			{ name: 'Posgres Sink', slug: 'postgres-sink' },
			{ name: 'MariaDB Sink', slug: 'mariadb-sink' }
		],
		components: [
			{ name: 'Grafana', uri: 'http://localhost:3002' },
			{ name: 'Redpanda Console', uri: 'http://localhost:9200' },
			{ name: 'Debezium Console', uri: 'http://localhost:9300' },
			{ name: 'Qryn Console', uri: 'http://localhost:9400' },
			{ name: 'MinIO Console', uri: 'http://localhost:9001' },
			{ name: 'AWS S3 Console', uri: 'https://aws.amazon.com/s3/' },
			{ name: 'GCP GCS Console', uri: 'https://console.cloud.google.com/storage' },
			{
				name: 'Azure Lake Storage',
				uri: 'https://azure.microsoft.com/en-us/products/storage/data-lake-storage'
			},
			{ name: 'Cloudflare R2', uri: 'https://developers.cloudflare.com/r2/' },
			{ name: 'Spoke Cloud', uri: 'https://www.spoke.sh/cloud' }
		],
		teams: [{ organization: 'Spoke', name: 'Core', uri: 'https://www.spoke.sh/teams/spoke/core' }],
		organizations: [
			{ name: 'Personal', slug: 'personal' },
			{ name: 'Spoke', slug: 'spoke' }
		]
	};
}
