Webpack allows you to load HTML like you load any other code. This allows you to do things like require images or vector graphics in your templates, pre-process them using the templating language of your choice like jade or handlebars, and optimize the loading and reuse of templates by [template caching](Angular-Template-Cache).

Loading HTML requires the **html-loader**, which will parse the HTML and return it as a function with an html string value of your template. You can use that function in places that take an html string, like `template` or in a `$compile`.

## Preparing HTML loading
Install the loader: `npm install html-loader --save-dev`.

In the *webpack.config.js* file you can add the following loader configuration:

*webpack.config.js*
```javascript
var path = require('path');
var config = {
  entry: path.resolve(__dirname, '../app/main.js')
  output: {
    path: path.resolve(__dirname, '../build'),
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      {
        test: /\.html$/, // Only .html files
        loader: 'html' // Run html loader
      }
    ]
  }
};

module.exports = config;
```

## Loading an HTML file
Loading an HTML file is a simple as loading any file:

*main.js*
```javascript
import './main.html';
// Other code
```

*component.js*
```javascript
import './component.html';
import myComponent from './myComponent.js';

angular
  .module('myDirectives', [])
  .directives('myComponent', myComponent);

```

**Note!** You can of course do this with both CommonJS and AMD.