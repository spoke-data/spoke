import type { Writable } from 'svelte/store';
import { localStorageStore } from '@skeletonlabs/skeleton';

export const teamsEnabled: Writable<boolean> = localStorageStore(
	'spoke.features.teamsEnabled',
	true
);

export const organizationsEnabled: Writable<boolean> = localStorageStore(
	'spoke.features.organizationsEnabled',
	true
);

export const replicationEnabled: Writable<boolean> = localStorageStore(
	'spoke.features.replicationEnabled',
	true
);

export const labsEnabled: Writable<boolean> = localStorageStore(
	'spoke.features.labsEnabled',
	true
);

export const modelsEnabled: Writable<boolean> = localStorageStore(
	'spoke.features.modelsEnabled',
	true
);
