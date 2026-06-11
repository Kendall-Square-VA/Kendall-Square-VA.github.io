const { test, expect } = require('@playwright/test');

const pages = [
  '/',
  '/location/',
  '/updates/',
  '/hoa/',
  '/forum/',
  '/calendar/'
];

test.describe('site smoke tests', () => {
  for (const path of pages) {
    test(`page loads: ${path}`, async ({ page, baseURL }) => {
      const response = await page.goto(`${baseURL}${path}`);
      expect(response && response.ok()).toBeTruthy();
      await expect(page.locator('body')).toBeVisible();
    });
  }

  test('main navigation links are reachable from home', async ({ page, baseURL }) => {
    await page.goto(`${baseURL}/`);

    const navLinks = [
      { text: 'Home', href: '/' },
      { text: 'Location', href: '/location' },
      { text: 'Updates', href: '/updates' },
      { text: 'HOA', href: '/hoa' },
      { text: 'Forums', href: '/forum' },
      { text: 'Calendar', href: '/calendar' }
    ];

    for (const link of navLinks) {
      const locator = page.locator(`#menu a:has-text("${link.text}")`).first();
      await expect(locator).toBeVisible();
      await expect(locator).toHaveAttribute('href', link.href);
    }
  });
});
