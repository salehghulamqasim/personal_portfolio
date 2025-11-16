'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "ab35611625a80efe22095b81a4cb3f53",
"version.json": "2a4bdd3370ee966319e180d97d91e050",
"index.html": "1770b037f3dd1e631597e08650c70402",
"/": "1770b037f3dd1e631597e08650c70402",
"main.dart.js": "4daf2debb854f94d04952f4f598eb55f",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"splash.json": "4c1e8f379c912a4d747eaa4090641df5",
"icons/cat.png": "0d3098d9d0a831c54c17188f8a4faac0",
"icons/saleh.svg": "e69405a3387004eee8e127c44454c671",
"manifest.json": "025328234858113f3cf704096105c8b5",
"assets/web/splash.json": "4c1e8f379c912a4d747eaa4090641df5",
"assets/AssetManifest.json": "785988e1dbf26048ac8f83c22ebc91e2",
"assets/NOTICES": "dd19b77b3463e83a7b80f1051d5c8bef",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "0068b3c5314d3799cee6ccca8e6f9be8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "5cccbf57248aa247fcfed8ad84e0e0a8",
"assets/fonts/MaterialIcons-Regular.otf": "caff6e579fcb5648c2cdc89f65b47354",
"assets/assets/images/MaskedSaleh.webp": "ab0093ec615755750ed4d604823fd4ec",
"assets/assets/project_images/Jidni/jidni6.webp": "2121c00ab13e92b0d8a91eda1590dcca",
"assets/assets/project_images/Jidni/jidni1.webp": "96261b71d387039843fb040c3bcf5fb0",
"assets/assets/project_images/Jidni/jidni2.webp": "52fcb6de059d7afdfcd23096bab650d2",
"assets/assets/project_images/Jidni/jidni3.webp": "176e60185a02e8b18aa89accc457675a",
"assets/assets/project_images/Jidni/jidni4.webp": "505019b5162a33cc9ca2c4c8a3ec6e88",
"assets/assets/project_images/Jidni/jidni5.webp": "b3cee42d57fab9bc2eef258fdec70a6b",
"assets/assets/project_images/Ashwate/2ashwat.webp": "49eb0613d1e50f883c45c0d004a2a69a",
"assets/assets/project_images/Ashwate/3ashwat.webp": "b157909b570f648b8169a8b960111fd7",
"assets/assets/project_images/Ashwate/4ashwat.webp": "b0ef0ac0c8f5441279ae92f3e6940dda",
"assets/assets/project_images/Ashwate/1ashwat.webp": "ffb04f5b9eb380c73919c176166cb887",
"assets/assets/project_images/Plasticless/31.webp": "37e003747ac6cd0ccadf791f4b32bd1d",
"assets/assets/project_images/Plasticless/11.webp": "ef8360aa9e7ec8a0114b96d562d16283",
"assets/assets/project_images/Plasticless/51.webp": "0da8e3d5ee246f8eeb52c9e666c4d8b7",
"assets/assets/project_images/Plasticless/21.webp": "70cc3d9ff20f224d4a72c0e4d7d40df4",
"assets/assets/project_images/Plasticless/61.webp": "f5c9d3f0802be3caa2aa00c50d7c8a4d",
"assets/assets/project_images/Plasticless/41.webp": "f61daf216da40d029b8cdc60cd2d029f",
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
"assets/assets/project_images/mainImage/jidni.webp": "383af155d4d4d56e581f13574ca28cb0",
"assets/assets/project_images/mainImage/wavvy.webp": "8c977d6ab6f3876a4aee110e5c702724",
"assets/assets/project_images/mainImage/plasticless.webp": "1d9f899598e8b760b5dc92f449b52fcd",
"assets/assets/project_images/mainImage/ashwat.webp": "cac1f16fedeb8af1bfb3f12d75a1cae2",
"assets/assets/project_images/mainImage/viva.webp": "479bc7562e16cc553f13aa780fcc782c",
"assets/assets/project_images/mainImage/green.webp": "6f5997626efb88d6bfca7e97843765b7",
"assets/assets/project_images/mainImage/playbaloot.webp": "67663f86829bd61dd86e74c42c701a00",
"assets/assets/project_images/mainImage/beauty.webp": "0c027690f74aa58cefea2b6414457aad",
"assets/assets/project_images/greenproject/1green.webp": "e1c7ea1de5890a88c6d43f27da8e34d9",
"assets/assets/project_images/greenproject/6green.webp": "912d3cf28b0c31ace962f3d12e494227",
"assets/assets/project_images/greenproject/5green.webp": "ad774ee5259480f9baca43af71c713d9",
"assets/assets/project_images/greenproject/3green.webp": "2f756658d7d8b4865c5404b4076e4199",
"assets/assets/project_images/greenproject/4green.webp": "e7f716fc0df1a7ee5b0ce56c3b73be3a",
"assets/assets/project_images/greenproject/2green.webp": "851c566591019d5e93e376f77d2c0346",
"assets/assets/project_images/viva/4viva.webp": "1b5a05fcd8b4928d1460ba780be2c6ed",
"assets/assets/project_images/viva/5viva.webp": "5e63f863eda3feddce9c2ac0336e18ec",
"assets/assets/project_images/viva/3viva.webp": "5781eefa1f8de87103699108b027e981",
"assets/assets/project_images/viva/2viva.webp": "78289bfc3b1c41490d5770573bb91a4a",
"assets/assets/project_images/viva/1viva.webp": "5b21ac2e3eb7800262f0147603436cd2",
"assets/assets/icons/instagram.svg": "8692762090168f350f833341a88b17ba",
"assets/assets/icons/email.svg": "4e2198024595fcf7218cc685e491543c",
"assets/assets/icons/cat.png": "0d3098d9d0a831c54c17188f8a4faac0",
"assets/assets/icons/saleh.svg": "e69405a3387004eee8e127c44454c671",
"assets/assets/icons/linkedin.svg": "031bb92bd1a0b22390fd1595b3a16675",
"assets/assets/splash_screen/cat.json": "4c1e8f379c912a4d747eaa4090641df5",
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
