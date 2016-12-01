# Required Software #

* Node >= 4.5.0 (from their website)
* NPM >= 3.10.6 (npm install -g npm)
* GULP >= 3.9.1 (npm install -g gulp)

### Node ###
Node is a JavaScript runtime environment.

### NPM ###
NPM stands for "Node Package Manager". It allows you to get helpful JavaScript packages/modules and manage updates to them. NPM is required so that you can obtain Gulp.

### Gulp ###
Gulp is an NPM package that solves the problem of repetition. It is used for automating tasks. We use it for automating all the tasks that are part of deploying monster (e.g. compiling css, minifying files...).

# Steps #

After cloning a fresh repo, you'll want to run

```npm install```

which will initialize all the node dependencies for gulp.

## Using the correct API ##
Before deploying, you need to make sure requests from the browser will go to the right place. In monster 4.0, the default API is set in the file ```/src/js/config.js```. When you clone monster, the default API is usually set to production, which is not safe for testing because there is potential to send requests that delete/change customer data. Furthermore, if you are testing on your own environment you might not be able to log in. If testing, change the default API (api.default) to arefu:

```default:  'https://apidemo.conversanthq.com:8444/v2/'```

You also need to set ```api.wss_server``` and ```api.ws_server``` as follows:
```
wss_server: 'wss://sip-arefu.conversant.co.nz:8443/',
ws_server: 'ws://sip-arefu.conversant.co.nz:8080/'
```

Once that's done, you can just run

```gulp```

which will build the website, build the css files from scss files and serve it to a webbrowser.

If you are using Docker, this will setup a local dev server:

```./serve.sh```

*Important: If you install all the separate apps via GIT as submodules in the ```/monster-ui/src/apps``` folder and then run 

```gulp build-prod```

All the apps code (JS/HTML/CSS) will be concatenated together and minified. I.e. there should not be any extra steps for the git submodules.*

## Deploying on a server ##
There is an extra step when deploying on one of our servers. When ssh is used to access the server, it is not sufficient to just run the command

```gulp```

When you run it on your own environment, it builds your website and serves it up via a web browser. Firstly, you cannot open a web browser like this in ssh. Secondly, when you are on the server, you want to build a static copy of your website to serve up to clients. Therefore, the  command to use is:

```gulp build-prod```

---

** Build Pro version **

*Note: The pro version of an app is a paid version which does not come with any source code. At Conversant, we currently do not use the pro version of any apps.*

Some apps might have a pro version. If that's the case, and you want to build it with the "pro" assets you need to specify the name of the app in the pro flag.

```gulp build-prod --pro=test1,test2,test3```

Build Pro version app level

```gulp build-prod```

with core only, then add the app repo to /apps and

```gulp-build-app --app=test1 --pro```