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
    path: path.resolve(__dirname, "../priv/static/"),
    chunkFilename: '[name].bundle.js',
    filename: "app.js",
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
      "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
      "Access-Control-Allow-Headers": "*"
    },
    contentBase: path.resolve(__dirname, "../priv/static/")
  },
  optimization: {
    splitChunks: {
      chunks: 'all'
    },
    minimizer: [
      new UglifyJsPlugin({
        cache: true,
        parallel: true,
        // sourceMap: true // set to true if you want JS source maps
      }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  resolve: {
    extensions: [".css", ".sass", ".scss", ".js", ".jsx"],
    alias: {
      phoenix: __dirname + "/deps/phoenix/assets/js/phoenix.js"
    }
  },
  module: {
    rules: [
      {
        test: /\.(sa|sc|c)ss$/,
        include: /css/,
        use: [
          { loader: devMode ? 'style-loader' : MiniCssExtractPlugin.loader },
          { loader: 'css-loader' },
          { loader: 'sass-loader',
            options: {
              sourceComments: devMode,
              sourceMap: true
            }
          }
       ],
      },
      {
        test: /\.(jsx?)/,
        exclude: ["/node_modules", "/js/elm"],
        use: {
          loader: "babel-loader?cacheDirectory=true",
        }
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
    new BundleAnalyzerPlugin({
      generateStatsFile: true
    })
  ]
};
