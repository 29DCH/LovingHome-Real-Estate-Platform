////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Helps with IE debugging.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

jQuery.extend({
    getScript: function(url, callback) {
        var head	= document.getElementsByTagName("head")[0];
        var script	= document.createElement("script");
        var done = false; // Handle Script loading
        script.src	= url;
        script.onload = script.onreadystatechange = function() { // Attach handlers for all browsers
            if ( !done && (!this.readyState || this.readyState === "loaded" || this.readyState === "complete") ) {
                done = true;
                if (callback) { callback(); }
                script.onload = script.onreadystatechange = null; // Handle memory leak in IE
            }
        };

        head.appendChild(script);
        return undefined; // We handle everything using the script element injection
    }
});