## Split configuration into multiple tasks

Webpack config can be broken up to accomplish different things per npm task. For example, to have separte tasks for normal and minified output bundles, start with an npm task for each.

*package.json*
```json
"scripts": {
  "run": "webpack --watch --hot",
  "build": "webpack config=webpack.min.config.js"
}
```

*webpack.config.js*
```javascript
var path = require('path');
module.exports = {
  entry: path.resolve(__dirname, 'app/main.js')
  output: {
    path: path.resolve(__dirname, 'build'),
    filename: 'bundle.js'
  },
  plugins: [
    new webpack.ProvidePlugin({
      'angular': 'angular'
    })
  ]
};
```

*webpack.min.config.js*
```javascript
var config = require('./webpack.config'),
    webpack = require('webpack');

config.output.filename = 'bundle.min.js',
config.plugins.push(new webpack.optimize.UglifyJsPlugin({minimize: true}));

module.exports = config;
```