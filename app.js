var keythereum = require("keythereum");
var EthUtil = require("ethereumjs-util");

var hexToBytes = function(hex){
	for(var bytes=[],c=0;c<hex.length;c+=2){
		bytes.push(parseInt(hex.substr(c,2),16));}
		return bytes;
}

var privateKeyToAddress= function(privateKey){
	return `0x${EthUtil.privateToAddress(hexToBytes(privateKey)).toString('hex')}`;
}

console.log(privateKeyToAddress(process.argv[2]));

/*use the following commands for testing private public pair generation

truffle(develop)> web3.sha3("Tesfaye Belachew Abebe")
'0x0e0b917bff51b776a3f2e9d8d4a32e9a1cca8921674dab2f6f3a3fefe3ec6fe4'//private key

$ node ./app.js 0e0b917bff51b776a3f2e9d8d4a32e9a1cca8921674dab2f6f3a3fefe3ec6fe4
0xc57f069cc330a43565c18c67b7b84a75acb83293//public key

*/
