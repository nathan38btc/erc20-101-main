const Str = require('@supercharge/strings')
// const BigNumber = require('bignumber.js');

var TDErc20 = artifacts.require("ERC20TD.sol");
var evaluator = artifacts.require("Evaluator.sol");
var montokenerc20 = this.artifacts.require("MonTokenERC20.sol");


module.exports = (deployer, network, accounts) => {
    deployer.then(async () => {
        await deployTDToken(deployer, network, accounts); 
        await deployEvaluator(deployer, network, accounts); 
        await setPermissionsAndRandomValues(deployer, network, accounts); 
        await deployRecap(deployer, network, accounts); 

		console.log("Exercice 1 :");
		await Exercice1(deployer,network,accounts);

		console.log("Exercice 2 :");
		await Exercice2(deployer,network,accounts);

		console.log("Exercice 3")
		await Exercice3(deployer,network,accounts);

		console.log("Exercice 4")
		await Exercice4(deployer,network,accounts);

		await myPoints(deployer,network,accounts);
    });
};

async function deployTDToken(deployer, network, accounts) {
	TDToken = await TDErc20.new("TD-ERC20-101","TD-ERC20-101",web3.utils.toBN("20000000000000000000000000000"))
}

async function deployEvaluator(deployer, network, accounts) {
	Evaluator = await evaluator.new(TDToken.address)
	console.log("addresse du token "+ await TDToken.address)
	console.log("adresse evaluator : "+ await Evaluator.address)
}

async function setPermissionsAndRandomValues(deployer, network, accounts) {
	await TDToken.setTeacher(Evaluator.address, true)
	randomSupplies = []
	randomTickers = []
	for (i = 0; i < 20; i++)
		{
		randomSupplies.push(Math.floor(Math.random()*1000000000))
		randomTickers.push(Str.random(5))
		// randomTickers.push(web3.utils.utf8ToBytes(Str.random(5)))
		// randomTickers.push(Str.random(5))
		}

	console.log(randomTickers)
	console.log(randomSupplies)
	// console.log(web3.utils)
	// console.log(type(Str.random(5)0)
	await Evaluator.setRandomTickersAndSupply(randomSupplies, randomTickers);
}

async function deployRecap(deployer, network, accounts) {
	console.log("TDToken " + TDToken.address)
	console.log("Evaluator " + Evaluator.address)
}

async function myPoints(deployer,network,accounts){
	contract = await TDErc20.at(TDToken.address)
	console.log("Mes points : " + await contract.balanceOf("0xE2d95eDa8e9b71D8B7748c86210dBe5A55b7C279"))
}

// ############################################################################################################

async function Exercice1(deployer,network,accounts) {
	await Evaluator.ex1_getTickerAndSupply()
	// console.log("ticker = " + await Evaluator.readTicker("0xE2d95eDa8e9b71D8B7748c86210dBe5A55b7C279")) //affichage du Ticker et Supply
	// console.log("Supply = " + await Evaluator.readSupply("0xE2d95eDa8e9b71D8B7748c86210dBe5A55b7C279"))
	const tic = await Evaluator.readTicker("0xE2d95eDa8e9b71D8B7748c86210dBe5A55b7C279")
	const sup = await Evaluator.readSupply("0xE2d95eDa8e9b71D8B7748c86210dBe5A55b7C279")
	Montoken = await montokenerc20.new(tic,tic,sup)
	await Evaluator.submitExercice(Montoken.address)

}

//#################################################################################################################

async function Exercice2(deployer,network,accounts){
	await Evaluator.ex2_testErc20TickerAndSupply()

}


//################################################################################################################

async function Exercice3(deployer,network,accounts){
	await Evaluator.ex3_testGetToken()
}


//##############################################################################################################

async function Exercice4(deployer,network,accounts){
	await Evaluator.ex4_testBuyToken()

}


// truffle run verify ERC20TD@0x09f14a40Fd672B5B056FF8b5c343498452CAC4b2 --network goerli
// truffle run verify evaluator@0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5 --network goerli

