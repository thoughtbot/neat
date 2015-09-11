var neat = require(".");

module.exports = function(eyeglass, sass) {
  return {
    sassDir: neat.includePaths[0]
  };
};
