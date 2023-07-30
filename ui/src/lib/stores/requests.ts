import { writable } from 'svelte/store';
type State = {
	requests: Array<Request>;
};

export const state = writable<State>({
	requests: []
});
// export const connect = () => {
//   // Create a new websocket
//   const ws = new WebSocket("ws://example.com");
//   ws.addEventListener("message", (message: any) => {
//     // Parse the incoming message here
//     const data: Request = JSON.parse(message.data);
//     // Update the state.  That's literally it.  This can happen from anywhere:
//     // we're not in a component, and there's no nested context.
//     state.update((state) => ({
//       ...state,
//       requests: [data].concat(state.requests),
//     }));
//   });
// };

export function addRequest(request: Request) {
	state.update((state) => ({
		...state,
		requests: [...state.requests, request]
	}));
}
