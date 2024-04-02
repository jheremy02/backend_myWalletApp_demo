const boom = require("@hapi/boom")
const { API_KEY } = require("../../config")

function checkApiKey(req,res,next) {

    const apiKey=req.headers['api']

    if (apiKey===API_KEY) {
        next()
    } else {
        next(boom.unauthorized())
    }
}

function hasCommonElement(array1, array2) {
    // Use the some() method to check if any element in array1 is present in array2
    return array1.some(element => array2.includes(element));
}


function checkRoles(roles) {
    return (req,res,next) =>{
        
        const rolesFound=hasCommonElement(req.user.roles,roles)
      
        if (rolesFound) {
            next()
        }else {
            next(boom.forbidden())
        }
    }
}

function addRoles(roles) {
    return (req,res,next)=>{
        req.body.roles=roles
        next()
    }
}

module.exports={
    checkApiKey,
    addRoles,
    checkRoles
}