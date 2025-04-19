# NFT Tools

Welcome to the NFT Tools project! This repository contains tools for managing and monitoring network traffic using nftables.

## Features

* 🚀 Easy to configure and use
* 🔒 Supports IPv4 and IPv6
* 🌐 Monitors network traffic and blocks malicious activities
* 📊 Logs events for analysis

## Configuration

### `nft-blocklist.conf`

The `nft-blocklist.conf` file is used to configure the blocklist settings. It includes sections for general settings, URLs for blocklists, whitelist IPs, and more.

### `nft-blockmon.conf`

The `nft-blockmon.conf` file is used to configure the monitoring settings. It includes sections for general settings, monitoring interfaces, DDoS protection, whitelists, blacklists, and more.

## Usage

1. Clone the repository:
   ```sh
   git clone https://github.com/Zhuul/nft-tools.git
   ```

2. Navigate to the project directory:
   ```sh
   cd nft-tools
   ```

3. Edit the configuration files as needed:
   * `conf/nft-blocklist.conf` (`conf/nft-blocklist.conf`)
   * `conf/nft-blockmon.conf` (`conf/nft-blockmon.conf`)

4. Run the tools:
   ```sh
   ./nft-blocklist
   ./nft-blockmon
   ```

## 🚀 Quick Install & Uninstall

**Install in one line** 🛠️:
```sh
curl -sSL https://raw.githubusercontent.com/Zhuul/nft-tools/main/install-nft-tools.sh \
  | sudo bash -s install
```

**Uninstall in one line** 🧹:
```sh
curl -sSL https://raw.githubusercontent.com/Zhuul/nft-tools/main/install-nft-tools.sh \
  | sudo bash -s uninstall
```

## Contributing

We welcome contributions! Please fork the repository and submit pull requests.

## License

This project is licensed under the MIT License.

