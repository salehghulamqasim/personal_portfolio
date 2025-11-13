'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "fbe97af8e411cee0ba87446c7c2b9c4d",
"version.json": "2a4bdd3370ee966319e180d97d91e050",
"index.html": "92937b579938c2c4655127738f0f256b",
"/": "92937b579938c2c4655127738f0f256b",
"main.dart.js": "a18e4fa603c3b5521066bc4cc0cbde4c",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "dc6043ecaaae9eb5f5d08e51cc7dda60",
"assets/AssetManifest.json": "1d98e138eaedf2b25740dff896c7f3f6",
"assets/NOTICES": "de7117a55c0f43303c80eaaa68e8ae0a",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "038976a9651bc48776f971e6c0e765ba",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c4d7879ad5898623572e22aa921b7fb8",
"assets/fonts/MaterialIcons-Regular.otf": "caff6e579fcb5648c2cdc89f65b47354",
"assets/assets/images/circle.jpg": "1966f379878107e845c5eb07781063cc",
"assets/assets/images/MaskedSaleh.webp": "ab0093ec615755750ed4d604823fd4ec",
"assets/assets/images/yellowInk.jpg": "8f5ea39d858f79e98a4f030ff56b21d1",
"assets/assets/images/circle_optimized_.webp": "b0fcdd16181e857b75c31c1df0256a9b",
"assets/assets/images/saleh.png": "2c2eedfe2c0967767c5647d3c57175e1",
"assets/assets/project_images/Ashwate/2_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-Ashwate-.webp": "986627e421fda619da00b2437a0b29c3",
"assets/assets/project_images/Ashwate/4_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-Ashwate-.webp": "fe8b4d85fbbdd26dd9ab27e5bbc18086",
"assets/assets/project_images/Ashwate/1_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-Ashwate-.webp": "7bb186fb3ac22b98be876856df938fc7",
"assets/assets/project_images/Ashwate/3_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-Ashwate-.webp": "63cc78b535c83bd6c9f6c5320bb870d9",
"assets/assets/project_images/playbaloot_images/80.webp": "a6926db1483923369b3c7a86e6e01da4",
"assets/assets/project_images/playbaloot_images/70.webp": "9fb122f73383ddad1de423225e11bc46",
"assets/assets/project_images/playbaloot_images/50.webp": "49c83cdc64bc81669aef2fbffc262932",
"assets/assets/project_images/playbaloot_images/10.webp": "ef05be35d06a1bc4533bac1a1bf49c21",
"assets/assets/project_images/playbaloot_images/30.webp": "6e6e0045699cfa5926bdb7ddcb1d0cf8",
"assets/assets/project_images/playbaloot_images/40.webp": "ce9f19f1d0006da127581e60d1a4f52b",
"assets/assets/project_images/playbaloot_images/60.webp": "7035963c267ab5fddeed96fa537ef95e",
"assets/assets/project_images/playbaloot_images/20.webp": "3a985b81a0819b52ec0f086532f8e913",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-19-41_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp": "e53dddc9e1e0a8c4eaace158379ee6a5",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-20-03_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp": "6448d29db5aad55626d09db05526ff88",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-20-23_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp": "404da34ad36f1e3329074bbee4faa6d1",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-42-40_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp": "c3b9b3081a6724c8e2cf38056370cbd4",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-46-36_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp": "074e629b872411c510c1a0f0c1e83b8f",
"assets/assets/project_images/wavy/3_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp": "6f7d311448b280d4ba6f4e561257f9da",
"assets/assets/project_images/wavy/1_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp": "9980cc08fae9d48405736ef9d60c224f",
"assets/assets/project_images/wavy/4_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp": "aa27cae578f7618541f685d5bd06e907",
"assets/assets/project_images/wavy/2_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp": "d036bbeeb9ee7eaa6266d985beefde13",
"assets/assets/project_images/mainImage/wavvy.webp": "8c977d6ab6f3876a4aee110e5c702724",
"assets/assets/project_images/mainImage/ashwat.webp": "cac1f16fedeb8af1bfb3f12d75a1cae2",
"assets/assets/project_images/mainImage/viva.webp": "479bc7562e16cc553f13aa780fcc782c",
"assets/assets/project_images/mainImage/green.webp": "6f5997626efb88d6bfca7e97843765b7",
"assets/assets/project_images/mainImage/playbaloot.webp": "67663f86829bd61dd86e74c42c701a00",
"assets/assets/project_images/mainImage/beauty.webp": "0c027690f74aa58cefea2b6414457aad",
"assets/assets/project_images/myphotos/IMG_20190605_235356_779_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-myphotos-.webp": "4eef9025d45b47728adcc263c3d850e0",
"assets/assets/project_images/myphotos/224A7676_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-myphotos-.webp": "072b553c1981511dc764a60aac2ca318",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-50-36.png": "089926d37847d56839afa575435cb103",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-50-20.png": "d669f3b8603711f4024e10a721b8d011",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-51-15.png": "5cba6e847ed6a92445034d745a7603f8",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-51-51_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-greenproject-.webp": "bd19c2d5b68a78b86c60fbe65360982b",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-51-15_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-greenproject-.webp": "711a2fb84271da50848b5f56624cc94e",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-50-36_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-greenproject-.webp": "235ea6d3579a24b7136f7e2e6d713df9",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-51-51.png": "53fd19dada9556dadc2f33212eae5bf8",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-50-20_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-greenproject-.webp": "ad006c0aea885a8c3d5492a48229d2f5",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-36-56_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-viva-.webp": "7139056f0962e24b645cb0d33a45e0b2",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-36-26_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-viva-.webp": "205ac54205e9c75d2fb5dde36358cf73",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-36-12_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-viva-.webp": "77791ee747566ede51513bd4f9e94b98",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-39-35_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-viva-.webp": "fefce15d8b6812e11d9a8a74d244a8e5",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-36-43_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-viva-.webp": "4a5a9e86f92f9c4422aa30f5d17014b0",
"assets/assets/icons/instagram.svg": "8692762090168f350f833341a88b17ba",
"assets/assets/icons/email.svg": "4e2198024595fcf7218cc685e491543c",
"assets/assets/icons/linkedin.svg": "031bb92bd1a0b22390fd1595b3a16675",
"assets/assets/splash_screen/Gradient_blob.lottie": "1af1eecd17a0ad40e0d785224d5607ed",
"assets/assets/splash_screen/Gradient_blob.json": "ec1fcbceeae6337a2a1f7729ec272eec",
"assets/assets/splash_screen/15450-29175-splash-screen-bouncing-ball.riv": "b2a8181dbdd62a7ad8894a07d2c28d6c",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
