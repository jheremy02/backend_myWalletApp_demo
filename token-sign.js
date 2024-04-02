const jwt=require('jsonwebtoken');


const secret ='jheyson007mywallet';

const payload= {
    sub:1,
    roles:['admin','client']
}

function signToken(payload,secret) {
    return jwt.sign(payload,secret)
}

const token=signToken(payload,secret)

console.log(token)