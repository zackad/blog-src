var path = require('path');

var config = {
    entry: {
        cookie: './js/cookie/cookie.js'
    },
    output: {
        filename: 'js/[name].js',
        path: path.resolve(__dirname, '_site')
    },
    devtool: 'source-map'
};

if (process.env.NODE_ENV === 'production') {
}

module.exports = config;
