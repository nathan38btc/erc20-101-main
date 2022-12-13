# erc20-101-main

My solution to the evaluator.sol contract is "MonTokenERC20.sol" and "AllInOneSolution.sol".

"MonTokenERC20.sol" is deployed by "1_td_deploy.js". Each Exercice is called one by one by the deployement file.

"AllInOneSolution.sol" is deployed by "2_allInOne.js". The deployement file only call the execute() fonction of "AllInOneSolution.sol" which will call the Evaluator contract and resolve the exercice all in one fonction.
