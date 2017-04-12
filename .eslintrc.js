module.exports = {
  "extends": "airbnb-base",
  "plugins": [
      "import",
      "html"
  ],
  "ecmaFeatures": {
    "modules": true
  },
  "env": {
    "browser": true,
    "es6": true,
    "node": true
  },
  "rules": {
    "space-before-function-paren": 0,
    "comma-dangle": 0,
    "no-param-reassign": 1,
    "no-shadow": 1
  }
};
