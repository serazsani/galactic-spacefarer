using { galactic.spacefarer as db } from '../db/schema';

service GalacticService {

    entity Spacefarers  as projection on db.Spacefarers;
    entity Planets      as projection on db.Planets;
    entity Departments  as projection on db.Departments;
    entity Positions    as projection on db.Positions;

}