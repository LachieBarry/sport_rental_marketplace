// webpack.config.js

const path = require('path');

module.exports = {
  entry: './src/index.js', // Entry point of your application
  output: {
    path: path.resolve(__dirname, 'dist'), // Output directory for bundled files
    filename: 'bundle.js', // Output bundled file name
  },
  // Other configurations like loaders, plugins, etc.
};
