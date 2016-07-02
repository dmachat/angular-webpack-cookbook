Another powerful tool at our disposal which is made easy by Webpack, is template caching. We saw how we can [require html files](Loading-HTML), and Webpack will convert them to JavaScript friendly strings, but leaves use with a potentially long static string injected in our modules at every point where we need them, and then parsed by our directive or controller. Instead, Angular provides us with the [$templateCache](https://docs.angularjs.org/api/ng/service/$templateCache) service, which allows us to register and pre-parse our templates, so they're reusable anywhere in our app, and faster to compile and interpolate onto the page. We'll use leverage [ngtemplate-loader](https://github.com/WearyMonkey/ngtemplate-loader) with Webpack to take full advantage of it. `npm install --save-dev ngtemplate-loader` will install the loader, and in your Webpack config file, test for html and apply the loader like this:

```js
 module: {
  loaders: [{
    test: /\.html$/,
    loader: 'ngtemplate!html'
  }]
}
```
You can optionally use other html loaders like jade or handlebars in front of ngtemplate. ngtemplate-loader will add html to the Angular global module's $templateCache using the `put` method in the module run stage, so these templates will always be available via the `$get` method, which is what is used internally whenever you require templates in Angular using `templateUrl` or `<ng-include src=`. You can also use `$get` manually if you need to compile the templates yourself. Because of this, keep in mind a very important parameter for ngtemplate, `relativeTo`. Essentially, for namespacing purposes, the templates are stored _as if_ they are being loaded in your app's public path. A directive might look like this:

*app/js/directives/templateTest/templateTest.js*
```js
import template from './templateTest.html';
// console.log(template) -> 'app/js/directives/templateTest/templateTest.html

angular.module('templateTest', []).directive('templateTest', function() {
  return {
    templateUrl: template
  }
});
```

Notice how we get a url back when we import the html file, instead of a string of html? This url serves as the "key" for `$templateCache.$get`. In this case, `relativeTo=/app/` would give us a return value of `js/directives/templateTest/templateTest.html` above.
