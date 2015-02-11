var webpack = require('webpack');
var path = require("path");

module.exports = {
  context: __dirname,
  entry: {
    home:  "./fe/ap/home/entry.coffee"
  },
  output: {
    path: path.join(__dirname, 'priv', 'static', 'js'),
    filename: "[name]-bundle.js",
    publicPath: "/js/"
  },
  module: {
    loaders: [
        { test: /\.coffee$/, loader: "coffee-loader" },
        { test: /\.jsx$/, loader: "jsx-loader?harmony" },
        { test: /\.cjsx$/, loader: "coffee-jsx-loader" },
        { test: /\.less$/,   loader: "style-loader!css-loader!less-loader"},
        { test: /\.css$/,   loader: "style-loader!css-loader"},
        { test: /\.(eot|woff|svg|ttf|woff2)$/,   loader: "url-loader?prefix=font/&limit=5000" },
    ]
  },
  resolve: {
    alias: {
      ap:     path.join(__dirname, "fe", "ap"),
      shared: path.join(__dirname, "fe", "ap", "shared") 
    }
               
  }
};

