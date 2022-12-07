pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";

contract MonTokenERC20 is ERC20, IExerciceSolution {

constructor(string memory name, string memory symbol,uint256 initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
    }


    function symbol() public view override(ERC20, IExerciceSolution) returns (string memory){
        return ERC20.symbol();
    }
    
  function getToken() external override returns (bool){
    _mint(msg.sender,100000);
    return true;


  }

  function buyToken() external payable override returns (bool){
    

  }

  function isCustomerWhiteListed(address customerAddress) external override returns (bool){

  }

  function customerTierLevel(address customerAddress) external override returns (uint256){

  }

}