using AdminService as service from '../../srv/services';
annotate service.Estudiantes with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'NombreAlumno',
                Value : NombreAlumno,
            },
            {
                $Type : 'UI.DataField',
                Label : 'FechaNacimiento',
                Value : FechaNacimiento,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Telefono',
                Value : Telefono,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : Email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : Status,
                Criticality : Critico,
            },
            {
                $Type : 'UI.DataField',
                Value : Critico,
                Label : 'Critico',
            },
            {
                $Type : 'UI.DataField',
                Value : Comentario,
                Label : 'Comentario',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'NombreAlumno',
            Value : NombreAlumno,
        },
        {
            $Type : 'UI.DataField',
            Label : 'FechaNacimiento',
            Value : FechaNacimiento,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Telefono',
            Value : Telefono,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : Email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : Status,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'AdminService.notificaAlumno',
            Label : 'Notifica Alumno',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'AdminService.inactivaAlumno',
            Label : 'Inactiva Alumno',![@UI.Hidden] : {$edmJson: {$If: [
                {$Eq: [
                    {$Path: 'IsActiveEntity'},
                    false // IsActiveEntity=false means you are in edit mode
                ]},
                true, // If in edit mode, set to hidden
                false
            ]}}
        },
    ],
);

annotate service.Estudiantes with {
    Curso @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Cursos',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : Curso_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'NombreAsignatura',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'MaxEstudiantes',
            },
        ],
    }
};

annotate service.Estudiantes with {
    Critico @Common.FieldControl : #ReadOnly
};

annotate service.Estudiantes with {
    Comentario @Common.FieldControl : #ReadOnly
};



