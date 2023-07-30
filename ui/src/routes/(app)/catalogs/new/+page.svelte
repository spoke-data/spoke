<script lang="ts">
</script>

<div class="flex items-center gap-2 mb-4">
	<a href="/catalogs" class="h4 font-medium opacity-75">Catalogs</a>
	<span class="text-xl text-surface-300 font-medium">/</span>
	<h1 class="h4">New</h1>
</div>
<hr class="!border-t-2" />

<div class="flex flex-col gap-4 mt-8">
	<label class="label">
		<span class="inline-block w-[70px] font-bold">Cluster</span>
		<select class="select w-[400px]">
			<option value="abc123">Local</option>
			<option value="xyz123">Remote</option>
		</select>
	</label>
	<label class="label">
		<span class="inline-block w-[70px] font-bold">Type</span>
		<select class="select w-[400px]">
			<option value="">(Select One)</option>
			<option value="postgres">Postgres</option>
			<option value="mariadb">MariaDB</option>
			<option value="mysql">MySQL</option>
			<option value="db2">Db2</option>
			<option value="oracle">Oracle</option>
			<option value="mssql">MSSQL</option>
			<option value="snowflake">Snowflake</option>
			<option value="bigquery">BigQuery</option>
			<option value="duckdb">DuckDB</option>
			<option value="sqlite">SQLite</option>
			<option value="kafka-redpanda">Kafka / Redpanda</option>
			<option value="kafka-memphis">Memphis</option>
			<option value="ftp">FTP</option>
			<option value="sftp">SFTP</option>
			<option value="motherduck">MotherDuck</option>
			<option value="minio">MinIO</option>
			<option value="s3">S3</option>
			<option value="gcs">GCS</option>
			<option value="azure-lake-storage">Azure Lake Storage</option>
		</select>
	</label>
	<label class="label">
		<span class="inline-block w-[70px] font-bold">Name</span>
		<input type="text" class="input w-[500px]" />
	</label>
	<label class="label">
		<span class="inline-block w-[70px] font-bold">Slug</span>
		<input type="text" class="input w-[500px]" />
	</label>
	<button type="button" class="btn variant-filled mt-4 w-[100px]">Create</button>
</div>
