using GalacticService as service from '../../srv/galactic-service';
annotate service.Spacefarers with @(
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Spacefarer',
        TypeNamePlural : 'Spacefarers',
        Title : {
            $Type : 'UI.DataField',
            Value : fullName,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : workTitle,
        },
    },
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
		Data : [
			{
				$Type : 'UI.DataField',
				Label : 'First Name',
				Value : firstName,
			},
			{
				$Type : 'UI.DataField',
				Label : 'Last Name',
				Value : lastName,
			},
			{
				$Type : 'UI.DataField',
				Label : 'Email',
				Value : email,
			},
            {
                $Type : 'UI.DataField',
                Label : 'Origin Planet',
                Value : originPlanet.name,
                ![@Common.FieldControl] : #ReadOnly,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Department',
                Value : department.name,
                ![@Common.FieldControl] : #ReadOnly,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Position',
                Value : position.name,
                ![@Common.FieldControl] : #ReadOnly,
            },
			{
				$Type : 'UI.DataField',
				Label : 'Wormhole Navigation Skill',
				Value : wormholeNavigationSkill,
			},
			{
				$Type : 'UI.DataField',
				Label : 'Spacesuit Color',
				Value : spacesuitColor,
			},
            {
                $Type : 'UI.DataField',
                Label : 'Stardust',
                Value : stardustCollection,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Stardust Status',
                Value : stardustStatus,
                Criticality : stardustCriticality,
                ![@Common.FieldControl] : #ReadOnly,
            },
		],
	},
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Spacefarer Details',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'First Name',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Last Name',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Origin Planet',
            Value : originPlanet.name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Department',
            Value : department.name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Position',
            Value : position.name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Navigation Skill',
            Value : wormholeNavigationSkill,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Spacesuit Color',
            Value : spacesuitColor,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Stardust',
            Value : stardustCollection,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Stardust Status',
            Value : stardustStatus,
            Criticality : stardustCriticality,
        },
    ],
    UI.SelectionFields : [
        originPlanet.name,
        department.name,
        position.name,
        spacesuitColor,
        wormholeNavigationSkill,
    ],
);

annotate service.Spacefarers with {
    firstName @title : 'First Name';
    lastName @title : 'Last Name';
    email @title : 'Email';
    stardustCollection @title : 'Stardust Collection';
    wormholeNavigationSkill @title : 'Wormhole Navigation Skill';
    spacesuitColor @title : 'Spacesuit Color';

    originPlanet @title: 'Origin Planet';
    department @title: 'Department';
    position @title: 'Position';

    stardustStatus @title : 'Stardust Status';
};

annotate service.Planets with {
    ID @title : 'ID';
    name @title : 'Origin Planet';
    description @title : 'Description';
};

annotate service.Departments with {
    ID @title : 'ID';
    name @title : 'Department';
    description @title : 'Description';
};

annotate service.Positions with {
    ID @title : 'ID';
    name @title : 'Position';
    description @title : 'Description';
};

annotate service.Spacefarers with {
    spacesuitColor @(
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            Label : 'Spacesuit Color',
            CollectionPath : 'SpacesuitColors',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : spacesuitColor,
                    ValueListProperty : 'code',
                },
            ],
        }
    );
};

annotate service.Spacefarers with {
    originPlanet @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Planets',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : originPlanet_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

annotate service.Spacefarers with {
    department @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Departments',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : department_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

annotate service.Spacefarers with {
    position @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Positions',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : position_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterIn',
                LocalDataProperty : department_ID,
                ValueListProperty : 'department_ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

annotate service.Spacefarers with {
    firstName                @Core.Immutable;
    lastName                 @Core.Immutable;
    email                    @Core.Immutable;
    originPlanet             @Core.Immutable;
    department               @Core.Immutable;
    position                 @Core.Immutable;
    wormholeNavigationSkill  @Core.Immutable;
};