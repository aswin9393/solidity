contract C {
    function f() public view returns (uint256) {
        return msg.sender.balance;
    }
}


contract D {
    C c = new C();

    constructor() payable {}

    function f() public view returns (uint256) {
        return c.f();
    }
}
// ----
// constructor(), 27 wei ->
// gas irOptimized: 114057
// gas irOptimized code: 53800
// gas legacy: 117834
// gas legacy code: 100600
// gas legacyOptimized: 113775
// gas legacyOptimized code: 54800
// f() -> 27
