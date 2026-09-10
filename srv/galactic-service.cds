using { galactic.spacefarer as db } from '../db/schema';

@requires: 'authenticated-user'
service GalacticService {

    entity Spacefarers
        @(restrict: [{
            grant: '*',
            to: 'authenticated-user',
            where: 'originPlanet.ID = $user.planet'
        }])
    as projection on db.Spacefarers;
    entity Planets as projection on db.Planets;
    entity Departments as projection on db.Departments;
    entity Positions as projection on db.Positions;
}