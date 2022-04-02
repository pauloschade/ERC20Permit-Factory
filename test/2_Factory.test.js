const { BN, constants, expectEvent, expectRevert, time } = require('@openzeppelin/test-helpers');
const truffleAssert = require("truffle-assertions");
const PermitFactory = artifacts.require("./PermitFactory");

contract('PermitFactory', function (accounts) {
    const [ owner, spender, recipient, other ] = accounts;
    var factory;

    beforeEach(async function () {
        factory = await PermitFactory.new();
    });

    describe("token creation", () => {
        const name = 'My Token';
        const symbol = 'MTKN';
        const version = "V3";
        const initialSupply = new BN(100);
        it("creates a token", () => {
            truffleAssert.passes(factory.createPermit(name, symbol, version, initialSupply, {from: owner}));
        })
        it("rejects creation from account other than owner", () => {
            truffleAssert.fails(factory.createPermit(name, symbol, version, initialSupply, {from: spender}));
        })
    })
});