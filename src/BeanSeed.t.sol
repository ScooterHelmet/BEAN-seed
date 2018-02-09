pragma solidity ^0.4.19;

import "ds-test/test.sol";

import "./BeanSeed.sol";

contract BeanSeedTest is DSTest {
    BeanSeed seed;

    function setUp() public {
        seed = new BeanSeed();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
