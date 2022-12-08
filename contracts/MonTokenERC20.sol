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

    uint256 before_balance = balanceOf(msg.sender);

    _mint(msg.sender,100000);

    uint256 after_balance = balanceOf(msg.sender);

    return before_balance < after_balance;
  }

  function buyToken() external payable override returns (bool){

    uint256 palier = 0.00001 ether;

    require(msg.value > palier , "pas assez d'eth envoyer, min 1 token");

    uint256 before_balance = balanceOf(msg.sender);
    _mint(msg.sender , SafeMath.mul(100000,msg.value));
    uint256 after_balance = balanceOf(msg.sender);

    return after_balance > before_balance;

  }

  function isCustomerWhiteListed(address customerAddress) external override returns (bool){

  }

  function customerTierLevel(address customerAddress) external override returns (uint256){

  }

}