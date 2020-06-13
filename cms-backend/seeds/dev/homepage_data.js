
exports.seed = function (knex) {
  // Deletes ALL existing entries
  return knex('components_pages_homepages').del()
    .then(function () {
      // Inserts seed entries
      return knex('components_pages_homepages').insert([
        {id: 1, Title: 'Testing'},
      ]);

    }).then(function () {

      return knex('components_panels_hero_panels').insert([
        {id: 1, Title: 'This is seed', SubHeading: 'This has come from the seeding file'},
      ]);

    }).then(function () {

      return knex('components_pages_homepages_components').insert([
        {id: 1, field: 'HeroPanel', order: 1, component_type: "components_panels_hero_panels", component_id: 1, components_pages_homepage_id: 1},
      ]);

    }).then(function () {

      return knex('homepages').insert([
        {id: 1, created_at: '2020-06-13 10:02:16.86+00', updated_at: '2020-06-13 10:02:16.86+00'}
      ]);

    }).then(function () {

      return knex('homepages_components').insert([
        {id: 1, field: 'Homepage', order: 1, component_type: 'components_pages_homepages', component_id: 1, homepage_id: 1}
      ]);

    });
};
