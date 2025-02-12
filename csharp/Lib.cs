using System.Runtime.InteropServices;

namespace csharp;

public static class Lib {

    [UnmanagedCallersOnly(EntryPoint = "add")]
    public static int add(int n1, int n2) {
        return n1 + n2;
    }
}
