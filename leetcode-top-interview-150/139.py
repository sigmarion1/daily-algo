class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        n = len(s)
        dp = [False] * (n + 1)
        dp[0] = True
        maxLen = max(map(len, wordDict))
        wd = set(wordDict)

        for i in range(1, n + 1):
            for j in range(i - 1, max(-1, i - maxLen - 1), -1):
                if dp[j] and s[j:i] in wd:
                    dp[i] = True
                    break

        return dp[n]
