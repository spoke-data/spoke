<script lang="ts">
</script>

<div class="flex items-center gap-2 mb-4">
	<a href="/models" class="h4 font-medium opacity-75">Models</a>
	<span class="text-xl text-surface-300 font-medium">/</span>
	<h1 class="h4">New</h1>
</div>
<hr class="!border-t-2" />

<div class="flex flex-col gap-4 mt-8">
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Model</span>
		<select class="select w-[400px]">
			<option value="abc123">Local</option>
			<option value="xyz123">Remote</option>
		</select>
	</label>
	<label class="label">
		<span class="inline-block w-[100px] font-bold">Source</span>
		<select class="select w-[400px]">
			<option value="">(Select One)</option>
			<option value="minio">Hugging Face</option>
			<option value="minio">Minio</option>
			<option value="s3">S3</option>
			<option value="gcs">GCS</option>
			<option value="azure-lake-storage">Azure Lake Storage</option>
			<option value="r2">R2</option>
		</select>
	</label>
	<button type="button" class="btn variant-filled mt-4 w-[100px]">Create</button>
</div>
