const HouseTrade = artifacts.require('./HouseTrade.sol');

contract('HouseTrade', function(accounts) {
  it("\nHouseTrade should access HouseTrade contract", function(done) {
     HouseTrade.deployed().then(function(houseTradeContract) {
        var acct = web3.eth.accounts;
        var fromAscii =web3._extend.utils.fromAscii;

        houseTradeContract.registerHouseDetailInfo(fromAscii("Hayat Real State"),fromAscii("123456"),1998,true,fromAscii("Semit"),100,1000000,fromAscii("Residential"))
        houseTradeContract.registerHouseDetailInfo(fromAscii("Tsehay Real State"),fromAscii("654321"),2006,false,fromAscii("CMC"),500,3000000,fromAscii("Office"))
        houseTradeContract.registerHouseDetailInfo(fromAscii("Adran Real State"),fromAscii("754321"),2006,true,fromAscii("CMC"),1000,5000000,fromAscii("Office"))

        return houseTradeContract.getHouseDetailInfoByHouseNum(fromAscii("754321"))
      }).then(function(houseInfo) {
        var toAscii =web3._extend.utils.toAscii;
        //var model = toAscii()
        // console.log("houseInfo",houseInfo);
        console.log("\n"+"house Company:",toAscii(houseInfo[0]) +"\n");
        console.log("house Number:",toAscii(houseInfo[1]) +"\n");
        console.log("house built in:",houseInfo[2] +"\n");
        console.log("Is this house used:",houseInfo[3] +"\n");
        console.log("house price in birr:", houseInfo[4] +"\n");
        console.log("house owner address:",houseInfo[5] +"\n");
        //console.log("house location:",toAscii(houseInfo[6]) +"\n");
        console.log("house area in square meter:",houseInfo[7] +"\n");
        console.log("house price in birr:",houseInfo[8] +"\n");
        console.log("house type:",toAscii(houseInfo[9]) +"\n");
        //assert.equal( typeof houseInfo[0], "String", "house model field type is string");
        //assert.equal(houseInfo[0], web3._extend.utils.toHex("Adran Real State"), "House Owner company is correct");
        // assert.equal(houseInfo[1], "Mitsubishi", "House make is wrong");
        // assert.equal(houseInfo[2], "Galant ES, 2009", "House model is wrong");
        assert.equal(houseInfo[3], true, "This House is used");
        assert.equal(houseInfo[5], accounts[0], "House owner is correct");
        //0x627306090abab3a6e1400e9345bc60c78a8bef57

      });
      done();
      });
});
