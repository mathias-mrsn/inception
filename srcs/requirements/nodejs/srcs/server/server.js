var express = require('express');
var app = express();
var server_path = "/etc/local/nodejs/srcs/server/"
var www_path = "/var/www/html/"
var urls = ['/crepe.html', '/tiramisu.html', '/cheesecake.html'];

app.use(express.static(__dirname));

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

app.route('*')
.get(function(req, res) {
    var url = req.url;
    if (url === "/") {
        url = urls[getRandomInt(3)];
    }
    res.sendFile("/var/www/html" + url, (err) => {
        if (err) {
            res.status(404).send("<h1>Error 404</h1><h3> Not Found </h3>");
        }
    });
})
app.listen(3000);
