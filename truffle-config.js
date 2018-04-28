var HDWalletProvider = require("truffle-hdwallet-provider");

var infuraApiKey ="W4IUplUfqq7jZvqdw30Y";
var mnemonic = "luggage stereo position stay funny birth dust fire oil barely cabin wait";

module.exports = {
networks: {
	//contracts_build_directory: "./output",
  //   development: {
  //     host: "127.0.0.1",
  //     port: 9545,
  //     network_id: "*" // Match any network id
  //   },
  // ganache: {
  //   host: "127.0.0.1",
  //    gas: 4700000,
  //   port: 7545,
  //   network_id: "*" // matching any id
  // },
  ganache: {
    host: "127.0.0.1",
     //gas: 4700000,
    port: 8545,
    network_id: "40" // matching id = 40
  },
    ropsten: {
      provider:()=> new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infuraApiKey)
       ,
      network_id: 3
    },
    rinkeby: {
     host: "127.0.0.1",
      gas: 4700000,
     port: 8545,
     network_id: 4
   }
  },
//  rpc: {
//  host: 'localhost',
//  post:8080
// },
mocha: {
useColors: true
}
};
