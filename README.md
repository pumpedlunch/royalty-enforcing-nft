ETH SF '22 Project: Royalty Enforcing NFT

NFT royalties are currently not required by NFT smart contract code, but rather optional for exchanges that intermediated trades.  
This projects creates an NFT contract uses a decentrally decided, evergreen whitelist of royalty enforcing smart contract exchanges. The criteria for being on the whitelist is based on common sense human language allowing for a variety of exchange formats and address additions and removals from the list are verified by the UMA optimistic oracle. The whitelist is compiled on decentraList which tracks UMA optimistic oracles decisions for onchain reference and incentivizes anyone to keep the list current through financial rewards.

The NFT smart contract is based on Open Zeppelin's ERC721 contract. An onchain, decentrally decided whitelist of royalty enforcing exchanges is created using decentraList. The NFT contract is revised to only allow transfers to be called from whitelisted addresses. Addresses can be added or removed from the whitelist in the future and any changes will be verified by UMA to match the ancillary data provided in the decentraList.

You can find the proof of concept NFT on Opensea at the link below, where transactions, listings and offers will be accepted because it's smart contracts are on the whitelist:
https://testnets.opensea.io/assets/goerli/0x1ee3f199d9653ca51f938aaed88c5515fdcc1451/0

X2Y2 is not on the whitelist and you can find the NFT there at the link below. No transactions, listings or offers can be made:
https://goerli.x2y2.io/eth/0x1eE3F199D9653Ca51F938Aaed88C5515fDcC1451/0