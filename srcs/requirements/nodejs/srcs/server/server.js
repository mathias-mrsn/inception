let http = require('http'); // Here, you can add variables for each requirement
let fs = require('fs'); // Here, you can add variables for each requirement
let url = require('url'); // Here, you can add variables for each requirement
const EventEmitter = require('events'); // Here, you can add variables for each requirement

let App = {
    start: function (port) {
        let emitter = new EventEmitter();
        let server = http.createServer((req, res) => {
            res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
            if (req.url === '/') {
                emitter.emit('root');
            }
            res.end();
        }).listen(port);
        return emitter;
    }
}

let app = App.start(8080);
app.on('root', function (response) {
    response.write('Je suis root');
});




// let server = https.createServer();

// // If server received a request, we will launch function with a request and a response as parameters
// server.on('request', (req, res) => { // This part, we add the response of the server

//     // res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
//     // if (query.name == undefined) {
//         //     res.end("unknown");
//         // } else {
//             //     res.end(query.name);
//             // }
            
            
            
            
//     let query = url.parse(req.url, true).query;
//     let name = query.name === undefined ? "unknown" : query.name;
//     fs.readFileSync('index.html', 'utf8', (err, data) => {
//         if (err) {
//             res.writeHead(404, {'Content-Type': 'text/html; charset=utf-8'});
//             res.end('404 Not Found');
//         }
//         res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
//         data = data.replace('{{ name }}', name);
//         res.end(data);
//     });
    

// });

// server.listen('8080'); // We set here the server port, default is 80

// // TODO : Add Openssl, generate keys and add them to the server with https