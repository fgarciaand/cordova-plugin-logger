const PLUGIN_NAME = 'CDVLogger';
var exec = require('cordova/exec');

const Logger = {
    /**
     * @function log (logLevel)
     * @description función para escribir mensajes en el log indicando el nivel
     * @param {level} [String] - Nivel ["LOG", "ERROR", "WARN", "INFO", "DEBUG"]
     * @param {message} [String] - Mensaje
     * @returns {Promise} - Devuelve una promesa con resultado.
     */
    log: function(level, message) {
        return new Promise(function(resolve, reject) {
            exec(function(result) {
                resolve(result);
            }, function(error) {
                reject(error);
            }, PLUGIN_NAME, 'logLevel', [level, message]);
        });
    },
}

module.exports = Logger;