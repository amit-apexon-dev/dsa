package dsa;

public class FibonacciDP {

    public static void main(String[] args) {
        System.out.println(fibonacci(3));
    }

    private static int fibonacci(int n) {
        if (n <= 1) {
            return n;
        }
        int[] f = new int[n + 1];
        f[0] = 1;
        f[1] = 1;
        for (int i = 2; i <= n; i++) {
            f[i] = f[i - 1] + f[i - 2];
        }
        return f[n - 1];
    }
}
