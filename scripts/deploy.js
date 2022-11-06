const hre = require("hardhat");
require("dotenv").config();

const LIST_ADDRESS = "0xF4eefd547827c03E671960f2cD8cb9Ba3c5eA264";

// NFT INFO
const NFT_NAME = "Royalties";
const NFT_SYMBOL = "RYLTs";
const RECIPIENT = "0xac21e8867f4EC67fd1c03f0cfFB6c2961fD45a4b";
const URI = "ipfs://QmSdcGkHuLjdag99njmddsvqszccZxYcJhf9NDnzMXy3DV";

async function main() {

  //DEPLOY NFT CONTRACT
  const RoyaltyEnforcingNft = await hre.ethers.getContractFactory("RoyaltyEnforcingNft");
  const royaltyEnforcingNft = await RoyaltyEnforcingNft.deploy(LIST_ADDRESS, NFT_NAME, NFT_SYMBOL);
  await royaltyEnforcingNft.deployed();

  console.log(
    `royaltyEnforcingNft deployed to ${royaltyEnforcingNft.address}`
  );

  //MINT NFT
  const tx1 = await royaltyEnforcingNft.safeMint(RECIPIENT, URI);
  console.log(`mint tx hash = ${tx1.hash}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
