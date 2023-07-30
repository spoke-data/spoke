/** @type {import('./$types').PageLoad} */

export const prerender = false;
export const ssr = false;

export async function load({ fetch }) {
  const res = await fetch('http://localhost:3001/api/v1/sidebar');
  return await res.json();
}
