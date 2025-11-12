'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "a9fd4ed00a006c53edc17af95e534516",
"version.json": "2a4bdd3370ee966319e180d97d91e050",
"index.html": "92937b579938c2c4655127738f0f256b",
"/": "92937b579938c2c4655127738f0f256b",
"main.dart.js": "bb76cbbd1395eca749d1c82bdd6631de",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "dc6043ecaaae9eb5f5d08e51cc7dda60",
"assets/AssetManifest.json": "5602102ab5ac596986774482ed2034f6",
"assets/NOTICES": "03a81b2fcb9d011171d2e1d4c63849d0",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "b63ee12878b0be3f46e96b130fe24402",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f706ddb7d8b22a1c025921df99125561",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/circle.jpg": "1966f379878107e845c5eb07781063cc",
"assets/assets/images/MaskedSaleh.webp": "ab0093ec615755750ed4d604823fd4ec",
"assets/assets/images/yellowInk.jpg": "dd8d20894eddafcba185cd8a58c9b64b",
"assets/assets/images/saleh.png": "2c2eedfe2c0967767c5647d3c57175e1",
"assets/assets/project_images/Ashwate/4.png": "da797bb6446168920cf21a8c1772da77",
"assets/assets/project_images/Ashwate/2.png": "27d59c6db3b1ba41b1d41a1d14166726",
"assets/assets/project_images/Ashwate/3.png": "f742d04aed8a426eb54ee760578bbf6c",
"assets/assets/project_images/Ashwate/1.png": "cf78231f7693a0fc771d9e0d79164ba7",
"assets/assets/project_images/playbaloot_images/8.png": "877330ccbe65a8131e55591713d61414",
"assets/assets/project_images/playbaloot_images/9.png": "2ea51ef39db76c8eda368cd5ebb11bd3",
"assets/assets/project_images/playbaloot_images/4.png": "ecf5e788cb69d81d97f66b2aa10f5089",
"assets/assets/project_images/playbaloot_images/5.png": "1bece6e85acda6773a862350eab1225e",
"assets/assets/project_images/playbaloot_images/7.png": "c2c1bd42d691fdb6591092250e7efa0d",
"assets/assets/project_images/playbaloot_images/6.png": "56cd3eef6148b0e8810e83bfee67fab1",
"assets/assets/project_images/playbaloot_images/2.png": "fe1c2f2e7816e57d57d2b42dd4c8c1c2",
"assets/assets/project_images/playbaloot_images/3.png": "65f129cb1f8cb09c900c6d3da64d5e32",
"assets/assets/project_images/playbaloot_images/1.png": "42e7d57aaab563a831799dfd05c4a06c",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-42-40.png": "ae0373844a662e46fd278ef04904f9b6",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-20-03.png": "dc412eb0f373cc49a373bc8c608457c1",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-46-36.png": "f5dbf3d7683e3fb22b1d9b8c9c5b7b78",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-19-41.png": "73cae07f602efc1aa53f2941ced8a30b",
"assets/assets/project_images/beauty/Screenshot%2520From%25202025-02-18%252022-20-23.png": "0e713452272cc30640aaa437045115ea",
"assets/assets/project_images/wavy/4.png": "b3ad5a8281f28bf256f60c9edbdf58f2",
"assets/assets/project_images/wavy/2.png": "942a8db015a18169a76cb093e3289d35",
"assets/assets/project_images/wavy/3.png": "a89d14e169395fc52802ef4d561ddc62",
"assets/assets/project_images/wavy/1.png": "d10b9738b5a75a8b8adeec000c46fbcc",
"assets/assets/project_images/mainImage/beauty.png": "5743af01653167569d013ea3fc48e808",
"assets/assets/project_images/mainImage/wavvy.png": "7b4f57049bd81b7bba494938aca583d3",
"assets/assets/project_images/mainImage/baloot.png": "a826571d079f0fbb1dc8824dd058c5e2",
"assets/assets/project_images/mainImage/green.png": "c4d5a22714c950b7b13e044124916d45",
"assets/assets/project_images/mainImage/ashwat.png": "ba6a32924dc57a88009d32ad01784d76",
"assets/assets/project_images/mainImage/viva.png": "d735f7628407d9eb225ddd869fb1bf5a",
"assets/assets/project_images/myphotos/IMG_20190605_235356_779.jpg": "46cfa99f638f09bb1f8bad23d5dca1fd",
"assets/assets/project_images/myphotos/224A7676.jpg": "5733578c6cfc489e5a97bf17feb240e6",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-50-36.png": "7f80d8383c4171fa4564054579442f77",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-50-20.png": "8fbe50e888ce874dfe2af4734ed83d59",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-51-15.png": "868741bf386e7a05372476964e329796",
"assets/assets/project_images/greenproject/Screenshot%2520From%25202025-02-18%252022-51-51.png": "0f396de09531e0e2b217685ae60d3dc8",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-36-26.png": "d66c1ba144906029e1def13e35b472c8",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-36-43.png": "ecbdd94e1d8b61f91d7072d43c710ef4",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-36-56.png": "edd7ac040346d884285f2b4a3afae20d",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-39-35.png": "8b10d6643d330da2b9a1c822324288e3",
"assets/assets/project_images/viva/Screenshot%2520From%25202025-02-18%252021-36-12.png": "fbae8e69a5f2ac123ebb5b2ceceaf284",
"assets/assets/icons/saudi-arabia.png": "c81b22802da2b0f2d79452c15098ddb3",
"assets/assets/icons/instagram.svg": "8692762090168f350f833341a88b17ba",
"assets/assets/icons/email.svg": "4e2198024595fcf7218cc685e491543c",
"assets/assets/icons/united-kingdom.png": "aac0dfefc080856931658ea9c760534e",
"assets/assets/icons/pakistan.png": "efeef2f9da30878a7c3545e62c86bc4b",
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
