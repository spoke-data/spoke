import type { Writable } from 'svelte/store';
import { localStorageStore } from '@skeletonlabs/skeleton';

export const requestQueue: Writable<object[]> = localStorageStore('spoke.requestQueue', []);
