const UJToken = artifacts.require('UJToken.sol');
const PaymentProcessor = artifacts.require('PaymentProcessor.sol');


module.exports = async function (deployer, network, addresses) {
    const [bursar, payer, _] = addresses;

    if(network === 'develop'){
        await deployer.deploy(UJToken);
        const ujtoken = await UJToken.deployed();
        await ujtoken.faucet(payer, web3.utils.toWei('10000'));

        await deployer.deploy(PaymentProcessor, bursar, ujtoken.address);
    }else{

        await deployer.deploy(UJToken);
        const ujtoken = await UJToken.deployed();
        await ujtoken.faucet(payer, web3.utils.toWei('10000'));

        await deployer.deploy(PaymentProcessor, bursar, ujtoken.address);
    //     const BURSAR_ADDRESS = '';
    //     const UJT_ADDRESS = '';
    //     await deployer.deploy(PaymentProcessor, BURSAR_ADDRESS, UJT_ADDRESS);
    // }

};
