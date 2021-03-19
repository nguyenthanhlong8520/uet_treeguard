const express = require('express')
const router = express.Router();
const pool = require('../database/index.js')

const User = require('../core/user');
const User_infor = require('../core/user_infor');
const Forest = require('../core/forest')
const Devices = require('../core/device')
const Devices_mess = require('../core/device_messages')

const user = new User();
const forest = new Forest();
const device = new Devices();
const device_mess = new Devices_mess();
const user_infor = new User_infor();

router.get('/', (req, res, next) => {
  return res.send('Hello World!!!')
})

// Post login data
router.post('/login', (req, res, next) => {
    user.login(req.body.username, req.body.password, function (result) {
        if (result) {
            res.send('login success');
        } else {
            res.send('wrong username or password');
        }
    })
});

//Post register data
router.post('/register', (req, res, next) => {
    // prepare an object containing all user inputs.
    let userInput = {
        username: req.body.username,
        password: req.body.password,
    };

    if (req.body.password == req.body.confirmPassword) {
        user.create(userInput, function (lastId) {
            if (lastId) {
                user.find(lastId, function (result) {
                    res.send('Create account success');
                });
            }
            else {
                     res.send('Error creating a new user ...');
            }
        });
    }else{
        res.send('Error creating a new user ...')
    }
});

//Create user infor
router.post('/user_infor_create', (req, res, next) => {
    // prepare an object containing all user inputs.
    let user_inforInput = {
        id: req.body.id,
        last_name: req.body.last_name,
        first_name: req.body.first_name,
        authority: req.body.authority,
        email: req.body.email,
        phone: req.body.phone,
        forest_id: req.body.forest_id,
    }
    user_infor.create(user_inforInput, function (callback) {
        if (callback) {
                res.send('Create account success');
        }
        else {
                res.send('Error creating a new user ...');
        }
    });
  
});

// query data all forest
router.get('/forest', (req, res, next) => {
    pool.query(`SELECT * from forest`, function (err, result) {
        if (err) throw err;
        return res.json(result);
    });
})

// create forest
router.post('/forest', (req, res, next) => {
    // prepare an object containing all user inputs.
    let data = {
        name: req.body.name,
        district: req.body.district,
        town: req.body.town,
        province: req.body.province,
        latitude_BL: req.body.latitude_BL,
        longtitude_BL: req.body.longtitude_BL,
        latitude_TL: req.body.latitude_TL,
        longtitude_TL: req.body.longtitude_TL,
        latitude_BR: req.body.latitude_BR,
        longtitude_BR: req.body.longtitude_BR,
        size: req.body.size
    };

    forest.create(data, function (callback) {
        if (callback) {
                res.send('Sucessfully to add forest');
        }
        else {
            res.send('Error creating forest ...');
        }
    });

});

// create device
router.post('/devices', (req, res, next) => {
    // prepare an object containing all user inputs.
    let data = {
        forest_id: req.body.forest_id,
        device_name: req.body.device_name,
        latitude: req.body.latitude,
        longtitude: req.body.longtitude,
        registed_by: req.body.registed_by,
        maintenence: req.body.maintenence,
    };

    device.create(data, function (callback) {
        if (callback) {
            res.send('Sucessfully to add device'); 
        }
        else {
            res.send('Error creating device ...');
        }
    });

});

// create devices_mess
router.post('/devices_mess', (req, res, next) => {
    // prepare an object containing all user inputs.
    let data = {
        device_id: req.body.device_id,
        is_stroked: req.body.is_stroked,
        is_removed: req.body.is_removed,
        is_fire: req.body.is_fire,
        power: req.body.power,
    };

    device_mess.create(data, function (callback) {
        if (callback) {
            res.send('Sucessfully to add device');
        }
        else {
            res.send('Error creating device ...');
        }
    });

});

module.exports = router;

