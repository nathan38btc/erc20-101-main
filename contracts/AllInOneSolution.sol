pragma solidity ^0.6.0;
import "./IAllInOneSolution.sol";

contract AllInOneSolution is IAllInOneSolution{

    address _evaluator;
    address _tdtoken;

    constructor(address evaluator,address tdtoken) public {
        _evaluator = evaluator;
        _tdtoken = tdtoken;

    }

    function completeWorkshop() external override{

        
    }
}