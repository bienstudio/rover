const path = require('path');

module.exports = {
  entry: './apps/web/assets/jsc/application.js',
  output: {
    path: path.resolve(__dirname, './public/assets/jsc'),
    filename: 'application.js'
  },

  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: 'babel',
        exclude: /node_modules/
      },
      {
        test: /\.vue$/,
        loader: 'vue'
      },
      {
        test: /\.s[a|c]ss$/,
        loader: 'style!css!sass'
      }
    ]
  },
  vue: {
    loaders: {
      js: 'babel',
      sass: 'vue-style-loader!css-loader!sass-loader?indentedSyntax'
    }
  },
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.common.js',
      'css': path.resolve(__dirname, './apps/web/assets/css/lib/')
    }
  }
};
