const express = require('express')
const router = express.Router();
const pool = require('../database/index.js')

const User = require('../core/user');
const Forest = require('../core/forest')
const Devices = require('../core/device')
const Devices_mess = require('../core/device_messages');

const generateJWT = require('./generateJWT');
const veryfyToken = require('./verifiToken');


const user = new User();
const forest = new Forest();
const device = new Devices();
const device_mess = new Devices_mess();

router.get('/ping', (req, res, next) => {
    res.send("pong");
})

router.get('/devices', veryfyToken, (req, res, next) => {
    pool.query(`SELECT * from devices`, function (err, result) {
        if (err) {
            return res.json({
                code: 500,
                message: err.message
            });
        }
        return res.json({code:200, data: result});
    });
})

router.get('/device_messages/:id', veryfyToken, (req, res, next) => {
    pool.query(`select * from device_messages where device_messages.id = ${req.params.id}`, function (err, result) {
        if (err) {
            return res.json({
                code: 500,
                message: err.message
            });
        }
        return res.json({code:200, data: result});
    });
})

router.get('/forest_list', veryfyToken, (req, res, next) => {
    pool.query('SELECT * from forest', function (err, result) {
        if (err)  {
            return res.json({
                code: 500,
                message: err.message
            });
        }
        return res.json({code:200, data: result});
    });
})

// Post login data
router.post('/api/login', (req, res, next) => {
    const { username, password } = req.body;
    if (!username || !password) {
        res.send({
            code: 400,
            error: 'Authenticate failed!!!',
            message: 'Missing username or password.',
        });
        return;
    }
    user.login(username, password, function (result) {
        if (result) {
            res.locals = result;
            generateJWT(req,res,next);
        } else {
            res.json({
                code: 400,
                error: 'Authenticate failed!!!',
                message: 'Username or password does not correct.',
            })
        }
    })
});

// Post register data
router.post('/api/register', (req, res, next) => {
    // prepare an object containing all user inputs.
    let userInput = {
        username: req.body.username,
        password: req.body.password,
        authority: 1,
        forest_id: req.body.forest_id,
    };

    if (req.body.password == req.body.confirmPassword) {
        user.create(userInput, function (lastId) {
            if (lastId) {
                user.find(lastId, function (result) {
                    //res.send('Create account success');
                    res.json({
                        code: 200,
                        data: {},
                        message: "Create accont success"
                    })
                });
            }
            else {
                res.json({
                    code: 400,
                    //error: 'Authenticate failed!!!',
                    message: 'Create accont failt',
                })
            }
        });
    }else{
        res.send('Error creating a new user ...')
    }
});

// add forest
router.post('/api/add_forest', veryfyToken,(req, res, next) => {
    // prepare an object containing all user inputs.
    let data = {
        name: req.body.name,
        district: req.body.district,
        town: req.body.town,
        province: req.body.province,
        latitude: req.body.latitude,
        longtitude: req.body.longtitude,
        size: req.body.size
    };

    forest.create(data, function (callback) {
        if (callback) {
            res.json({
                code: 200,
                message: "successfully"
            })
        }
        else {
            res.json({
                code: 200,
                message: "something went wrong"
            })
        }
    });
});

router.post('/devices', veryfyToken, (req, res, next) => {
    // prepare an object containing all user inputs.
    let data = {
        forest_id: req.body.forest_id,
        device_name: req.body.device_name,
        latitude: req.body.latitude,
        longtitude: req.body.longtitude,
        registed_by: req.body.registed_by,
        maintenence: req.body.maintenence,
    };

    device.create(data, function (err, callback) {
        if (err) {
            res.json({
                code: 400,
                data: {},
                message: err.message
            })
        }
        else {
            res.json({
                code: 200,
                message: callback
            })
        }
    });
});


router.post('/devices_mess', veryfyToken, (req, res, next) => {
    // prepare an object containing all user inputs.
    let data = {
        device_id: req.body.device_id,
        is_stroked: req.body.is_stroked,
        is_removed: req.body.is_removed,
        is_fire: req.body.is_fire,
        power: req.body.power,
    };

    device_mess.create(data, function (err, callback) {
        if (err) {
            res.json({
                code: 400,
                data: {},
                message: err.message
            })
        }
        else {
            res.json({
                code: 200,
                message: callback
            })
        }
    });
});


router.get('/check-token', veryfyToken, (req, res) => {
    res.json({
        code:200,
        data: {}
    })
})

module.exports = router;