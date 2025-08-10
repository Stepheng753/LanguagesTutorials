import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
	// Navigate to the initial URL
	await page.goto('https://youtu.be/GKG9g_JGZPc?si=cbn9XEB51YeVpxRi');

	// Wait for the page to load and ensure the video is present
	await page.getByRole('link', { name: 'Youtube' }).click();

	// Assertions to ensure the navigation was successful
	await expect(page).toHaveURL('https://www.youtube.com/');
});
