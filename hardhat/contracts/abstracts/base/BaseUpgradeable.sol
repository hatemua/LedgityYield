// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {RestrictableUpgradeable} from "../RestrictableUpgradeable.sol";
import {RecoverableUpgradeable} from "../RecoverableUpgradeable.sol";
import {PausableUpgradeable} from "../pausable/PausableUpgradeable.sol";
import {OwnableUpgradeable} from "../OwnableUpgradeable.sol";

abstract contract BaseUpgradeable is
    Initializable,
    UUPSUpgradeable,
    OwnableUpgradeable,
    PausableUpgradeable,
    RestrictableUpgradeable,
    RecoverableUpgradeable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    /**
     * @dev Initializer function ...
     */
    function __Base_init() internal onlyInitializing {
        __UUPSUpgradeable_init_unchained();
        __Pausable_init_unchained();
        __Ownable_init_unchained();
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}