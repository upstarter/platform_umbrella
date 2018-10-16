const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const UglifyJsPlugin = require("uglify-js-plugin");
const ReactLoadablePlugin = require('react-loadable/webpack').ReactLoadablePlugin;
const BundleAnalyzerPlugin = require("webpack-bundle-analyzer").BundleAnalyzerPlugin;

const env = process.env.NODE_ENV || "development";
const devMode = env === "development";
const mode = env === "production" ? "production" : "development"

const elmSource = __dirname + "/js/elm";

const prodElm = "/app/apps/platform_web/assets"
const elmMake = "/node_modules/elm/binwrappers/elm-make"
const elmMakePath = !devMode ? prodElm + elmMake : __dirname + elmMake

module.exports = {
  mode: mode,
  devtool: "source-map",
  entry: {
    app: ["./css/app.scss", "./js/app.js"
      // , "./js/elm/src/Main.elm"
    ]
  },
  output: {
    // `path` is the folder where Webpack will place your bundles
    path: path.resolve(__dirname, "../priv/static/"),
    // `filename` provides a template for naming your bundles (remember to use `[name]`)
    filename: 'js/[name].bundle.js',
    // `chunkFilename` provides a template for naming code-split bundles (optional)
    chunkFilename: 'js/[name].bundle.js'
  },
  devServer: {
    // webpack-dev-server defaults to localhost:8080
    proxy: {
      "/api": {
        target: 'localhost:4000',
        pathRewrite: { '^/api': '' },
        changeOrigin: true,
        secure: false
      }
    },
    historyApiFallback: {
      index: '/'
    },
    headers: {
      "Access-Control-Allow-Origin": "*",
      // "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
      // "Access-Control-Allow-Headers": "*"
    },
    watchOptions: {ignored: /node_modules/, include: /node_modules\/antd/},
    contentBase: path.resolve(__dirname, "../priv/static/")
  },
  optimization: {
    splitChunks: {
      chunks: 'all'
    },
    minimizer: !devMode ? [
        new UglifyJsPlugin({
          // sourceMap: true // set to true if you want JS source maps

          cache: true,
          parallel: true,
          // Compression specific options
          uglifyOptions: {
              // Eliminate comments
              comments: false,
              compress: {
                 // remove warnings
                 warnings: false,
                 // Drop console statements
                 drop_console: true
              },
          }
       }),
       new OptimizeCSSAssetsPlugin({})
     ] : []
  },
  resolve: {
    extensions: [".css", ".sass", ".scss", ".less", ".js", ".jsx"],
    alias: {
      phoenix: __dirname + "/deps/phoenix/assets/js/phoenix.js"
    }
  },
  module: {
    rules: [
      {
        test: /\.less$/,
        exclude: ["/node_modules", "/js/elm"],
        use: [
          { loader: devMode ? 'style-loader' : MiniCssExtractPlugin.loader },
          { loader: 'css-loader' },
          { loader: 'less-loader', // compiles Less to CSS
            options: {
              sourceMap: true,
              modifyVars: {
                '@primary-color': '#783D6F',
                '@btn-default-bg': '#783D6F',
                '@btn-primary-bg': '#783D6F',
                '@btn-primary-color': '#fff',
                '@link-color': '#1DA57A',
                '@text-color': '#fff', // major text color
                '@text-color-secondary': '#fff',
                '@layout-trigger-background': '#fff',
                '@layout-trigger-background-light': '#fff',
                '@layout-trigger-color': '#000',
                '@layout-header-background': '#000',
                '@layout-header-color': '#000',
              },
              javascriptEnabled: true,
            }
          },
        ]
      },
      {
        test: /\.(sa|sc|c)ss$/,
        exclude: ["/node_modules", "/js/elm"],
        use: [
          { loader: devMode ? 'style-loader' : MiniCssExtractPlugin.loader },
          { loader: 'css-loader' },
          { loader: 'sass-loader',
            options: {
              sourceComments: devMode,
              sourceMap: true
            }
          },
       ],
      },
      {
        test: /\.(jsx?)/,
        exclude: ["/node_modules", "/js/elm"],
        use: [
          { loader: "babel-loader?cacheDirectory=true",
          }
        ]
      },
      // {
      //   test: /\.elm$/,
      //   exclude: ["/elm-stuff/", "/node_modules"],
      //   loader: "elm-webpack-loader",
      //   options: {
      //     pathToMake: elmMakePath,
      //     maxInstances: 2,
      //     debug: !isProd,
      //     warn: true,
      //     cwd: elmSource
      //   }
      // },
      {
        test: /\.(jpe?g|png|gif|svg)$/i,
        loader: "url-loader?name=/images/[name].[ext]",
      },
      {
        test: /\.(ttf|otf|eot|woff2?)$/,
        loader: "file-loader?name=/fonts/[name].[ext]",
      }
    ],
    noParse: [/\.elm$/]
  },
  plugins: [
    new ReactLoadablePlugin({
      filename: '../priv/static/react-loadable.json',
    }),
    new MiniCssExtractPlugin({
      // Options similar to the same options in webpackOptions.output
      // both options are optional
      filename: devMode ? '[name].css' : '[name].[hash].css',
      chunkFilename: devMode ? '[id].css' : '[id].[hash].css',
    }),
    new CopyWebpackPlugin([{
      from: "./static"
    }]),
    // new BundleAnalyzerPlugin({
    //   generateStatsFile: true
    // })
  ]
};
