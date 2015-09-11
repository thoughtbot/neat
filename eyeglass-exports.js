var neat = require("./index");

module.exports = function(eyeglass, sass) {
  return {
    sassDir: neat.includePaths[0]
  };
};
