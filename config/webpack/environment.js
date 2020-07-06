const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugin.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    JQuery: 'jquery',
    Popper: ['popper.js', 'default']
}))

module.exports = environment
