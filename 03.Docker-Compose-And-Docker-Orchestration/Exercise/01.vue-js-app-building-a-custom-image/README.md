# 02.vue-js-app

> A Vue.js App in Container

## Docker commands

``` bash
# runn app from the container
docker run -d -p 9081:8080 -v %cd%:/app -w /app node:20 npm run serve
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
