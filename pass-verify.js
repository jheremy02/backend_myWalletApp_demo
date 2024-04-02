
const bcrypt = require('bcrypt')

async function hashPassword() {


    const myPassword = '1234'
    const hash='$2b$10$P1Yip0QwOtzH9p4SYVEsyelsPOc1x66Z3..4KEwSAJi9vxxDikNH6'
    const isMatched = await bcrypt.compare(myPassword, hash);

    console.log(isMatched)

}

hashPassword()