const path = require("path");
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const BundleAnalyzerPlugin = require("webpack-bundle-analyzer").BundleAnalyzerPlugin;

const env = process.env.MIX_ENV || "dev";
const isProd = env === "prod";
const mode = env === "prod" ? "production" : "development"

const elmSource = __dirname + "/js/elm";

const prodElm = "/app/apps/platform_web/assets"
const elmMake = "/node_modules/elm/binwrappers/elm-make"
const elmMakePath = isProd ? prodElm + elmMake : __dirname + elmMake

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
    filename: "js/app.js"
  },
  devServer: {
    historyApiFallback: {
      index: '/'
    },
    contentBase: path.resolve(__dirname, "../priv/static/")
  },
  resolve: {
    extensions: [".css", ".sass", ".scss", ".js", ".jsx", ".elm"],
    alias: {
      phoenix: __dirname + "/deps/phoenix/assets/js/phoenix.js"
    }
  },
  module: {
    rules: [{
        test: /\.(sass|scss|css)$/,
        include: /css/,
        use: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: [{
              loader: "css-loader"
            },
            {
              loader: "sass-loader",
              options: {
                sourceComments: !isProd,
                sourceMap: true
              }
            }
          ]
        })
      },
      {
        test: /\.(jsx?)/,
        exclude: ["/node_modules"],
        use: {
          loader: "babel-loader",
          options: {
            babelrc: false,
            presets: ['env', 'react'],
            plugins: ['transform-class-properties', "transform-object-rest-spread"]
          }
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
    new ExtractTextPlugin("./css/app.css"),
    new CopyWebpackPlugin([{
      from: "./static"
    }]),
    // new BundleAnalyzerPlugin({
    //     generateStatsFile: true
    // })
  ]
};

// if (process.env.NODE_ENV === 'production') {
//   config.plugins.push(
//     new webpack.optimize.DedupePlugin(),
//     new webpack.optimize.UglifyJsPlugin({ minimize: true })
//   );
// }
