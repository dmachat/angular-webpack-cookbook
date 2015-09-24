## Installing Angular JS

`npm install angular --save`

There is really nothing more to it. You can now start using Angular JS in your code. In this project we are using ES6 module loader sytax, where `import controller from './controllers.js;` is equivalent to `var controller = require('./controllers.js');`.

## Using Angular JS in the code

*In any file*
```javascript
import controller from './controllers.js';

angular

  .module('main', [])

  .controller('mainController', controller);
```

## Including Angular JS as a plugin
To use use Angular JS in your JavaScript modules, you can use webpack to make Angular available as a global to all modules. Otherwise, you can require Angular in any module file where you need it.

`var angular = require('angular');`

Here's how we configure webpack to use Angular as a plugin.

*webpack.config.js*
```javascript
var path = require('path');
module.exports = {
  entry: path.resolve(__dirname, '../app/main.js')
  output: {
    path: path.resolve(__dirname, '../build'),
    filename: 'bundle.js'
  },
  plugins: [
    new webpack.ProvidePlugin({
      'angular': 'angular'
    })
  ]
};
```

Webpack will map modules to free variables. In this case, any time you use the free variable `angular` inside a module, webpack will set angular to `require('angular')`.

## Including Angular JS as an external
If you are writing for a page that will already have Angular loaded, you can use webpack externals. This defines a global variable for all your modules, and assumes it will be available. You may need to include the variable as a JShint global as well to avoid hinting errors.

Here's how we configure webpack to use Angular as an external.

*webpack.config.js*
```javascript
var path = require('path');
module.exports = {
  entry: path.resolve(__dirname, '../app/main.js')
  output: {
    path: path.resolve(__dirname, '../build'),
    filename: 'bundle.js'
  },
  externals: {
    'angular': 'angular'
  }
};
```

You can map other global libraries which may not be a part of your app to externals as well. Be aware this will development with webpack-dev-server, since you'll have to include script tags for those sources in your `index.html`.