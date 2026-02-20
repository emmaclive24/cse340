# CSE 340 – Project Setup

## Installation
```bash
pnpm install
```

## Environment Variables
Create a `.env` file in the root with:
```
DATABASE_URL=your_connection_string
ACCESS_TOKEN_SECRET=your_secret_string
SESSION_SECRET=your_session_secret
PORT=5500
```

## Seed Test Accounts
After running `pnpm install` and configuring your `.env`, run the seed script once to insert the three required test accounts:

```bash
node database/seed-test-accounts.js
```

This will insert:
| Name | Email | Password | Type |
|---|---|---|---|
| Basic Client | basic@340.edu | I@mABas1cCl!3nt | Client |
| Happy Employee | happy@340.edu | I@mAnEmpl0y33 | Employee |
| Manager User | manager@340.edu | I@mAnAdm!n1strat0r | Admin |

The script is safe to run multiple times – it skips accounts that already exist.

## Run the Server
```bash
pnpm run dev
```
