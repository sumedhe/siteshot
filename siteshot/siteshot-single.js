// Open with phantomjs
// $ phantomjs siteshot.js http://google.com

var system = require('system');

// Create page
var page = require('webpage').create();

// Set browser size
page.viewportSize = { width: 1600, height : 1200 };

// Set user agent settings
page.settings.userAgent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36";

var url = system.args[1];
var filename = system.args[2];
// var file = 'output/' + url.replace('http://', '').replace('https://', '').replace('/', '_') + '.png';
var file = 'output/' + filename + '.png';
console.log("Loading " + url);

// Render the screenshot imsage
page.open ( url, function ( status ) {
  if ( status !== "success") {
       console.log("Could not open web page: " + url);
       phantom.exit();
   } else {
        page.clipRect = { top: 0, left: 0, width: 1600, height: 1200 };

       window.setTimeout ( function() {
          page.render(file);
          console.log("Generated the screenshot: " + file + "\n");
          phantom.exit();
       }, 1000);
   }
});