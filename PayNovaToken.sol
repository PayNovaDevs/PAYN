// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

/**
 * @title PayNova (PAYN)
 * @notice The future of hybrid payments is here.
 *
 *         An account that combines the traditional financial world and Web3.
 *         Remittances, international Mastercard and crypto or fiat payments 
 *         from a single app.
 *
 * @dev  Fixed-supply (capped) ERC-20 token without fees, blacklists, or pause.
 *       The entire supply of 7,000,000,000 PAYN is minted at deployment to the 
 *       deployer (`msg.sender`).
 *
 *       Based on OpenZeppelin v5.x. Implements:
 *         - ERC20
 *         - ERC20Burnable
 *         - ERC20Permit (EIP-2612)
 *         - ERC20Capped
 *
 *       No additional minting after deployment.
 *       No taxes, fees, blacklist, or pause.
 *
 * @custom:decimals 18
 * @custom:symbol PAYN
 * @custom:name PayNova
 * @custom:supply 7_000_000_000 * 10^18
 * @custom:network BNB Smart Chain (EVM)
 * @custom:brand PayNova – Hybrid Payments Infrastructure
 */
contract PAYN is ERC20, ERC20Burnable, ERC20Permit, ERC20Capped {
    uint8 private constant _DECIMALS = 18;

    /// @notice Maximum (capped) supply in smallest unit (18 decimals).
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
