using EstudiantesService as service from '../../srv/services';
annotate service.EstudiantesByCursos with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'NombreAsignatura',
                Value : NombreAsignatura,
            },
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
            Label : 'NombreAsignatura',
            Value : NombreAsignatura,
        },
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
    ],
);

