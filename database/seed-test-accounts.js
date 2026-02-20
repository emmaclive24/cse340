/* ************************************************************
 * Seed Script – Insert the three required CSE 340 test accounts
 * Run ONCE from the project root: node database/seed-test-accounts.js
 * Make sure your .env file is configured before running.
 * ************************************************************ */
require("dotenv").config()
const bcrypt = require("bcryptjs")
const pool   = require("./index")

const accounts = [
  {
    account_firstname: "Basic",
    account_lastname:  "Client",
    account_email:     "basic@340.edu",
    account_password:  "I@mABas1cCl!3nt",
    account_type:      "Client",
  },
  {
    account_firstname: "Happy",
    account_lastname:  "Employee",
    account_email:     "happy@340.edu",
    account_password:  "I@mAnEmpl0y33",
    account_type:      "Employee",
  },
  {
    account_firstname: "Manager",
    account_lastname:  "User",
    account_email:     "manager@340.edu",
    account_password:  "I@mAnAdm!n1strat0r",
    account_type:      "Admin",
  },
]

async function seed() {
  try {
    for (const acct of accounts) {
      // Skip if already inserted
      const check = await pool.query(
        "SELECT account_id FROM account WHERE account_email = $1",
        [acct.account_email]
      )
      if (check.rows.length > 0) {
        console.log(`⚠️  Account already exists: ${acct.account_email} – skipping`)
        continue
      }

      const hashedPassword = await bcrypt.hash(acct.account_password, 10)
      await pool.query(
        `INSERT INTO account
           (account_firstname, account_lastname, account_email, account_password, account_type)
         VALUES ($1, $2, $3, $4, $5)`,
        [
          acct.account_firstname,
          acct.account_lastname,
          acct.account_email,
          hashedPassword,
          acct.account_type,
        ]
      )
      console.log(`✅  Inserted: ${acct.account_email} (${acct.account_type})`)
    }
    console.log("\nDone! You can now log in with the test accounts.")
    process.exit(0)
  } catch (err) {
    console.error("Seed error:", err.message)
    process.exit(1)
  }
}

seed()
