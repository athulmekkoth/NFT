// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721 ,Ownable{
    uint256 public mintPrice;
    uint256 public totalsupply;
        uint256 public maxSupply;
uint public maxPerwallet;
bool public isPublicMintEnabled;
address payable public withdrawWallet;
string internal baseTokenUrl ; //wehere iamge located
mapping(address=>uint256) public walletMint; //to keep track of all mint be done

constructor()payable ERC721('RoboPunks','RP'){ //first ar name ans 2nd symbol
    mintPrice=0.2 ether;
    totalsupply=0;
    maxSupply=1000;
    maxPerwallet=3;
    
}
function  setIsPublicMintEnable(bool isPublicMintEnabled_)  external onlyOwner{
    //owner deplyer default
    isPublicMintEnabled=isPublicMintEnabled_;

}
function setBaseToken(string calldata baseTokenUrl_) external onlyOwner{
    baseTokenUrl=baseTokenUrl_;//url where img located
}  
//below functionnalready exist 
//In summary, abi.encodePacked is used to concatenate the base token URL and the token ID into a single byte array, and Strings.toString is used to convert the token ID to a string before concatenation.




function tokenURI(uint256 tokenid_) public view override returns(string memory)
{
    require(_exists(tokenid_),"token doen not extst");
    return string(abi.encodePacked(baseTokenUrl,Strings.toString(tokenid_),".json"));
}
function withdraw() external onlyOwner{
    (bool success,)=withdrawWallet.call{ value:address(this).balance}(''); //grab fund
    require(success,"withdraw failed");
} 
//mintPrice
function mint(uint quantity)public payable{
    require(isPublicMintEnabled,"minting not enabled");
    require(msg.value == quantity *mintPrice,"wrong mint value");
    require(totalsupply*quantity <= maxSupply,"soldout");
    require(walletMint[msg.sender]*quantity<=maxPerwallet,"exceeded max wallet");

    for(uint256 i=0;i<quantity;i++)
    {
        uint256 newTokenId= totalsupply+1;
        totalsupply++;
        _safeMint(msg.sender,newTokenId);//erc271
    }



}

}