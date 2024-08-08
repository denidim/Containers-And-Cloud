# 01.vue-js-app-bulding-a-custom-image

> A Vue.js App: Bulding A Custom Image

## Docker commands

``` bash
# build image
docker build -t vueapp .
# run image
docker run -d -p 8080:8080 vueapp
# inspect image
docker inspect vueapp
# change tag and add version
docker tag yourDockerHubName/vueapp:1.0
# login and push to docker hub
docker login
docker push yourDockerHubName/vueapp:1.0
```

### Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# lint all *.js and *.vue files
npm run lint

# run unit tests
npm test
```

For more information see the [docs for vueify](https://github.com/vuejs/vueify).
