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
  }
}

module.exports = nextConfig
