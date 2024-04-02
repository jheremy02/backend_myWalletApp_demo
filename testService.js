const OperationService = require("./src/services/operations.service");

const service= new OperationService()

async function test() {
    const result    =await service.getOperation(15)
    console.log(result)
}

test()
