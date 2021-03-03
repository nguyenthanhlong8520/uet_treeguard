const express = require('express')
const router = express.Router();
const pool = require('../database/index.js')
const User = require('../core/user');


const user = new User();

router.get('/', (req, res, next) => {
  return res.send('Hello World!!!')
})

router.get('/forest', (req, res, next) => {
    pool.query(`SELECT * from forest`, function (err, result) {
        if (err) throw err;
        return res.json(result);
    });
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

// Post register data
router.post('/register', (req, res, next) => {
    // prepare an object containing all user inputs.
    let userInput = {
        username: req.body.username,
        password: req.body.password,
        forest_id: req.body.forest_id
    };

    if (req.body.password == req.body.confirmPassword) {
        user.create(userInput, function (lastId) {
            if (lastId) {
                user.find(lastId, function (result) {
                    // req.session.user = result;
                    // req.session.opp = 0;
                    res.send('Create account success');
                });
            }
            else {
                console.log('Error creating a new user ...');
            }
        });
    }else{
        res.send('Error creating a new user ...')
    }
});

module.exports = router;

