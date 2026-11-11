
// ================================================
// ATIDADE ÀṢ FASHION STORE
// PORTFOLIO 4: NOSQL IMPLEMENTATION
// MongoDB JavaScript Operations
// ================================================

const { MongoClient } = require("mongodb");

// Load MongoDB connection string from environment variables
require("dotenv").config();

const uri = process.env.MONGODB_URI;

const client = new MongoClient(uri);

async function main() {
  try {
    // Connect to MongoDB Atlas
    await client.connect();
    console.log("Connected successfully to MongoDB Atlas");

    // Select database
    const database = client.db("atidade_aso");

    // Select collections
    const products = database.collection("products");
    const customers = database.collection("customers");
    const orders = database.collection("Orders");
    const payments = database.collection("payments");
    const inventory = database.collection("inventory");

    // ============================================
    // 1. CREATE - Insert a product document
    // ============================================

    const productResult = await products.insertOne({
      product_name: "Sample Hoodie",
      category: "Hoodies",
      base_price: 35000,
      status: "active",
      variants: [
        {
          size: "M",
          colour: "Black",
          sku: "AT-HOOD-BLK-M",
          stock: 10
        }
      ]
    });

    console.log("Product inserted:", productResult.insertedId);

    // ============================================
    // 2. READ - Retrieve a product
    // ============================================

    const product = await products.findOne({
      product_name: "Sample Hoodie"
    });

    console.log("Retrieved product:", product);

    // ============================================
    // 3. UPDATE - Change product price
    // ============================================

    const updateResult = await products.updateOne(
      { product_name: "Sample Hoodie" },
      { $set: { base_price: 37000 } }
    );

    console.log("Product update result:", updateResult.modifiedCount);

    // ============================================
    // 4. DELETE - Remove sample product
    // ============================================

    const deleteResult = await products.deleteOne({
      product_name: "Sample Hoodie"
    });

    console.log("Product delete result:", deleteResult.deletedCount);

    // ============================================
    // 5. QUERY - Find low-stock inventory
    // ============================================

    const lowStockItems = await inventory.find({
      quantity_on_hand: { $lt: 20 }
    }).toArray();

    console.log("Low-stock inventory:", lowStockItems);

    // ============================================
    // 6. READ CUSTOMER, ORDER AND PAYMENT
    // ============================================

    const customer = await customers.findOne({
      email: "grace.customer@example.com"
    });

    const order = await orders.findOne({
      order_reference: "AT-ORDER-0003"
    });

    const payment = await payments.findOne({
      payment_reference: "AT-PAY-0003"
    });

    console.log("Customer:", customer);
    console.log("Order:", order);
    console.log("Payment:", payment);

    // ==========================================
    // 7. DISTRIBUTED DATABASE REPLICATION TEST
    // ==========================================

    console.log("\n--- REPLICATION TEST ---");

    const replicationCollection = database.collection("replication_test");

    const testId = `replication-test-${Date.now()}`;

    // Write a test document with majority acknowledgement
    const replicationWrite = await replicationCollection.insertOne(
      {
        test_id: testId,
        message: "ATIDADE AṢ replica set replication test",
        created_at: new Date()
      },
      {
        writeConcern: { w: "majority" }
      }
    );

    console.log("Majority write acknowledged:", replicationWrite.acknowledged);

    // Read the document from a secondary replica
   const secondaryCollection = database.collection("replication_test", {
  readPreference: "secondary"
});
    let secondaryResult = null;

    for (let attempt = 1; attempt <= 10; attempt++) {
      secondaryResult = await secondaryCollection.findOne({ test_id: testId });

      if (secondaryResult) {
        break;
      }

      await new Promise(resolve => setTimeout(resolve, 1000));
    }

    console.log("Secondary replica read:", secondaryResult);


    // ==========================================
    // 8. REPLICA SET CONFIGURATION TEST
    // ==========================================

    console.log("\n--- REPLICA SET CONFIGURATION ---");

    const replicaStatus = await client.db("admin").command({
      replSetGetStatus: 1
    });

    console.log("Replica set name:", replicaStatus.set);
    console.log(
      "Replica set members:",
      replicaStatus.members.map(member => ({
        name: member.name,
        state: member.stateStr
      }))
    );

  } catch (error) {
    console.error("MongoDB operation failed:", error);
  } finally {
    // Close database connection
    await client.close();
  }
}

main();
