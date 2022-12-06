pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";

contract MonTokenERC20 is ERC20, IExerciceSolution {

constructor(string memory name, string memory symbol,uint256 initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
    }


    function symbol() external view override(ERC20, IExerciceSolution) returns (string memory){
        
    }
    
  function getToken() external override returns (bool){

  }

  function buyToken() external payable override returns (bool){

  }

  function isCustomerWhiteListed(address customerAddress) external override returns (bool){

  }

  function customerTierLevel(address customerAddress) external override returns (uint256){

  }

}