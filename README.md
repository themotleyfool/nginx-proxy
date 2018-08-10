How to use this repo
====================

First Time Only
---------------
* Install Docker for Mac https://docs.docker.com/docker-for-mac/install/
* Open the "Keychain Access" App, and unlock it with the lock in the upper left corner
* Click on "System" in the upper left list of items
* Click on "Certificates" in the lower left list of items
* Drag the file "rootCA.pem" from the config/ssl directory of this project into the certificate list you see in the upper right pane
* Authenticate via touch ID or your password when asked to do so
* Close Keychain Access

Starting Up the Server
----------------------
* Start your local python server on localhost.www.fool.com:8000 however you normally do
    * Edit /etc/hosts to map localhost.www.fool.com to localhost if you haven't already
*From the command line, in this project's directory, type `docker-compose up`
    * Or, you can click on docker-compose.yml in PyCharm, right click and choose "run"
* Browse to https://localhost.www.fool.com/ and you should see your project via https
* To stop the server, hit ctrl-c in the terminal if you started it that way, or click the Stop button in PyCharm.
    * If you are making changes to your server, you will want to do `docker-compose down` after you stop the server to ensure it gets rebuilt when you start it again.


Customization
--------------

* The NGINX config file in config/nginx/nginx.conf is where you want to do any customization of how this project works.
* Unless; you want to change what ports it responds on, and those are in docker-compose.yml.