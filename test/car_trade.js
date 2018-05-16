const CarTrade = artifacts.require('./CarTrade.sol');
const EthCrypto = require('eth-crypto');

const identity = EthCrypto.createIdentity();
const publicKey = EthCrypto.publicKeyByPrivateKey(
      '0x107be946709e41b7895eea9f2dacf998a0a9124acbb786f0fd1a826101581a07'
  );

contract('CarTrade', function(accounts) {
  it("\nCarTrade should access CarTrade contract", function(done) {
    console.log("publicKey",publicKey); //use this module to create public keys for assets
     CarTrade.deployed().then(function(carTradeContract) {
        var acct = web3.eth.accounts;

        carTradeContract.registerCarDetailInfo("Corolla","1M2GDM9AXKP052787",2001,true,"Hyundi","China","http://www.hyundi.com",360000,{from:acct[0]})
        carTradeContract.registerCarDetailInfo("Corolla","1M8GDM9AXKP042788",2001,true,"Ford","Japan","http://www.ford.com",350000,{from:acct[1]})
        carTradeContract.registerCarDetailInfo("Lambrigini","2A8GDM9AXKP042789",2009,true,"Marchedes","France","http://www.marchedes.com",750000,{from:acct[2]})
        carTradeContract.registerCarDetailInfo("Prado","3B8GDM9AXKP042787",2015,true,"Iveco","USA","http://www.iveco.com",56000,{from:acct[3]})
        carTradeContract.registerCarDetailInfo("V8","4C8GDM9AXKP042786",2006,true,"Toyota","UK","http://www.toyota.com",550000,{from:acct[4]})
        carTradeContract.registerCarDetailInfo("TOYOTA","1M8GDM8AXMP042790",2001,true,"Ford","Japan","http://www.toyota.com",560000,{from:acct[5]})
        carTradeContract.registerCarDetailInfo("VITZ","1M8GDE8AXMP041791",2012,true,"Marchedes","china","http://www.vitz.com",850000,{from:acct[6]})
        carTradeContract.registerCarDetailInfo("MARCHEDES","1M8LDE8AXMP041791",2015,true,"Iveco","USA","http://www.marchedes.com",4550000,{from:acct[7]})
        carTradeContract.registerCarDetailInfo("LANDCRUZER","5C8JDM9AYKP042792",2003,true,"Toyota","USA","http://www.landcruzer.com",9550000,{from:acct[8]})

        return carTradeContract.getCarDetailInfoByVinNum("1M8GDE8AXMP041791")
      }).then(function(carInfo) {
        var toAscii =web3._extend.utils.toAscii;
        //var model = toAscii()
        console.log("car Model:",toAscii(carInfo[0]) +"\n");
        console.log("car Vin Number:",toAscii(carInfo[1]) +"\n");
        console.log("Is car used?:",carInfo[2] +"\n");
        console.log("car manufactured year:",carInfo[3] +"\n");
        console.log("car owner ethereum account address:",carInfo[4] +"\n");
        console.log("car price in birr:",carInfo[5] +"\n");
        console.log("car brand name:",toAscii(carInfo[6]) +"\n");
        console.log("car made in:",toAscii(carInfo[7]) +"\n");
        console.log("car manufacturers website address:",toAscii(carInfo[8]) +"\n");
        console.log("type of car mode info:",typeof carInfo[0] +"\n");
        //assert.equal( typeof carInfo[0], "String", "Car model field type is string");
      });
      done();
      });

});
