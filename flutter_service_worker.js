'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "edb2de1d05d39a1d4ffb1981634b9bca",
"index.html": "ecb09a232b048262a18de6bfe02ab44e",
"/": "ecb09a232b048262a18de6bfe02ab44e",
"igor_image.png": "7cb0ee5bbef52ad0db4169eaf8044ade",
"main.dart.js": "c0ab8c524358b10e3036dad22de6be9f",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "e3aaf59ca836e45ab24c200e16cd970c",
"icons/favicon-16x16.png": "c3464772ea00b456827f7fe7a41864f4",
"icons/favicon.ico": "43e37dfd1481be64d67f9675db2ea655",
"icons/apple-icon.png": "8b96c5a5b9e475fee5c0d00e4bb9d2fb",
"icons/apple-icon-144x144.png": "45c2c5cd3c98f7765077d5344caa7a21",
"icons/android-icon-192x192.png": "db7a0cfd0a7d7c6147cbee01c042a17b",
"icons/apple-icon-precomposed.png": "8b96c5a5b9e475fee5c0d00e4bb9d2fb",
"icons/apple-icon-114x114.png": "7f3a85bf4c93cc5b0fc55b5e42da20dd",
"icons/ms-icon-310x310.png": "9a4bf50205a2b5b35f22ced1d1d44192",
"icons/ms-icon-144x144.png": "45c2c5cd3c98f7765077d5344caa7a21",
"icons/apple-icon-57x57.png": "2ad3716945a78f644ea38dc11c46782b",
"icons/apple-icon-152x152.png": "da1bc1dfac3a71524ebce5d4e61d3219",
"icons/ms-icon-150x150.png": "38fe69e651295b0641633187d6a6b3d1",
"icons/android-icon-72x72.png": "550b08ef0c055318c3d3ea486caf1fe3",
"icons/android-icon-96x96.png": "1751c3a718adedd69d5d024492a531a6",
"icons/android-icon-36x36.png": "5ca624ede6139b680da1b5a292a526db",
"icons/apple-icon-180x180.png": "a3ae6ae00eac63b3bb74cd97b97da73c",
"icons/favicon-96x96.png": "1751c3a718adedd69d5d024492a531a6",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/android-icon-48x48.png": "720544f3891ff62dff873caea6ec40ba",
"icons/apple-icon-76x76.png": "a625a4a84102cd538cfeeb141a31749c",
"icons/apple-icon-60x60.png": "540713729197d9a390f5778e55682c63",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-144x144.png": "45c2c5cd3c98f7765077d5344caa7a21",
"icons/apple-icon-72x72.png": "550b08ef0c055318c3d3ea486caf1fe3",
"icons/apple-icon-120x120.png": "c5a25adb3c4ea96e6b73e279a5b4c6bc",
"icons/favicon-32x32.png": "bd2701705f921f58a34782b9a348c285",
"icons/ms-icon-70x70.png": "f9090fd599e0898857c9df3734ddc978",
"manifest.json": "6108a1b5e2d6c409bcdd0e9a759c112c",
"assets/art/igor_image.png": "7cb0ee5bbef52ad0db4169eaf8044ade",
"assets/art/flutter_bird_icon.png": "94b8139a9f1f2c226184af4106495c66",
"assets/art/solo_star.json": "facf50aa899fd402e1ccb6b377946699",
"assets/art/how_i_can_help_you_print.png": "41629f226dc39d3260de7573f4f7449c",
"assets/art/five_star_animation.json": "73dcfbb4479fa536b5f60c2c6b0e001e",
"assets/art/lighting_mode.json": "9eee1f3262afc13f236d63ec3becd9c4",
"assets/art/star.json": "a62f5bb327ec4bfa621d1be8108761ae",
"assets/AssetManifest.json": "ac9dc6aaf847d3547377e71e12f86fcf",
"assets/NOTICES": "1654b79fe913938fac1db18fbe533e34",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "54b3a122cbc8eebf1be85a8779fea833",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "4d2b981ea1a7674dac70b6b244a73104",
"assets/fonts/MaterialIcons-Regular.otf": "6d5c1deb7d9fac3ea465540e0b717b85",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
