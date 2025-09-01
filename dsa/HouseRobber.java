package dsa;

public class HouseRobber {
    public static void main(String[] args) {
        int[] arr = {1, 7, 3, 1};
        System.out.println(rob(arr));
    }

    private static int rob(int[] arr) {
        if (arr == null || arr.length == 0) return 0;
        if (arr.length == 1) return arr[0];

        int prev1 = 0, prev2 = 0;

        for (int num : arr) {
            int temp = prev1;
            prev1 = Math.max(prev1, prev2 + num);
            prev2 = temp;
        }
        return prev1;

    }
}
