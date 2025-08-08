#!/bin/bash
# Script to deploy a very simple web application.
# The web app has a customizable image and some text.

# Ensure curl is available and try to download image locally first (https -> http fallback)
sudo apt -y install curl

URL_HTTPS="https://${PLACEHOLDER}/${WIDTH}/${HEIGHT}"
URL_HTTP="http://${PLACEHOLDER}/${WIDTH}/${HEIGHT}"

curl -fsSL -H "User-Agent: Mozilla/5.0" "$URL_HTTPS" -o /var/www/html/cat.jpg \
  || curl -fsSL -H "User-Agent: Mozilla/5.0" "$URL_HTTP" -o /var/www/html/cat.jpg \
  || true

if [ -s /var/www/html/cat.jpg ]; then
cat << EOM > /var/www/html/index.html
<html>
  <head><title>Meow!</title></head>
  <body>
  <div style="width:800px;margin: 0 auto">

  <!-- BEGIN -->
  <center><img src="/cat.jpg" alt="Placeholder image" /></center>
  <center><h2>Meow World!</h2></center>
  Welcome to ${PREFIX}'s app. Do you love this animal?
  <!-- END -->

  </div>
  </body>
</html>
EOM
else
cat << EOM > /var/www/html/index.html
<html>
  <head><title>Meow!</title></head>
  <body>
  <div style="width:800px;margin: 0 auto">

  <!-- BEGIN -->
  <center><img src="$URL_HTTPS" referrerpolicy="no-referrer" alt="Placeholder image" /></center>
  <center><h2>Meow World!</h2></center>
  Welcome to ${PREFIX}'s app. Do you love this animal?
  <!-- END -->

  </div>
  </body>
</html>
EOM
fi


echo "Script complete."
