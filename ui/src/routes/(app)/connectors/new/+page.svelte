<script lang="ts">
</script>

<div class="flex items-center gap-2 mb-4">
	<a href="/connectors" class="h4 font-medium opacity-75">Connectors</a>
	<span class="text-xl text-surface-300 font-medium">/</span>
	<h1 class="h4">New</h1>
</div>
<hr class="!border-t-2" />

<div class="flex flex-col gap-4 mt-8">
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Cluster</span>
		<select class="select w-[400px]">
			<option value="abc123">Local</option>
			<option value="xyz123">Remote</option>
		</select>
	</label>
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Type</span>
		<select class="select w-[400px]">
			<option value="">(Select One)</option>
			<option value="http">HTTP</option>
			<option value="websocket">WebSocket</option>
			<option value="webhook">Webhook</option>
			<option value="odbc">ODBC</option>
			<option value="adbc">ADBC</option>
			<option value="debezium-source">Debezium Source</option>
			<option value="debezium-sink">Debezium Sink</option>
			<option value="kafka-source">Kafka Source</option>
			<option value="kafka-sink">Kafka Sink</option>
			<option value="memphis-source">Memphis Source</option>
			<option value="memphis-sink">Memphis Sink</option>
			<option value="ftp-source">FTP Source</option>
			<option value="ftp-sink">FTP Sink</option>
			<option value="sftp-source">SFTP Source</option>
			<option value="sftp-sink">SFTP Sink</option>
			<option value="s3-source">S3 Source</option>
			<option value="s3-sink">S3 Sink</option>
			<option value="gcs-source">GCS Source</option>
			<option value="gcs-sink">GCS Sink</option>
			<option value="azure-lake-source">Azure Lake Source</option>
			<option value="azure-lake-sink">Azure Lake Sink</option>
		</select>
	</label>
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Name</span>
		<input type="text" class="input w-[500px]" />
	</label>
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Slug</span>
		<input type="text" class="input w-[500px]" />
	</label>
	<button type="button" class="btn variant-filled mt-4 w-[100px]">Create</button>
</div>
