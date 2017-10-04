An alternative to using vanilla js as you would in the browser is `babel-loader`. If you have not heard of babel, you must check out [babel.io](http://babel.io). It is a JavaScript transpiler that allows you to use JavaScript functionality that has not yet been implemented in the browser.

## Installing the Babel loader

`npm install babel-loader --save-dev` and in your config:

*webpack.config.js*

```javascript
var path = require('path');
var config = {
  entry: path.resolve(__dirname, '../app/main.js'),
  output: {
    path: path.resolve(__dirname, '../build'),
    filename: 'bundle.js'
  },
  module: {
    loaders: [{
      test: /\.js$/,
      loader: 'babel'
    }]
  }
};

module.exports = config;
```

Now you can use all the functionality Babel provides.

## ES6 and Angular
You may use ES6 syntax in most cases without problems with Angular 1.x, and in some cases you can use ES6 types and constructors, but keep in mind Angular was not written for ES6, so for example you can define services as a `Class`, but not a factory, since they expect different constructors. This could lead to some messy code, but you can choose how you'd like to take advantage of ES6.
