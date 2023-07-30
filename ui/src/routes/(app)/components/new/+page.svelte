<script lang="ts">
</script>

<div class="flex items-center gap-2 mb-4">
	<a href="/components" class="h4 font-medium opacity-75">Components</a>
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
			<option value="grafana">Grafana</option>
			<option value="kafka-cluster">Kafka Cluster</option>
			<option value="redpanda-cluster">Redpanda Cluster</option>
			<option value="memphis-cluster">Memphis Cluster</option>
			<option value="qryn-cluster">Qryn Cluster</option>
			<option value="minio-bucket">MinIO Bucket</option>
			<option value="aws-s3-bucket">AWS S3 Bucket</option>
			<option value="gcp-gcs-bucket">GCP GCS Bucket</option>
			<option value="azure-lake-bucket">Azure Lake Bucket</option>
			<option value="r2-bucket">Cloudflare R2 Bucket</option>
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
