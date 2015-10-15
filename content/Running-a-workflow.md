Hitting `npm run build` all the time will get boring eventually. Fortunately we can work around that quite easily. Let's set up `webpack-dev-server`.

## Setting up `webpack-dev-server`

As a first step, hit `npm i webpack-dev-server --save`. In addition we'll need to tweak `package.json` *scripts* section to include it. Here's the basic idea:

*package.json*
```json
{
  "scripts": {
    "build": "webpack --config config/webpack.config.js",
    "dev": "webpack-dev-server --devtool eval --config config/webpack.config.js --progress --colors --hot --content-base build"
  }
}
```

When you run `npm run dev` from your terminal it will execute the command stated as a value on the **dev** property. This is what it does:

1. `webpack-dev-server` - Starts a web service on localhost:8080
2. `--devtool eval` - Creates source urls for your code. Making you able to pinpoint by filename and line number where any errors are thrown
3. `--config config/webpack.config.js` - If you followed the directory structure from Getting Started, this points webpack to the relative config file
4. `--progress` - Will show progress of bundling your application
5. `--colors` - Yay, colors in the terminal!
6. `--content-base build` - Points to the output directory configured

To recap, when you run `npm run dev` this will fire up the webservice, watch for file changes and automatically rebundle your application when any file changes occur. How neat is that!

Go to **http://localhost:8080** and you should see something.
