namespace galactic.spacefarer;

using { cuid, managed } from '@sap/cds/common';

type SpacesuitColor : String enum {
    White;
    Black;
    Red;
    Orange;
    Yellow;
    Green;
    Blue;
    Purple;
}

entity Planets : cuid, managed {
    name        : String(100) not null;
    description : String(500);
}

entity Departments : cuid, managed {
    name        : String(100) not null;
    description : String(500);
}

entity Positions : cuid, managed {
    name        : String(100) not null;
    description : String(500);

    department  : Association to Departments not null;
}

entity Spacefarers : cuid, managed {
    firstName                   : String(100) not null;
    lastName                    : String(100) not null;
    email                       : String(255) not null;

    @assert.range: [0, 4294967295]
    stardustCollection : Integer64 default 0;

    @assert.range: [0, 100]
    wormholeNavigationSkill : Integer default 0;

    originPlanet                : Association to Planets not null;
    department                  : Association to Departments not null;
    position                    : Association to Positions not null;

    spacesuitColor              : SpacesuitColor not null;
}