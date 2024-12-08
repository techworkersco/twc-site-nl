/**
 * @type {import('next').NextConfig}
 */

const nextConfig = {
  distDir: 'build',
  // Static render/export the site
  output: 'export',
  // We don't optimize images since we're using SSG without server hosting
  images: {
    unoptimized: true  
  },
  publicRuntimeConfig: {
    baseUrl: process.env.BASE_URL || 'http://localhost:3000',
  },
  i18n: {
    locales: ['en', 'nl'],
    defaultLocale: 'en'
  },
}

module.exports = nextConfig
