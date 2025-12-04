

# **PayNova (PAYN) – ERC-20 Token**

![ solidity ](https://img.shields.io/badge/Solidity-0.8.30-black?logo=solidity)
![openzeppelin](https://img.shields.io/badge/OpenZeppelin-5.x-blue)
![license](https://img.shields.io/badge/License-MIT-green)
![audit](https://img.shields.io/badge/Security-Audited-success)

---

## 🌐 **Official Links**

### **Website**  
https://pay-nova.org/

### **X.com (Twitter)**  
https://x.com/PayNovaTeam

### **Verified Contract – Sourcify**  
https://repo.sourcify.dev/56/0xeA706e99170E2a0045c80caFA06A2790e2783dd0

### **BscScan – PAYN Token**  
https://bscscan.com/token/0xea706e99170e2a0045c80cafa06a2790e2783dd0

---

## **📌 Overview**

**PayNova (PAYN)** is a next-generation hybrid payments token deployed on the **BNB Smart Chain**, designed to interconnect the worlds of traditional finance and decentralized Web3 ecosystems.

PAYN is a **fixed-supply**, **non-upgradeable**, **zero-fee**, **non-admin** ERC-20 token built with **OpenZeppelin v5.x** for maximum security and stability.

---

## **🔐 Token Summary**

| Property | Value |
|---------|--------|
| **Name** | PayNova |
| **Symbol** | PAYN |
| **Total Supply** | 7,000,000,000 PAYN |
| **Decimals** | 18 |
| **Standard** | ERC-20 |
| **Minting** | Only at deployment |
| **Burnable** | Yes (ERC20Burnable) |
| **Permit (Gasless)** | Yes (EIP-2612 / ERC20Permit) |
| **Supply Cap** | Enforced (ERC20Capped) |
| **Admin Roles** | None |
| **Taxes / Fees** | None |
| **Blacklist / Pause** | None |

---

## **🛠 Features**

### ✔ Fixed Supply  
7B PAYN minted at deployment, no further minting possible.

### ✔ Burnable  
Holders can burn their tokens voluntarily.

### ✔ Permit (EIP-2612)  
Gasless approvals using digital signatures.

### ✔ Non-upgradeable & No Admin  
No owner, no pausing, no minting functions, no governance.

### ✔ Built with OpenZeppelin v5.x  
Secure, modern, auditable framework.

---

## **📄 Smart Contract**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract PAYN is ERC20, ERC20Burnable, ERC20Permit, ERC20Capped {
    uint8 private constant _DECIMALS = 18;

    uint256 public constant MAX_SUPPLY = 7_000_000_000 * (10 ** 18);

    constructor()
        ERC20("PayNova", "PAYN")
        ERC20Permit("PayNova")
        ERC20Capped(MAX_SUPPLY)
    {
        _mint(msg.sender, MAX_SUPPLY);
    }

    function decimals() public pure override returns (uint8) {
        return _DECIMALS;
    }

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Capped)
    {
        super._update(from, to, value);
    }
}
```

---

## **🚀 Deployment & Verification**

### Install Dependencies

```bash
npm install
npm install @openzeppelin/contracts
```

### Deploy to BSC

```bash
npx hardhat run scripts/deploy.js --network bsc
```

### Verify Contract

```bash
npx hardhat verify --network bsc <ADDRESS>
```

---

## **🛡 Security & Audit**

PAYN passed audit with:

- 0 critical issues  
- 0 high issues  
- 0 medium issues  
- 0 low issues  
- Only minor informational suggestions  

---

## **📘 Repository Structure**

```
/contracts
   PAYN.sol
/scripts
   deploy.js
/test
   PAYN.test.js
README.md
hardhat.config.js
package.json
```

---

## **📄 License**

Licensed under the **MIT License**.

---

## **💬 Contact**

For integrations or technical inquiries, contact the PayNova team:  
https://x.com/PayNovaTeam
