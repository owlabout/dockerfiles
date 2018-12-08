Dockerimage for developing a [Quasar](https://quasar-framework.org/) app based on [debian:9-slim](https://hub.docker.com/_/debian/).

Allows building an android apk within docker.

Contains

- node/npm
- openjdk
- android sdk
- gradle

If you are missing anything create a PR or an issue.

### Usage

```
https://github.com/owlabout/dockerfiles.git#:quasar
```

```bash
# build image
docker build  -t quasar https://github.com/owlabout/dockerfiles.git#:quasar
# start docker; starts bash by default
docker run quasar
```

#### Setup Quasar Project

```bash
# start your quasar project
npm i -D @vue/cli
npm i -D quasar-cli
npm run quasar init <folder_name>

# run a dev server
npm run quasar dev -t mat
```

#### Build the apk

```bash
# build an android apk
npm i -D cordova
npm run quasar mode -a cordova
npm run quasar build -m cordova -T android -t mat

# signing the apk
keytool -genkey -v -keystore keystore_name.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 20000

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore keystore_name.keystore src-cordova/platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk alias_name
```
