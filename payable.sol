pragma solidity ^0.4.17;

contract mypool{
    address public manager;
    string poolname;
    uint256 poolEndDate;
    uint256 poolAmount;
    
    constructor () public {
        manager = msg.sender;
    }
    
    /*Payer information*/
    struct Payer {
        string name;
        address player;
        uint256 amount;
    }
    
    Payer[] public players;
    /*Entering Pool Information*/
    function enterPoolInfo(string name,uint256 endDate, uint256 amount) public {
        poolname = name;
        poolEndDate = endDate;
        poolAmount = amount;
    }
    /*Player information to join pool*/
    function enter(string name,uint256 amount) public payable {
        
        Payer memory m;
        // players.push(Payer{player:msg.sender,amount:amount});
        m.player = msg.sender;
        m.amount = amount;
        m.name = name;
        players.push(m);
    }
    /*Get number of players who has joined pool*/ 
    function getplayer() public returns (address[]){
        return players;
    }
}