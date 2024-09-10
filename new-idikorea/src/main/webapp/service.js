/*self.addEventListener('install', event => {
    console.log('Service Worker installing.');
});

self.addEventListener('activate', event => {
    console.log('Service Worker activating.');
});
console.log("service")
self.addEventListener('fetch', event => {
	console.log("wejrfejlkgfjedkl")
    console.log('Fetch event for ', event.request.url);
    event.respondWith(
        fetch(event.request).catch(error => {
            console.error('Fetching failed:', error);
            return new Response('Error fetching data', { status: 408 });
        })
    );
});*/