const PLUGIN_NAME = 'CDVCustomLogger';
var exec = require('cordova/exec');

const Logger = {
    /**
     * @function log (logMessage)
     * @description función para escribir mensajes en el log indicando el nivel
     * @param {message} [String] - Mensaje
     * @returns {Promise} - Devuelve una promesa con resultado.
     */
    log: function(message) {
        return new Promise(function(resolve, reject) {
            exec(function(result) {
                resolve(result);
            }, function(error) {
                reject(error);
            }, PLUGIN_NAME, 'logMessage', [message]);
        });
    },
}

module.exports = Logger;