import type { Writable } from 'svelte/store';
import { localStorageStore } from '@skeletonlabs/skeleton';

export const isProjectsExpanded: Writable<boolean> = localStorageStore(
	'spoke.isProjectsExpanded',
	true
);

export const isCatalogsExpanded: Writable<boolean> = localStorageStore(
	'spoke.isCatalogsExpanded',
	true
);

export const isObjectStorageExpanded: Writable<boolean> = localStorageStore(
	'spoke.isObjectStorageExpanded',
	false
);

export const isConnectorsExpanded: Writable<boolean> = localStorageStore(
	'spoke.isConnectorsExpanded',
	false
);

export const isComponentsExpanded: Writable<boolean> = localStorageStore(
	'spoke.isComponentsExpanded',
	false
);

export const isTeamsExpanded: Writable<boolean> = localStorageStore('spoke.isTeamsExpanded', false);

export const isOrganizationsExpanded: Writable<boolean> = localStorageStore(
	'spoke.isOrganizationsExpanded',
	false
);
