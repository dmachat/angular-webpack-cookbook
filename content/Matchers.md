## What kind of matchers can I use?

* `{ test: /\.es6\.js$/, loader: 'babel' }` - Matches just es6.js
* `{ test: /\.(es6|js)$/, loader: 'babel' }` - Matches both js and es6
* It's just a JavaScript regex, so standard tricks apply. You can use a tool like [Regulex](http://jex.im/regulex/) to inspect your matchers.