const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  use: {
    baseURL: process.env.BASE_URL || 'http://127.0.0.1:4000',
  },
  testMatch: 'tests/**/*.spec.js',
  reporter: 'line',
  workers: 1,
});
