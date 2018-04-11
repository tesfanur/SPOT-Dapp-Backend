module.exports = {
networks: {
	contracts_build_directory: "./output",
    development: {
      host: "localhost",
      port: 9545,
      network_id: "*" // Match any network id
    }
  }
};
