contract C {
    uint32[] s;
    constructor()
    {
        s.push();
        s.push();
    }
    function f() external returns (uint)
    {
        (s[1], s) = (4, [0]);
        s = [0];
        s.push();
        return s[1];
        // used to return 4 via IR.
    }
}
// ----
// constructor()
// gas irOptimized: 225911
// gas legacy: 215753
// gas legacyOptimized: 181756
// f() -> 0
