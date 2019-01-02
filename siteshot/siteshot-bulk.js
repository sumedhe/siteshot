// Open with phantomjs
// $ phantomjs siteshot.js samples/website_list.csv

var system = require('system');
var fs = require('fs');

// Create page
var page = require('webpage').create();

// Set browser size
page.viewportSize = { width: 1200, height : 800 };

// Set user agent settings
page.settings.userAgent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36";

// Load file of the list of websites
var fs = require('fs');
var stream = fs.open(system.args[1], 'r');

// Load websites
while(!stream.atEnd()) {
    var url = stream.readLine();
    var file = url.replace('http://', '').replace('https://', '').replace('/', '_') + '.png';
    console.log("Loading " + url);

    // Render the screenshot image
    page.open ( url, function ( status ) {
      if ( status !== "success") {
           console.log("Could not open web page : " + url);
           phantom.exit();
       } else {
           window.setTimeout ( function() {
              page.render(file);
              console.log("Download the screenshot : " + file);
              phantom.exit();
           }, 1000);
       }
    });
}

stream.close();
