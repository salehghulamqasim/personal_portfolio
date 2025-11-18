/**
 * Cloudflare Pages Middleware for SEO Bot Detection
 * 
 * This middleware detects search engine bots and serves optimized static HTML
 * with meta tags for better SEO indexing. Regular users get the full Flutter app.
 * 
 * IMPORTANT: Replace YOUR-DOMAIN.com with your actual domain before deploying.
 */

// List of known search engine user agents
const SEARCH_ENGINE_BOTS = [
  'googlebot',
  'bingbot',
  'slurp', // Yahoo
  'duckduckbot',
  'baiduspider',
  'yandexbot',
  'sogou',
  'exabot',
  'facebot', // Facebook
  'ia_archiver', // Internet Archive
  'twitterbot',
  'linkedinbot',
  'whatsapp',
  'applebot',
  'facebookexternalhit',
  'rogerbot',
  'semrushbot',
  'ahrefsbot',
  'mj12bot',
  'dotbot',
];

/**
 * Check if the request is from a search engine bot
 */
function isSearchEngineBot(userAgent) {
  if (!userAgent) return false;
  const ua = userAgent.toLowerCase();
  return SEARCH_ENGINE_BOTS.some(bot => ua.includes(bot));
}

/**
 * Generate SEO-optimized HTML for bots
 */
function generateSEOHTML(path) {
  const baseUrl = 'https://YOUR-DOMAIN.com';
  const fullUrl = `${baseUrl}${path === '/' ? '' : path}`;
  
  // Determine page-specific meta tags
  let title = 'Saleh Ghulam - Software Developer | Flutter & Mobile Development Expert';
  let description = 'Experienced Software Developer and Flutter expert based in Jeddah. Specializing in mobile app development, UI/UX design, and full-stack solutions.';
  
  switch (path) {
    case '/about':
      title = 'About Me - Saleh Ghulam | Software Developer';
      description = 'Learn about Saleh Ghulam, an experienced Software Developer and Flutter expert based in Jeddah. Professional background, skills, and expertise.';
      break;
    case '/experience_education':
      title = 'Experience & Education - Saleh Ghulam';
      description = 'Professional experience and educational background of Saleh Ghulam, Software Developer and Flutter expert.';
      break;
    case '/contact':
      title = 'Contact - Saleh Ghulam | Get In Touch';
      description = 'Contact Saleh Ghulam, Software Developer and Flutter expert. Available for freelance projects and collaborations.';
      break;
    case '/projects':
      title = 'Projects - Saleh Ghulam | Portfolio Showcase';
      description = 'Explore innovative projects by Saleh Ghulam including Flutter apps, web applications, and UI/UX designs.';
      break;
  }
  
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Primary SEO Meta Tags -->
  <title>${title}</title>
  <meta name="title" content="${title}">
  <meta name="description" content="${description}">
  <meta name="keywords" content="Flutter, Dart, Mobile Development, Web Development, Software Developer, Jeddah Developer, IT, Software Engineer, Tech Lead, UI-UX">
  <meta name="author" content="Saleh Ghulam">
  <meta name="robots" content="index, follow">
  
  <!-- Open Graph / Facebook -->
  <meta property="og:type" content="website">
  <meta property="og:url" content="${fullUrl}">
  <meta property="og:title" content="${title}">
  <meta property="og:description" content="${description}">
  <meta property="og:image" content="${baseUrl}/assets/images/MaskedSaleh.webp">
  <meta property="og:site_name" content="Saleh Ghulam Portfolio">
  
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:url" content="${fullUrl}">
  <meta name="twitter:title" content="${title}">
  <meta name="twitter:description" content="${description}">
  <meta name="twitter:image" content="${baseUrl}/assets/images/MaskedSaleh.webp">
  
  <!-- Canonical URL -->
  <link rel="canonical" href="${fullUrl}">
  
  <!-- JSON-LD Structured Data -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Person",
    "name": "Saleh Ghulam",
    "jobTitle": "Software Developer",
    "description": "Experienced Software Developer and Flutter expert specializing in mobile app development, UI/UX design, and full-stack solutions.",
    "email": "SalehTheCoder@gmail.com",
    "url": "${baseUrl}",
    "image": "${baseUrl}/assets/images/MaskedSaleh.webp",
    "sameAs": [
      "https://github.com/salehghulamqasim",
      "https://www.linkedin.com/in/saleh-ghulam"
    ]
  }
  </script>
  
  <!-- Redirect to full app after a short delay -->
  <meta http-equiv="refresh" content="0; url=${fullUrl}">
  <script>window.location.href = "${fullUrl}";</script>
</head>
<body>
  <p>Loading portfolio...</p>
  <script>window.location.href = "${fullUrl}";</script>
</body>
</html>`;
}

/**
 * Cloudflare Pages Middleware
 */
export async function onRequest(context) {
  const request = context.request;
  const userAgent = request.headers.get('user-agent') || '';
  
  // Check if it's a search engine bot
  if (isSearchEngineBot(userAgent)) {
    const url = new URL(request.url);
    const path = url.pathname;
    
    // Serve SEO-optimized HTML for bots
    return new Response(generateSEOHTML(path), {
      headers: {
        'Content-Type': 'text/html; charset=UTF-8',
        'Cache-Control': 'public, max-age=3600',
      },
    });
  }
  
  // For regular users, continue with normal request
  return context.next();
}

