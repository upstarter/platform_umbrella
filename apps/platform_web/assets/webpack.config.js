const ExtractTextPlugin = require("extract-text-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const elmSource = __dirname + "/js/elm";
const env = process.env.MIX_ENV || "dev";
const isProduction = env === "prod";
const path = require("path");

module.exports = {
  devtool: "source-map",
  entry: {
    app: ["./css/app.scss", "./js/app.js", "./js/elm/src/Main.elm"]
  },
  output: {
    path: path.resolve(__dirname, "../priv/static/"),
    filename: "js/app.js"
  },
  resolve: {
    extensions: [".css", ".scss", ".js", ".jsx", ".elm"],
    alias: {
      phoenix: __dirname + "/deps/phoenix/assets/js/phoenix.js"
    }
  },
  module: {
    rules: [
      {
        test: /\.(sass|scss)$/,
        include: /css/,
        use: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: [
            { loader: "css-loader" },
            {
              loader: "sass-loader",
              options: {
                sourceComments: !isProduction
              }
            }
          ]
        })
      },
      {
        test: /\.(jsx?)/,
        exclude: ["/node_modules"],
        loader: "babel-loader",
        options: {
          presets: ["react", "es2015"]
        }
      },
      {
        test: /\.elm$/,
        exclude: ["/elm-stuff/", "/node_modules"],
        loader: "elm-webpack-loader",
        options: { pathToMake: "/app/apps/platform_web/assets/node_modules/elm/binwrappers/elm-make", maxInstances: 2, debug: true, warn: true, cwd: elmSource }
      },
      {
        test: /\.(jpe?g|png|gif|svg)$/i,
        loader: "url-loader?name=/images/[name].[ext]",
      },
      {
        test: /\.(ttf|otf|eot|svg|woff2?)$/,
        loader: "file-loader?name=/fonts/[name].[ext]",
      }
    ],
    noParse: [/\.elm$/]
  },
  plugins: [
    new ExtractTextPlugin("css/app.css"),
    new CopyWebpackPlugin([{ from: "./static" }])
  ]
};

// const path = require('path');
// var ExtractTextPlugin = require("extract-text-webpack-plugin");
// var merge = require("webpack-merge");
// var webpack = require("webpack");
//
// var env = process.env.NODE_ENV || "development";
// var production = env === "production";
//
// var node_modules_dir = "node_modules"
//
// var plugins = [
//   new ExtractTextPlugin("./css/app.scss")
// ]
// // var plugins = [
// //   new ExtractTextPlugin({
// //     filename: "[name].[contenthash].css",
// //     disable: process.env.NODE_ENV === "development"
// //   });
// // ]
//
// if (production) {
//   plugins.push(
//     new webpack.optimize.UglifyJsPlugin({
//       compress: {warnings: false},
//       output: {comments: false}
//     })
//   );
// } else {
//   plugins.push(
//     new webpack.EvalSourceMapDevToolPlugin()
//   );
// }
//
// var common = {
//   watchOptions: {
//     poll: false
//   },
//   module: {
//     rules: [
//       {
//         test: /\.(jsx?)/,
//         exclude: [node_modules_dir],
//         loader: "babel-loader",
//         options: {
//           presets: ["react", "es2015"]
//         }
//       },
//       {
//         test: /\.elm$/,
//         exclude: [/elm-stuff/, /node_modules/],
//         use: {
//           loader: 'elm-webpack-loader',
//           options: {cwd: 'js/elm'}
//         }
//       },
//       {
//         test: /\.scss$/,
//         use: [
//           {
//             loader: 'style-loader'
//           },
//           {
//             loader: 'css-loader'
//           },
//           {
//             loader: 'sass-loader'
//           }
//         ]
//       },
//       // {
//       //   test: /\.scss$/,
//       //   use: ExtractTextPlugin.extract({
//       //     fallback: 'style-loader',
//       //     use: [
//       //       // {
//       //       //   loader: 'css-loader',
//       //       // },
//       //       // {
//       //       //   loader: 'postcss-loader',
//       //       //   options: {
//       //       //     plugins() {
//       //       //       return [
//       //       //         require("precss"),
//       //       //         require("autoprefixer")
//       //       //       ];
//       //       //     }
//       //       //   }
//       //       // },
//       //       {
//       //         loader: 'sass-loader',
//       //         options: {
//       //           // includePaths: ["css"]
//       //         }
//       //       }
//       //     ]
//       //   })
//       // },
//       {
//         test: /\.(jpe?g|png|gif|svg)$/i,
//         loader: "url-loader?name=/images/[name].[ext]",
//       },
//       {
//         test: /\.(ttf|otf|eot|svg|woff2?)$/,
//         loader: "file-loader?name=/fonts/[name].[ext]",
//       }
//     ],
//     noParse: [/\.elm$/]
//   },
//   plugins: plugins
// };
//
// module.exports = [
//   merge(common, {
//     entry: [
//       __dirname + '/css/app.scss',
//       __dirname + '/js/app.js',
//       __dirname + '/js/elm/src/Main.elm'
//     ],
//     output: {
//       path: __dirname + '../priv/static/js/',
//       filename: "[name].js"
//     },
//     resolve: {
//       modules: [
//         __dirname + 'node_modules',
//         __dirname + 'js'
//       ],
//       extensions: [".js", ".jsx", ".elm"]
//     }
//   })
// ];
