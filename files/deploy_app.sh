#!/bin/bash
# Script to deploy a very simple web application.
# The web app has a customizable image and some text.

# Ensure curl is available and download image locally first
sudo apt -y install curl
curl -fsSL "https://${PLACEHOLDER}/${WIDTH}/${HEIGHT}" -o /var/www/html/cat.jpg || true

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


echo "Script complete."
