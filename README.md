SSL NGINX Local Proxy
=====================

This repo has a container setup so you can run a full-SSL local proxy to your development server. Useful for developing service workers and AMP that require SSL.

How to use this repo
====================

First Time Only
---------------
* Install Docker for Mac https://docs.docker.com/docker-for-mac/install/
* Edit /etc/hosts to map `localhost.www.fool.com` to localhost if you haven't already
* Open the "Keychain Access" App, and unlock it with the lock in the upper left corner
* Click on "System" in the upper left list of Keychains
* Click on "Certificates" in the lower left list of Categories
* Drag the file "rootCA.pem" from the config/ssl directory of this project into the certificate list you see in main area of the Keychain Access app
* Authenticate via touch ID or your password when asked to do so
* Right-click on the new certificate ("The Motley Fool Local SSL Development") and choose "Get Info"
* Click on "Trust" to open the Trust options
* Under "When using this certificate" choose "Always Trust"
* Close Keychain Access

Starting Up the Server
----------------------
* Start your local python server on http://localhost.www.fool.com:8000 however you normally do
* From the command line, in this project's directory, type `docker-compose up`
    * Or, you can click on docker-compose.yml in PyCharm, right click and choose "run"
* You will see "Attaching to nginx-proxy_nginx_1", log will start appearing once you start using it
* Browse to https://localhost.www.fool.com/ and you should see your project via https
* To stop the server, hit ctrl-c in the terminal if you started it that way, or click the Stop button in PyCharm.
    * If you are making changes to your nginx.conf in this setup, you will want to do `docker-compose down` after you stop the server to ensure it gets rebuilt when you start it again.


Troubleshooting
---------------
* If you see a "This certificate authority is not trusted" error, you need to do the "Get Info/Trust/Always Trust" steps above
* If you see "502 Bad Gateway" that means your development python server is not running on port 8000
* If you see "This certificate has expired" errors, then you can run the "regen-cert.sh" script in the ssl dir to make a new server cert.

Customization
--------------

* The NGINX config file in config/nginx/nginx.conf is where you want to do any customization of how this project works.
* Unless you want to change what ports it responds on (default is port 443), and that is in docker-compose.yml.
