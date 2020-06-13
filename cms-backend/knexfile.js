// Update with your config settings.
//
// TODO: Come back and look at this
// Should be able to import the config from strapi and use the settings from that to connect to the database
// Think more bootstrapping needs to be happne for this though
//const config = require("../cms-backend/config/database");

module.exports = {
  client: 'pg',
  connection: {
    database: process.env.DATABASE_NAME || "cms-backend",
    user: process.env.DATABASE_USER || "postgres",
    password: process.env.DATABASE_PASSWORD || "postgres",
  },
  pool: {
    min: 2,
    max: 10
  },
  migrations: {
    tableName: 'knex_migrations'
  },
  seeds: {
    directory: './seeds/dev'
  }
};
