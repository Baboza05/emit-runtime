import { Clarinet, Tx, Chain, Account, types } from 'https://deno.land/x/clarinet@v1.0.0/index.ts';
import { assertEquals } from 'https://deno.land/std@0.170.0/testing/asserts.ts';

Clarinet.test({
  name: "Emit Runtime: User Profile Registration",
  fn(chain: Chain, accounts: Map<string, Account>) {
    const deployer = accounts.get('deployer')!;
    const testUser = accounts.get('wallet_1')!;

    let block = chain.mineBlock([
      Tx.contractCall('emit-runtime-core', 'register-user', 
        [
          types.ascii('combination'), 
          types.list([types.ascii('aging'), types.ascii('texture')]), 
          types.list([types.ascii('anti-aging'), types.ascii('brightening')])
        ], 
        testUser.address)
    ]);

    assertEquals(block.receipts.length, 1);
    assertEquals(block.height, 2);
    block.receipts[0].result.expectOk();
  }
});

Clarinet.test({
  name: "Emit Runtime: Generate Recommendation",
  fn(chain: Chain, accounts: Map<string, Account>) {
    const deployer = accounts.get('deployer')!;
    const testUser = accounts.get('wallet_1')!;

    let block = chain.mineBlock([
      Tx.contractCall('emit-runtime-core', 'generate-recommendation', 
        [
          types.int(25), 
          types.uint(60), 
          types.uint(5)
        ], 
        testUser.address)
    ]);

    assertEquals(block.receipts.length, 1);
    block.receipts[0].result.expectOk();
  }
});