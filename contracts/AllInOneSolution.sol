pragma solidity ^0.6.0;
import "./IAllInOneSolution.sol";
import "./Evaluator.sol";
import "./MonTokenERC20.sol";

contract AllInOneSolution is IAllInOneSolution{

    Evaluator public evaluator;
    address public _tdtoken;

    constructor(address payable evaluatoraddress,address tdtoken) public {

        evaluator = Evaluator(evaluatoraddress);
        _tdtoken = tdtoken;



    }

    function execute() public {
        evaluator.ex10_allInOne();
    }

    function completeWorkshop() external override{ 

        //Exercice 1 :
        // assignation of the ticker and supply
        evaluator.ex1_getTickerAndSupply();

        //recuperation of ticker and supply
        string memory ticker = evaluator.readTicker(address(this));
        uint256 supply = evaluator.readSupply(address(this));

        //creation of the ERC20 token
        MonTokenERC20 mytoken = new MonTokenERC20(ticker,ticker,supply);

        // call for getting points
        evaluator.submitExercice(mytoken);

        //Exercice 2 :
        
        evaluator.ex2_testErc20TickerAndSupply();

        //Exercice 3 : 
        mytoken.setwhitelisted(address(evaluator), true);
        evaluator.ex3_testGetToken();

        //Exercice 4 :

        mytoken.setwhitelisted(address(evaluator), true);
        mytoken.setTierCustomers(address(evaluator), 1);

        evaluator.ex4_testBuyToken();

        //Exercice 5 :
        mytoken.setwhitelisted(address(evaluator),false );
        evaluator.ex5_testDenyListing();

        //Exercice 6 :
        mytoken.setwhitelisted(address(evaluator), true);
        evaluator.ex6_testAllowListing();

        //Exercice 7 :
        mytoken.setTierCustomers(address(evaluator), 0);
        mytoken.setwhitelisted(address(evaluator), false);

        evaluator.ex7_testDenyListing();

        //Exercice 8 :
        mytoken.setTierCustomers(address(evaluator), 1);
        mytoken.setwhitelisted(address(evaluator), true);

        evaluator.ex8_testTier1Listing();

        //Exercice 9 :
        mytoken.setTierCustomers(address(evaluator), 2);
        mytoken.setwhitelisted(address(evaluator), true);

        evaluator.ex9_testTier2Listing();


    }
}