var tasks = require('./task')
var express = require('express')
var app = express()
var jwt = require('jsonwebtoken');

var router = express.Router();
var bodyParser = require("body-parser");
var verifyToken = require("../Application/user")
app.use(bodyParser.json());       // to support JSON-encoded bodies

app.use(bodyParser.urlencoded({
    extended: true
}));

/*app.use(function(req, res, next) {

 if (req.query.token === 'secret') {

 next();

 } else {

 res.send('unauthorized');

 }

});*/

app.use('/', router)

var promise = new Promise(function (resolve, reject) {


})
promise.then(app.get('/get/:id', verifyToken, (req, res) => {
    jwt.verify(req.token, 'SuperSecRetKey', (err, authData) => {
        if (err) {
            res.sendStatus(403);
        } else {
            tasks.gettaskbyId(req.params.id, function (err, datas) {
                if (err) {
                    res.send(err);
                } else {
                    res.send(datas);
                }


            })
        }
    })
})
).catch(

    app.get('/all', verifyToken, (req, res) => {
        jwt.verify(req.token, 'SuperSecRetKey', (err, authData) => {
            if (err) {
                res.sendStatus(403);
            } else {

                tasks.getalltask(function (err, datas) {
                    if (err) {
                        res.send(err);
                    } else {
                        res.send(datas);
                    }
                })
            }
        })
    }));

app.put('/put', verifyToken, (req, res) => {
    jwt.verify(req.token, 'SuperSecRetKey', (err, authData) => {
        if (err) {
            res.sendStatus(403);
        }
        else {

            tasks.updatetask([req.body.name, req.body.product, req.body.id], function (err, datas) {
                if (err) {
                    res.send(err)
                }
                else {
                    res.send(datas)
                }
            })
        }
    })
})
app.delete('/:id', verifyToken, (req, res) => {
    jwt.verify(req.token, 'SuperSecRetKey', (err, authData) => {
        if (err) {
            res.sendStatus(403);
        } else {
            tasks.deletetask([req.params.id], function (err, datas) {
                if (err) {
                    res.send(err)
                }
                else {
                    res.send(datas)
                }
            })
        }
    })
})

app.post('/post', verifyToken, (req, res) => {
    jwt.verify(req.token, 'SuperSecRetKey', (err, authData) => {
        if (err) {
            res.sendStatus(403);
        } else {
            tasks.posttask([req.body.id, req.body.name, req.body.city, req.body.product], function (err, datas) {
                if (err) {
                    res.send(err)
                }
                else {
                    res.send(datas)
                }
            })
        }
    });
});







app.listen(3000, function () {
    console.log("connecting to localhost");
})
module.exports = router;
