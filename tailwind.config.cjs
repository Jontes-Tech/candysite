/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {
			colors: {
				background: "#26292d",
				card: "#202429",
				primary: "#9ecaff",
				modal: "#282f36"
			},
			fontFamily: {
				pixel: ["VT323", "monospace"]
			}
		},
	},
	plugins: [],
}
