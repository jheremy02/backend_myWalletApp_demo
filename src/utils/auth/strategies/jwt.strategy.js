const {Strategy,ExtractJwt}=require("passport-jwt")
const { TOKEN_SECRET_KEY } = require("../../../../config")

const options={
    jwtFromRequest:ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey:TOKEN_SECRET_KEY
}

const JwtStrategy=new Strategy(options,(payload,done)=>{
   return done(null,payload)
})

module.exports=JwtStrategy