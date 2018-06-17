 const User = artifacts.require('./User.sol');


contract('User', function(accounts) {
  var acct = web3.eth.accounts;
  //console.log(acct);
  var fromAscii =web3._extend.utils.fromAscii;
  var toAscii =web3._extend.utils.toAscii;
  var fromweiToEther=web3._extend.utils.fromWei;
  var toAscii =web3._extend.utils.toAscii;

  it("User Contract should List all users registerd on blockchain", function(done) {
     User.deployed().then(function(UserContract) {
        //UserContract =UserContract;

        UserContract.register("Meheret","Tesfaye","Agena","get.meheret.tesfaye@gmail.com","meheret",{from:acct[0]});
        UserContract.register("Tesfaye","Belachew","Abebe","get.tesfaye.belachew@gmail.com","tesfanur",{from:acct[1]});
        UserContract.register("Yared","Taye","Benti","get.yared.taye@gmail.com","gune",{from:acct[2]});
        UserContract.register("Sisay","Belachew","Abebe","get.sisay.belachew@gmail.com","belsti",{from:acct[3]});
        UserContract.register("Ejigayew","Belachew","Abebe","get.ejigayew.belachew@gmail.com","mango",{from:acct[4]});
        UserContract.register("Netsanet","Belachew","Abebe","get.netsanet.belachew@gmail.com","mitu",{from:acct[5]});
        UserContract.register("Yirga","Badima","Agena","get.yirga.badima@gmail.com","yirgalem",{from:acct[6]});
        UserContract.register("Dawit","Jemberu","Agena","get.dawit.jemberu@gmail.com","dave",{from:acct[7]});
        UserContract.register("Redamichael","Jemberu","Agena","get.redamichael.jemberu@gmail.com","reda",{from:acct[8]});
        UserContract.register("Mebratu","T/Haimanot","Agena","get.mebratu.thaimanot@gmail.com","mebre",{from:acct[9]});

        return UserContract.getAllUsers()//returns array of user objects
      }).then(function(users) {
      console.log(users);
        // var counter =0;
        // var userInfo = "\n"+counter +". "+ "User Account Address" +" "+
        //    "First Name" +" "+
        //    "Second Name" +" "+
        //    "Last Name" +" "+
        //    "Email" +" "+
        //     "Username";
        // console.log(userInfo +"\n")
        //
        // for(var i =0; i<users[0].length;i++){
        //   counter++;
        //     userInfo = "\n"+counter +". "+ users[0][i] +" "+
        //     toAscii(users[1][i]) +" "+
        //     toAscii(users[3][i]) +" "+
        //     toAscii(users[2][i]) +" "+
        //     toAscii(users[4][i]) +" "+
        //     toAscii(users[5][i]);
        //     assert.equal(accounts[0], users[0][0], "Coinbase address is "+users[0][0]);
        //     console.log(userInfo +"\n")
        //   }//end of for loop
     });//end of then function
      done();
   });//end of it function

 });//end of contract function block
