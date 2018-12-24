#!/bin/sh
# created by bevute@
# 2018.12.17

URL=${URL_ENV}
DIV=${DIV_ENV}
# tmp file
TMP=/tmp/div_content.js

cat <<EOF > ${TMP}
"use strict";
var page = require('webpage').create();
console.log('The default user agent is ' + page.settings.userAgent);
page.settings.userAgent = 'SpecialAgent';
page.open("${URL}", function(status) {
  if (status !== 'success') {
    console.log('Unable to access network');
  } else {
    var ua = page.evaluate(function() {
      return document.getElementById("${DIV}").textContent;
    });
    console.log(ua);
  }
  phantom.exit();
});
EOF

# start phantomjs with generated DIV Container config
# and cut asci text

/srv/phantomjs-2.1.1-linux-x86_64/bin/phantomjs --ssl-protocol=any --ignore-ssl-errors=yes ${TMP}

# delete TMP
rm ${TMP}
