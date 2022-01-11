pragma solidity ^0.7.0;

contract Token {
    string public name = "My HardHat Token";
    string public symbol = "MHT";

    //The fixed amount of tokens stored in an unsigned integer type variable.
    uint256 public totalSupply = 1000000;

    address public owner;

    //A mapping is a key/value map. Here we store each account balance.
    mapping(address => uint256) balances;

    /**
    * A function to transfer tokens.
    *
    * The `external` modifier makes a function *only* callable from outside the contract.
     */
    function transfer(address to, uint256 amount) external {
        //Check if the transaction sender has enough tokens.
        //If `require`'s first argument evaluates to `false` then the transaction will revert.
        require(balances[msg.sender] >= amount, "Not enough tokens");

        //Transfer the amount.
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
        /**
        * Read only function to retrieve the token balance of a given account.
        * The `view` modifier indicates that it doesn't modify the contract's
        * state, which allows us to call it without executing a transaction.
         */

         function balanceOf(address account) external view returns (uint256) {
             return balances[account];
    }
    
}