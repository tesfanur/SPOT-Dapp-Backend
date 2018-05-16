 const User = artifacts.require('./User.sol');
contract('User', function(accounts) {
  it("\nUser Contract should List all users registerd on blockchain", function(done) {
     User.deployed().then(function(User) {
        var acct = web3.eth.accounts;
        var fromAscii =web3._extend.utils.fromAscii;

        User.register("Meheret","Tesfaye","Agena","get.meheret.tesfaye@gmail.com","meheret",{from:acct[0]});
        User.register("Tesfaye","Belachew","Abebe","get.tesfaye.belachew@gmail.com","tesfanur",{from:acct[1]});
        User.register("Yared","Taye","Benti","get.yared.taye@gmail.com","gune",{from:acct[2]});
        User.register("Sisay","Belachew","Abebe","get.sisay.belachew@gmail.com","belsti",{from:acct[3]});
        User.register("Ejigayew","Belachew","Abebe","get.ejigayew.belachew@gmail.com","mango",{from:acct[4]});
        User.register("Netsanet","Belachew","Abebe","get.netsanet.belachew@gmail.com","mitu",{from:acct[5]});
        User.register("Yirga","Badima","Agena","get.yirga.badima@gmail.com","yirgalem",{from:acct[6]});
        User.register("Dawit","Jemberu","Agena","get.dawit.jemberu@gmail.com","dave",{from:acct[7]});
        User.register("Redamichael","Jemberu","Agena","get.redamichael.jemberu@gmail.com","reda",{from:acct[8]});
        User.register("Mebratu","T/Haimanot","Agena","get.mebratu.thaimanot@gmail.com","mebre",{from:acct[9]});

        return User.getAllUsers();
      }).then(function(users) {
        var counter =0;
        var userInfo = "\n"+counter +". "+ "User Account Address" +" "+
           "First Name" +" "+
           "Second Name" +" "+
           "Last Name" +" "+
           "Email" +" "+
            "Username";
        console.log(userInfo +"\n")

        for(var i =0; i<users[0].length;i++){
          counter++;

          var toAscii =web3._extend.utils.toAscii;
            userInfo = "\n"+counter +". "+ users[0][i] +" "+
            toAscii(users[1][i]) +" "+
            toAscii(users[3][i]) +" "+
            toAscii(users[2][i]).trim() +" "+
            toAscii(users[4][i]).trim() +" "+
            toAscii(users[5][i]).trim();
            assert.equal(accounts[0], users[0][0], "Coinbase address is "+users[0][0]);
            console.log(userInfo +"\n")
          }
          done();
      });
      });

});
