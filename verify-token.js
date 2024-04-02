const jwt=require('jsonwebtoken');


const secret ='jheyson007mywallet';

const token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsInJvbGVzIjpbImFkbWluIiwiY2xpZW50Il0sImlhdCI6MTcwMjg3NzU1NX0.4WtWchjiPPzfP6vxyMTTotkAbK3eoFnBNCDUpGJoo1E'

function verifyToken(token,secret) {
    return jwt.verify(token,secret)
}

const payload =verifyToken(token,secret)

console.log(payload)