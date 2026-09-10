using { galactic.spacefarer as db } from '../db/schema';

@requires: 'authenticated-user'
service GalacticService {

@odata.draft.enabled
entity Spacefarers 
    @(restrict: [{
        grant: '*',
        to: 'authenticated-user',
        where: 'originPlanet.ID = $user.planet'
    }])
    as projection on db.Spacefarers {
        *,

        (firstName || ' ' || lastName) as fullName : String(201),
        (position.name || ', ' || originPlanet.name) as workTitle : String (202),

        case
            when stardustCollection < 10000 then 'Low'
            when stardustCollection < 100000 then 'Moderate'
            when stardustCollection < 1000000 then 'High'
            else 'Legendary'
        end as stardustStatus : String(20),

        case
            when stardustCollection < 10000 then 0
            when stardustCollection < 100000 then 3
            when stardustCollection < 1000000 then 5
            else 2
        end as stardustCriticality : Integer
    };
    entity Planets as projection on db.Planets;
    entity Departments as projection on db.Departments;
    entity Positions as projection on db.Positions;
    
    @readonly
    entity SpacesuitColors as projection on db.SpacesuitColors;
}