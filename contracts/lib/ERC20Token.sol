/*

    Copyright 2017 Loopring Project Ltd (Loopring Foundation).

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/
pragma solidity ^0.8.3;

import "./ERC20.sol";

/// @title ERC20 Token Implementation
/// @dev see https://github.com/ethereum/EIPs/issues/20
contract ERC20Token is ERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply_;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) internal allowed;

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    // constructor(
    //     string memory _name,
    //     string memory _symbol,
    //     uint8 _decimals,
    //     uint256 _totalSupply,
    //     address _firstHolder
    // ) {
    //     require(_totalSupply > 0);
    //     require(_firstHolder != address(0x0));
    //     // checkSymbolAndName(_symbol, _name);

    //     name = _name;
    //     symbol = _symbol;
    //     decimals = _decimals;
    //     totalSupply_ = _totalSupply;

    //     balances[_firstHolder] = totalSupply_;
    // }

    constructor (string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
    }
    /**
     * @dev total number of tokens in existence
     */
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    /**
     * @dev transfer token for a specified address
     * @param _receiver The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _receiver, uint256 _value) public returns (bool) {
        require(_receiver != address(0),"Error:transfer to zero address");
        require(_value <= balances[msg.sender], "Error: not enough balance" );

        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_receiver] = balances[_receiver] + _value;
        emit Transfer(msg.sender, _receiver, _value);
        return true;
    }

    function balanceOf(address _wallet) public view returns (uint256 balance) {
        return balances[_wallet];
    }

    /**
     * @dev Transfer tokens from one address to another
     * @param _sender address The address which you want to send tokens from
     * @param _receiver address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(
        address _sender,
        address _receiver,
        uint256 _value
    ) public returns (bool) {
        require(_sender != address(0),"Error:send from zero address");
        require(_sender != _receiver,"Error:send to self");
        require(_value <= balances[_sender],"Error: not enough balances");
        require(_value <= allowed[_sender][msg.sender],"Error:need to approve");

        balances[_sender] = balances[_sender] - _value;
        balances[_receiver] = balances[_receiver] + _value;
        allowed[_sender][msg.sender] = allowed[_sender][msg.sender] - _value;
        emit Transfer(_sender, _receiver, _value);
        return true;
    }

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     *
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * @param _spender The address which will spend the funds.
     * @param _value The amount of tokens to be spent.
     */
    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_spender != address(0),"Error:approve to the zero address");
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param _owner address The address which owns the funds.
     * @param _spender address The address which will spend the funds.
     * @return allowed uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256)
    {
        return allowed[_owner][_spender];
    }
}
