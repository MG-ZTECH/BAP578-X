# Performance Considerations

Naive Fleet Inspection:
O(n) RPC calls

Batch Aggregation:
O(1) RPC call + aggregation cost

Benefits:

- Reduced latency
- Lower bandwidth usage
- Consistent snapshot state

BNB-specific:

- Block gas limit modeling
- RPC provider variability handling
- Base fee visibility
